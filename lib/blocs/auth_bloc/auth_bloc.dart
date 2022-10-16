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
        emit(AuthState.authenticated(user: event.user!));
      }
    });


    on<AuthChangePasswordEvent>((event,emit) async{
      AuthState previousState = state;
      try{
        String email = state.user!.email!;
        emit(AuthState.loading());
        await _authRepository.changePassword(email, event.oldPassword, event.newPassword);
      } on CustomError catch(e){
        emitError(emit, previousState, e);
      }
    });
    //On firebase auth multifactor integration error, catch and execute
    /*
          final hint = e.resolver.hints.first as PhoneMultiFactorInfo;
          await _authRepository.verifySignInPhoneNumber(hint: hint, resolver: e.resolver, onVerificationFailed: (e) async{
            emit(previousState);
          }, onCodeSent: (id){
            add(AuthEvent.signInVerificationPhoneCodeSent(resolver: e.resolver, hint: hint, verificationId: id));
          });*/

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
      } on CustomError catch(e){
        emitError(emit, previousState, e);
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
