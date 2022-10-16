part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.signInWithEmailAndPassword({required String email, required String password}) = AuthSignInWithEmailAndPasswordEvent;
  const factory AuthEvent.signUpWithEmailAndPassword({required String email, required String password, required String username}) = AuthSignUpWithEmailAndPasswordEvent;
  const factory AuthEvent.signInWithGoogleAccount() = AuthSignInWithGoogleAccountEvent;
  const factory AuthEvent.signInWithFacebookAccount() = AuthSignInWithFacebookAccountEvent;
  const factory AuthEvent.signOut() = AuthSignOutEvent;
  const factory AuthEvent.backToSigning() = AuthBackToSigningEvent;
  const factory AuthEvent.changeAuthUser({required User? user}) = AuthChangeAuthUserEvent;

  const factory AuthEvent.requestPasswordRecovery() = AuthRequestPasswordRecoveryEvent;
  const factory AuthEvent.changePassword({required String oldPassword, required String newPassword}) = AuthChangePasswordEvent;
  const factory AuthEvent.enterEmailForRecovery({required String email}) = AuthEnterEmailForRecoveryEvent;
  const factory AuthEvent.confirmEmailRecovery() = AuthConfirmEmailRecoveryEvent;
}
