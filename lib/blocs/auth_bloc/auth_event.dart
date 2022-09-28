part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.signInWithEmailAndPassword({required String email, required String password}) = AuthSignInWithEmailAndPasswordEvent;
  const factory AuthEvent.signUpWithEmailAndPassword({required String email, required String password, required String username}) = AuthSignUpWithEmailAndPasswordEvent;
  const factory AuthEvent.signInWithGoogleAccount() = AuthSignInWithGoogleAccountEvent;
  const factory AuthEvent.signInWithFacebookAccount() = AuthSignInWithFacebookAccountEvent;
  const factory AuthEvent.signOut() = AuthSignOutEvent;
  const factory AuthEvent.sendEmailVerificationMail() = AuthSendEmailVerificationMailEvent;
  const factory AuthEvent.backToSigning() = AuthBackToSigningEvent;
  const factory AuthEvent.changeAuthUser({required User? user}) = AuthChangeAuthUserEvent;

  const factory AuthEvent.enterPhoneForVerification({required String phone}) = AuthEnterPhoneForVerificationEvent;
  const factory AuthEvent.verificationPhoneCodeSent({required String phone, required String verificationId}) = AuthVerificationPhoneCodeSentEvent;
  const factory AuthEvent.verifyPhoneCode({required String code}) = AuthVerifyPhoneCodeEvent;

  const factory AuthEvent.changePassword({required String oldPassword, required String newPassword}) = AuthChangePasswordEvent;

  const factory AuthEvent.signInVerificationPhoneCodeSent({required MultiFactorResolver resolver, required MultiFactorInfo hint,required String verificationId}) = AuthSignInVerificationPhoneCodeSentEvent;
  const factory AuthEvent.signInVerifyPhoneCode({required String code}) = AuthSignInVerifyPhoneCodeEvent;

  const factory AuthEvent.requestPasswordRecovery() = AuthRequestPasswordRecoveryEvent;
  const factory AuthEvent.enterEmailForRecovery({required String email}) = AuthEnterEmailForRecoveryEvent;
  const factory AuthEvent.confirmEmailRecovery() = AuthConfirmEmailRecoveryEvent;
}
