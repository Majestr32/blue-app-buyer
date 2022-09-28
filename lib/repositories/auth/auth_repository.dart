
import 'dart:developer';

import 'package:blue/custom_error.dart';
import 'package:blue/services/user/user_service_contract.dart';
import 'package:blue/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository{
  final fb.FirebaseAuth _firebaseAuth;
  final IUserServiceContract _userService;
  final GoogleSignIn _googleSignIn;

  Stream<fb.User?> get user => _firebaseAuth.userChanges();

  Future signUp({required String email, required String password, required String username}) async{
    try{
      final cred = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      await cred.user!.updateDisplayName(username);
      await _userService.createUser(uid: cred.user!.uid, username: username);
    }on fb.FirebaseAuthException catch(e){
      switch(e.code){
        case 'email-already-in-use':
          throw CustomError(error: 'Correo electrónico ya está en uso', code: e.code);
        case 'invalid-email':
          throw CustomError(error: 'El correo electrónico ingresado no es válido', code: e.code);
        case 'operation-not-allowed':
          throw CustomError(error: 'El inicio de sesión con correo electrónico/contraseña está deshabilitado', code: e.code);
        case 'weak-password':
          throw CustomError(error: 'La contraseña es demasiado débil', code: e.code);
        default:
          throw CustomError(error: e.message?? 'Algo salió mal', code: e.code);
      }
    } catch(e){
      throw CustomError(error: 'Error del servidor, intente más tarde', code: 'server-error');
    }
  }

  Future<void> addUserToDbIfNeeded(String uid, String username) async{
    if((await _userService.getUserById(uid: uid)) == null){
      await _userService.createUser(uid: uid, username: username);
    }
  }

  Future<void> changePassword(String email,String oldPassword, String newPassword) async{
    try{
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: oldPassword);
      await _firebaseAuth.currentUser!.reauthenticateWithCredential(credential);
      await _firebaseAuth.currentUser!.updatePassword(newPassword);
    } on FirebaseAuthMultiFactorException catch(e){
        rethrow;
    } on FirebaseAuthException catch(e){
        throw CustomError(error: e.runtimeType.toString(), code: e.code);
    }
  }

  Future<void> recoverPassword(String email) async{
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }
  Future<bool> isPhoneVerified() async{
    final currentUser = (await user.first)!;
    return currentUser.phoneNumber != null;
  }
  ///On code sent returns [verificationId]
  Future<void> verifyPhoneNumber(
      {required String phone,
      required Function(FirebaseAuthException) onVerificationFailed,
      required Function(String) onCodeSent}) async{
    final session = await _firebaseAuth.currentUser!.multiFactor.getSession();
    await _firebaseAuth.verifyPhoneNumber(
        multiFactorSession: session,
        phoneNumber: phone,
          verificationCompleted: (credentials) async{

          }, verificationFailed: onVerificationFailed, codeSent: (verificationId,resendToken){
        onCodeSent(verificationId);
      }, codeAutoRetrievalTimeout: (verificationId){});
  }
  Future<void> confirmSignInPhoneCode(fb.MultiFactorResolver resolver,String verificationId,String code) async{
    final credential = PhoneAuthProvider.credential(  verificationId: verificationId,  smsCode: code,);
    try{
      await resolver.resolveSignIn(PhoneMultiFactorGenerator.getAssertion(    credential,  ));
    }on fb.FirebaseAuthException catch(e){
      throw CustomError(error: e.message!, code: e.code);
    }on PlatformException catch(e){
      if(e.message!.contains("El código de verificación de SMS utilizado para crear la credencial de autenticación del teléfono no es válido")){
        throw CustomError(error: 'El codigo esta mal', code: e.code);
      }else{
        throw CustomError(error: 'Sesión caducada, inténtalo de nuevo', code: e.code);
      }
    }
  }
  Future<void> verifySignInPhoneNumber(
      {required fb.MultiFactorResolver resolver,
        required PhoneMultiFactorInfo hint,
        required Function(FirebaseAuthException) onVerificationFailed,
        required Function(String) onCodeSent}) async{
    await FirebaseAuth.instance.verifyPhoneNumber(
        multiFactorInfo: hint,
        multiFactorSession: resolver.session,
        verificationCompleted: (_) async{

        }, verificationFailed: onVerificationFailed, codeSent: (verificationId,resendToken){
      onCodeSent(verificationId);
    }, codeAutoRetrievalTimeout: (_){});
  }
  Future<void> confirmPhoneCode(String verificationId,String code) async{
    try{
      final currentUser = (await user.first)!;
      final credential = PhoneAuthProvider.credential(  verificationId: verificationId,  smsCode: code,);
      final assertion = PhoneMultiFactorGenerator.getAssertion(    credential,  );
      await currentUser.multiFactor.enroll(assertion);
      //await _userService.activateUser(uid: currentUser.uid, phone: );
    }on fb.FirebaseAuthException catch(e){
      throw CustomError(error: e.message!, code: e.code);
    }on PlatformException catch(e){
      if(e.message!.contains("El código de verificación de SMS utilizado para crear la credencial de autenticación del teléfono no es válido")){
        throw CustomError(error: 'El código está mal', code: e.code);
      }else{
        throw CustomError(error: 'Sesión caducada, inténtalo de nuevo', code: e.code);
      }
    }
    try{
    }catch(e){
      rethrow;
    }
  }

  Future signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    if(loginResult.status != LoginStatus.success){
      throw const CustomError(error: 'Error al iniciar sesión con facebook', code: 'facebook-sign-in-failed');
    }
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
    await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  Future sendEmailVerificationMail() async{
    try{
      if(!_firebaseAuth.currentUser!.emailVerified){
        _firebaseAuth.currentUser!.sendEmailVerification();
      }
    }on fb.FirebaseAuthException catch(e){
      throw CustomError(error: e.message!, code: e.code);
    }
  }

  Future<fb.UserCredential> signIn({required String email, required String password}) async {
    try{
      final cred = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      if(!cred.user!.emailVerified){
        cred.user!.sendEmailVerification();
        throw CustomError(error: 'Verifique el correo electrónico antes de configurar la autenticación de factor de teléfono', code: 'email-verification-required');
      }
      return cred;
    }on fb.FirebaseAuthMultiFactorException catch(e){
      rethrow;
    } on fb.FirebaseAuthException catch(e){
      switch(e.code){
        case 'user-disabled':
          throw CustomError(error: 'Esta cuenta ha sido baneada', code: e.code);
        case 'second-factor-required':
          throw CustomError(error: e.toString(), code: e.code);
        default:
          throw CustomError(error: e.message!, code: e.code);
      }
    }
  }

  Future signInWithGoogle() async{
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if(googleUser == null){
        throw const CustomError(error: 'Error al iniciar sesión con gmail', code: 'gmail-sign-in-failed');
      }

      final GoogleSignInAuthentication? googleAuth = await googleUser.authentication;
      final credential = fb.GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await fb.FirebaseAuth.instance.signInWithCredential(credential);
  }
  Future signOut() async{
    bool googleSigned = await _googleSignIn.isSignedIn();
    if(googleSigned){
      await _googleSignIn.disconnect();
    }
    await _firebaseAuth.signOut();
  }

  AuthRepository({
    required fb.FirebaseAuth firebaseAuth,
    required IUserServiceContract userService,
    required GoogleSignIn googleSignIn,
  })  : _firebaseAuth = firebaseAuth,
        _userService = userService,
        _googleSignIn = googleSignIn;
}