part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const AuthState._();
  User? get user => maybeMap(
      needsPhoneVerification: (state) => state.user,
      enteredPhoneForVerification: (state) => state.user,
      authenticated: (state) => state.user,
      orElse: () => null);

  String? get verificationPhone => maybeMap(
      enteredPhoneForVerification: (state) => state.phone,
      readyForSignInPhoneVerification: (state) => (state.resolver.hints.first as PhoneMultiFactorInfo).phoneNumber,
      orElse: () => null);

  const factory AuthState.initial() = AuthInitialState;
  const factory AuthState.loading() = AuthLoadingState;
  const factory AuthState.error({required CustomError error}) = AuthErrorState;

  const factory AuthState.needsPhoneVerification({required User user}) = AuthNeedsPhoneVerificationState;
  const factory AuthState.enteredPhoneForVerification({required User user, required String verificationId, required String phone}) = AuthEnteredPhoneForVerificationState;

  const factory AuthState.readyForSignInPhoneVerification({required String verificationId, required MultiFactorResolver resolver}) = AuthReadyForSignInPhoneVerificationState;

  const factory AuthState.forgotPassword() = AuthForgotPasswordState;
  const factory AuthState.recoveryEmailPasswordLinkSent({required String email}) = AuthRecoveryEmailPasswordLinkSentState;

  const factory AuthState.authenticated({required User user}) = AuthAuthenticatedState;
  const factory AuthState.notAuthenticated() = AuthNotAuthenticatedState;
}
