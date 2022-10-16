part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const AuthState._();
  User? get user => maybeMap(
      authenticated: (state) => state.user,
      orElse: () => null);

  const factory AuthState.initial() = AuthInitialState;
  const factory AuthState.loading() = AuthLoadingState;
  const factory AuthState.error({required CustomError error}) = AuthErrorState;

  const factory AuthState.forgotPassword() = AuthForgotPasswordState;
  const factory AuthState.recoveryEmailPasswordLinkSent({required String email}) = AuthRecoveryEmailPasswordLinkSentState;

  const factory AuthState.authenticated({required User user}) = AuthAuthenticatedState;
  const factory AuthState.notAuthenticated() = AuthNotAuthenticatedState;
}
