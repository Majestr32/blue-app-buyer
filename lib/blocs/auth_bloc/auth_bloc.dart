import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:blue/custom_error.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../repositories/auth/auth_repository.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  late final StreamSubscription _authUserChangedSubscription;


  AuthBloc({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository, super(AuthState.initial()){
    _authUserChangedSubscription = _authRepository.user.listen((fbUser) async{
      if(fbUser == null){
        add(AuthChangeAuthUserEvent(user: null));
        return;
      }
      add(AuthChangeAuthUserEvent(user: fbUser));
    });

    on<AuthChangeAuthUserEvent>((event,emit) async{
      if(event.user == null){
        emit(AuthState.notAuthenticated());
      }else{
        await _authRepository.addUserToDbIfNeeded(event.user!.uid, event.user!.displayName ?? '');
        final phoneVerifications = (await event.user!.multiFactor.getEnrolledFactors()).whereType<PhoneMultiFactorInfo>().toList();
        if(phoneVerifications.isNotEmpty){
          emit(AuthState.authenticated(user: event.user!));
        }else{
          emit(AuthState.needsPhoneVerification(user: event.user!));
        }
      }
    });

    on<AuthEnterPhoneForVerificationEvent>((event,emit) async{
      await _authRepository.verifyPhoneNumber(phone: event.phone, onVerificationFailed: (e) async{
          add(AuthEvent.signOut());
        }, onCodeSent: (id){
          add(AuthEvent.verificationPhoneCodeSent(phone: event.phone, verificationId: id));
        });
    });

    on<AuthChangePasswordEvent>((event,emit) async{
      AuthState previousState = state;
      try{
        String email = state.user!.email!;
        emit(AuthState.loading());
        await _authRepository.changePassword(email, event.oldPassword, event.newPassword);
      } on FirebaseAuthMultiFactorException catch(e){
        log(e.message!);
          final hint = e.resolver.hints.first as PhoneMultiFactorInfo;
          await _authRepository.verifySignInPhoneNumber(hint: hint, resolver: e.resolver, onVerificationFailed: (e) async{
            emit(previousState);
          }, onCodeSent: (id){
            add(AuthEvent.signInVerificationPhoneCodeSent(resolver: e.resolver, hint: hint, verificationId: id));
          });
      }on CustomError catch(e){
        emitError(emit, previousState, e);
      }
    });

    on<AuthVerificationPhoneCodeSentEvent>((event,emit) async{
      emit(AuthState.enteredPhoneForVerification(user: state.user!,verificationId: event.verificationId,phone: event.phone));
    });

    on<AuthVerifyPhoneCodeEvent>((event,emit) async{
      log(state.toString());
      AuthState previousState = state;
      try{
        final User user = state.user!;
        final String verificationId = (state as AuthEnteredPhoneForVerificationState).verificationId;
        await _authRepository.confirmPhoneCode(verificationId,event.code);
        emit(AuthState.authenticated(user: user));
      } on CustomError catch(e){
        emitError(emit, previousState, e);
        if(e.error.contains("expired")){
          add(AuthEvent.signOut());
        }
      }
    });

    on<AuthSignOutEvent>((event,emit) async{
      emit(AuthState.loading());
      await Future.delayed(Duration(milliseconds: 100));
      await _authRepository.signOut();
    });
    on<AuthRequestPasswordRecoveryEvent>((event,emit) async{
      emit(AuthState.forgotPassword());
    });
    on<AuthEnterEmailForRecoveryEvent>((event,emit) async{
      await _authRepository.recoverPassword(event.email);
      emit(AuthState.recoveryEmailPasswordLinkSent(email: event.email));
    });
    on<AuthBackToSigningEvent>((event,emit) async{
      emit(AuthState.notAuthenticated());
    });
    on<AuthSignInWithFacebookAccountEvent>((event,emit) async{
      AuthState previousState = state;
      add(AuthEvent.sendEmailVerificationMail());
      emit(AuthState.loading());
      try{
        await _authRepository.signInWithFacebook();
      }on CustomError catch(e){
        emitError(emit, previousState, e);
      }
    });
    on<AuthSignInWithGoogleAccountEvent>((event, emit) async{
      AuthState previousState = state;
      emit(AuthState.loading());
      try{
        await _authRepository.signInWithGoogle();
      }on CustomError catch(e){
        emitError(emit, previousState, e);
      }
    });
    on<AuthSignInWithEmailAndPasswordEvent>((event, emit) async{
      AuthState previousState = state;
      emit(AuthState.loading());
      try{
        await _authRepository.signIn(email: event.email, password: event.password);
      } on FirebaseAuthMultiFactorException catch(e){
        final hint = e.resolver.hints.first as PhoneMultiFactorInfo;
        await _authRepository.verifySignInPhoneNumber(hint: hint, resolver: e.resolver, onVerificationFailed: (e) async{
          log(e.toString());
          add(AuthEvent.signOut());
        }, onCodeSent: (id){
          add(AuthEvent.signInVerificationPhoneCodeSent(resolver: e.resolver, hint: hint, verificationId: id));
        });
        //emit(AuthState(phone: e.phoneNumber!, user: state.user!));
      } on CustomError catch(e){
        emitError(emit, previousState, e);
      }
    });
    on<AuthSignInVerificationPhoneCodeSentEvent>((event,emit) async{
      emit(AuthState.readyForSignInPhoneVerification(resolver: event.resolver, verificationId: event.verificationId));
    });
    on<AuthSignInVerifyPhoneCodeEvent>((event,emit) async{
      final previousState = state;
      try{
        final resolver = (state as AuthReadyForSignInPhoneVerificationState).resolver;
        final verificationId = (state as AuthReadyForSignInPhoneVerificationState).verificationId;
        await _authRepository.confirmSignInPhoneCode(resolver, verificationId, event.code);
      } on CustomError catch(e){
        emitError(emit, previousState, e);
        if(e.error.contains("expired")){
          add(AuthEvent.signOut());
        }
      }
    });
    on<AuthSendEmailVerificationMailEvent>((event,emit) async{
      try{
        await _authRepository.sendEmailVerificationMail();
      } on CustomError catch(e){
        emitError(emit, state, e);
      }
    });
    on<AuthSignUpWithEmailAndPasswordEvent>((event, emit) async{
      AuthState previousState = state;
      emit(AuthState.loading());
      try{
        await _authRepository.signUp(email: event.email, username: event.username, password: event.password);
      } on CustomError catch(e){
        emitError(emit, previousState, e);
      }
    });
  }

  void emitError(Emitter emit, AuthState previousState,CustomError e){
    emit(AuthState.error(error: e));
    emit(previousState);
  }

  @override
  Future<void> close() {
    _authUserChangedSubscription.cancel();
    return super.close();
  }

}
