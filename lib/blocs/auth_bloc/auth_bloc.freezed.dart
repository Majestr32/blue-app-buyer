// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password)
        signInWithEmailAndPassword,
    required TResult Function(String email, String password, String username)
        signUpWithEmailAndPassword,
    required TResult Function() signInWithGoogleAccount,
    required TResult Function() signInWithFacebookAccount,
    required TResult Function() signOut,
    required TResult Function() backToSigning,
    required TResult Function(User? user) changeAuthUser,
    required TResult Function() requestPasswordRecovery,
    required TResult Function(String oldPassword, String newPassword)
        changePassword,
    required TResult Function(String email) enterEmailForRecovery,
    required TResult Function() confirmEmailRecovery,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email, String password)? signInWithEmailAndPassword,
    TResult Function(String email, String password, String username)?
        signUpWithEmailAndPassword,
    TResult Function()? signInWithGoogleAccount,
    TResult Function()? signInWithFacebookAccount,
    TResult Function()? signOut,
    TResult Function()? backToSigning,
    TResult Function(User? user)? changeAuthUser,
    TResult Function()? requestPasswordRecovery,
    TResult Function(String oldPassword, String newPassword)? changePassword,
    TResult Function(String email)? enterEmailForRecovery,
    TResult Function()? confirmEmailRecovery,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signInWithEmailAndPassword,
    TResult Function(String email, String password, String username)?
        signUpWithEmailAndPassword,
    TResult Function()? signInWithGoogleAccount,
    TResult Function()? signInWithFacebookAccount,
    TResult Function()? signOut,
    TResult Function()? backToSigning,
    TResult Function(User? user)? changeAuthUser,
    TResult Function()? requestPasswordRecovery,
    TResult Function(String oldPassword, String newPassword)? changePassword,
    TResult Function(String email)? enterEmailForRecovery,
    TResult Function()? confirmEmailRecovery,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthSignInWithEmailAndPasswordEvent value)
        signInWithEmailAndPassword,
    required TResult Function(AuthSignUpWithEmailAndPasswordEvent value)
        signUpWithEmailAndPassword,
    required TResult Function(AuthSignInWithGoogleAccountEvent value)
        signInWithGoogleAccount,
    required TResult Function(AuthSignInWithFacebookAccountEvent value)
        signInWithFacebookAccount,
    required TResult Function(AuthSignOutEvent value) signOut,
    required TResult Function(AuthBackToSigningEvent value) backToSigning,
    required TResult Function(AuthChangeAuthUserEvent value) changeAuthUser,
    required TResult Function(AuthRequestPasswordRecoveryEvent value)
        requestPasswordRecovery,
    required TResult Function(AuthChangePasswordEvent value) changePassword,
    required TResult Function(AuthEnterEmailForRecoveryEvent value)
        enterEmailForRecovery,
    required TResult Function(AuthConfirmEmailRecoveryEvent value)
        confirmEmailRecovery,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthSignInWithEmailAndPasswordEvent value)?
        signInWithEmailAndPassword,
    TResult Function(AuthSignUpWithEmailAndPasswordEvent value)?
        signUpWithEmailAndPassword,
    TResult Function(AuthSignInWithGoogleAccountEvent value)?
        signInWithGoogleAccount,
    TResult Function(AuthSignInWithFacebookAccountEvent value)?
        signInWithFacebookAccount,
    TResult Function(AuthSignOutEvent value)? signOut,
    TResult Function(AuthBackToSigningEvent value)? backToSigning,
    TResult Function(AuthChangeAuthUserEvent value)? changeAuthUser,
    TResult Function(AuthRequestPasswordRecoveryEvent value)?
        requestPasswordRecovery,
    TResult Function(AuthChangePasswordEvent value)? changePassword,
    TResult Function(AuthEnterEmailForRecoveryEvent value)?
        enterEmailForRecovery,
    TResult Function(AuthConfirmEmailRecoveryEvent value)? confirmEmailRecovery,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthSignInWithEmailAndPasswordEvent value)?
        signInWithEmailAndPassword,
    TResult Function(AuthSignUpWithEmailAndPasswordEvent value)?
        signUpWithEmailAndPassword,
    TResult Function(AuthSignInWithGoogleAccountEvent value)?
        signInWithGoogleAccount,
    TResult Function(AuthSignInWithFacebookAccountEvent value)?
        signInWithFacebookAccount,
    TResult Function(AuthSignOutEvent value)? signOut,
    TResult Function(AuthBackToSigningEvent value)? backToSigning,
    TResult Function(AuthChangeAuthUserEvent value)? changeAuthUser,
    TResult Function(AuthRequestPasswordRecoveryEvent value)?
        requestPasswordRecovery,
    TResult Function(AuthChangePasswordEvent value)? changePassword,
    TResult Function(AuthEnterEmailForRecoveryEvent value)?
        enterEmailForRecovery,
    TResult Function(AuthConfirmEmailRecoveryEvent value)? confirmEmailRecovery,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res> implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  final AuthEvent _value;
  // ignore: unused_field
  final $Res Function(AuthEvent) _then;
}

/// @nodoc
abstract class _$$AuthSignInWithEmailAndPasswordEventCopyWith<$Res> {
  factory _$$AuthSignInWithEmailAndPasswordEventCopyWith(
          _$AuthSignInWithEmailAndPasswordEvent value,
          $Res Function(_$AuthSignInWithEmailAndPasswordEvent) then) =
      __$$AuthSignInWithEmailAndPasswordEventCopyWithImpl<$Res>;
  $Res call({String email, String password});
}

/// @nodoc
class __$$AuthSignInWithEmailAndPasswordEventCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res>
    implements _$$AuthSignInWithEmailAndPasswordEventCopyWith<$Res> {
  __$$AuthSignInWithEmailAndPasswordEventCopyWithImpl(
      _$AuthSignInWithEmailAndPasswordEvent _value,
      $Res Function(_$AuthSignInWithEmailAndPasswordEvent) _then)
      : super(_value, (v) => _then(v as _$AuthSignInWithEmailAndPasswordEvent));

  @override
  _$AuthSignInWithEmailAndPasswordEvent get _value =>
      super._value as _$AuthSignInWithEmailAndPasswordEvent;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_$AuthSignInWithEmailAndPasswordEvent(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthSignInWithEmailAndPasswordEvent
    implements AuthSignInWithEmailAndPasswordEvent {
  const _$AuthSignInWithEmailAndPasswordEvent(
      {required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.signInWithEmailAndPassword(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthSignInWithEmailAndPasswordEvent &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$$AuthSignInWithEmailAndPasswordEventCopyWith<
          _$AuthSignInWithEmailAndPasswordEvent>
      get copyWith => __$$AuthSignInWithEmailAndPasswordEventCopyWithImpl<
          _$AuthSignInWithEmailAndPasswordEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password)
        signInWithEmailAndPassword,
    required TResult Function(String email, String password, String username)
        signUpWithEmailAndPassword,
    required TResult Function() signInWithGoogleAccount,
    required TResult Function() signInWithFacebookAccount,
    required TResult Function() signOut,
    required TResult Function() backToSigning,
    required TResult Function(User? user) changeAuthUser,
    required TResult Function() requestPasswordRecovery,
    required TResult Function(String oldPassword, String newPassword)
        changePassword,
    required TResult Function(String email) enterEmailForRecovery,
    required TResult Function() confirmEmailRecovery,
  }) {
    return signInWithEmailAndPassword(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email, String password)? signInWithEmailAndPassword,
    TResult Function(String email, String password, String username)?
        signUpWithEmailAndPassword,
    TResult Function()? signInWithGoogleAccount,
    TResult Function()? signInWithFacebookAccount,
    TResult Function()? signOut,
    TResult Function()? backToSigning,
    TResult Function(User? user)? changeAuthUser,
    TResult Function()? requestPasswordRecovery,
    TResult Function(String oldPassword, String newPassword)? changePassword,
    TResult Function(String email)? enterEmailForRecovery,
    TResult Function()? confirmEmailRecovery,
  }) {
    return signInWithEmailAndPassword?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signInWithEmailAndPassword,
    TResult Function(String email, String password, String username)?
        signUpWithEmailAndPassword,
    TResult Function()? signInWithGoogleAccount,
    TResult Function()? signInWithFacebookAccount,
    TResult Function()? signOut,
    TResult Function()? backToSigning,
    TResult Function(User? user)? changeAuthUser,
    TResult Function()? requestPasswordRecovery,
    TResult Function(String oldPassword, String newPassword)? changePassword,
    TResult Function(String email)? enterEmailForRecovery,
    TResult Function()? confirmEmailRecovery,
    required TResult orElse(),
  }) {
    if (signInWithEmailAndPassword != null) {
      return signInWithEmailAndPassword(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthSignInWithEmailAndPasswordEvent value)
        signInWithEmailAndPassword,
    required TResult Function(AuthSignUpWithEmailAndPasswordEvent value)
        signUpWithEmailAndPassword,
    required TResult Function(AuthSignInWithGoogleAccountEvent value)
        signInWithGoogleAccount,
    required TResult Function(AuthSignInWithFacebookAccountEvent value)
        signInWithFacebookAccount,
    required TResult Function(AuthSignOutEvent value) signOut,
    required TResult Function(AuthBackToSigningEvent value) backToSigning,
    required TResult Function(AuthChangeAuthUserEvent value) changeAuthUser,
    required TResult Function(AuthRequestPasswordRecoveryEvent value)
        requestPasswordRecovery,
    required TResult Function(AuthChangePasswordEvent value) changePassword,
    required TResult Function(AuthEnterEmailForRecoveryEvent value)
        enterEmailForRecovery,
    required TResult Function(AuthConfirmEmailRecoveryEvent value)
        confirmEmailRecovery,
  }) {
    return signInWithEmailAndPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthSignInWithEmailAndPasswordEvent value)?
        signInWithEmailAndPassword,
    TResult Function(AuthSignUpWithEmailAndPasswordEvent value)?
        signUpWithEmailAndPassword,
    TResult Function(AuthSignInWithGoogleAccountEvent value)?
        signInWithGoogleAccount,
    TResult Function(AuthSignInWithFacebookAccountEvent value)?
        signInWithFacebookAccount,
    TResult Function(AuthSignOutEvent value)? signOut,
    TResult Function(AuthBackToSigningEvent value)? backToSigning,
    TResult Function(AuthChangeAuthUserEvent value)? changeAuthUser,
    TResult Function(AuthRequestPasswordRecoveryEvent value)?
        requestPasswordRecovery,
    TResult Function(AuthChangePasswordEvent value)? changePassword,
    TResult Function(AuthEnterEmailForRecoveryEvent value)?
        enterEmailForRecovery,
    TResult Function(AuthConfirmEmailRecoveryEvent value)? confirmEmailRecovery,
  }) {
    return signInWithEmailAndPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthSignInWithEmailAndPasswordEvent value)?
        signInWithEmailAndPassword,
    TResult Function(AuthSignUpWithEmailAndPasswordEvent value)?
        signUpWithEmailAndPassword,
    TResult Function(AuthSignInWithGoogleAccountEvent value)?
        signInWithGoogleAccount,
    TResult Function(AuthSignInWithFacebookAccountEvent value)?
        signInWithFacebookAccount,
    TResult Function(AuthSignOutEvent value)? signOut,
    TResult Function(AuthBackToSigningEvent value)? backToSigning,
    TResult Function(AuthChangeAuthUserEvent value)? changeAuthUser,
    TResult Function(AuthRequestPasswordRecoveryEvent value)?
        requestPasswordRecovery,
    TResult Function(AuthChangePasswordEvent value)? changePassword,
    TResult Function(AuthEnterEmailForRecoveryEvent value)?
        enterEmailForRecovery,
    TResult Function(AuthConfirmEmailRecoveryEvent value)? confirmEmailRecovery,
    required TResult orElse(),
  }) {
    if (signInWithEmailAndPassword != null) {
      return signInWithEmailAndPassword(this);
    }
    return orElse();
  }
}

abstract class AuthSignInWithEmailAndPasswordEvent implements AuthEvent {
  const factory AuthSignInWithEmailAndPasswordEvent(
      {required final String email,
      required final String password}) = _$AuthSignInWithEmailAndPasswordEvent;

  String get email;
  String get password;
  @JsonKey(ignore: true)
  _$$AuthSignInWithEmailAndPasswordEventCopyWith<
          _$AuthSignInWithEmailAndPasswordEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthSignUpWithEmailAndPasswordEventCopyWith<$Res> {
  factory _$$AuthSignUpWithEmailAndPasswordEventCopyWith(
          _$AuthSignUpWithEmailAndPasswordEvent value,
          $Res Function(_$AuthSignUpWithEmailAndPasswordEvent) then) =
      __$$AuthSignUpWithEmailAndPasswordEventCopyWithImpl<$Res>;
  $Res call({String email, String password, String username});
}

/// @nodoc
class __$$AuthSignUpWithEmailAndPasswordEventCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res>
    implements _$$AuthSignUpWithEmailAndPasswordEventCopyWith<$Res> {
  __$$AuthSignUpWithEmailAndPasswordEventCopyWithImpl(
      _$AuthSignUpWithEmailAndPasswordEvent _value,
      $Res Function(_$AuthSignUpWithEmailAndPasswordEvent) _then)
      : super(_value, (v) => _then(v as _$AuthSignUpWithEmailAndPasswordEvent));

  @override
  _$AuthSignUpWithEmailAndPasswordEvent get _value =>
      super._value as _$AuthSignUpWithEmailAndPasswordEvent;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? username = freezed,
  }) {
    return _then(_$AuthSignUpWithEmailAndPasswordEvent(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthSignUpWithEmailAndPasswordEvent
    implements AuthSignUpWithEmailAndPasswordEvent {
  const _$AuthSignUpWithEmailAndPasswordEvent(
      {required this.email, required this.password, required this.username});

  @override
  final String email;
  @override
  final String password;
  @override
  final String username;

  @override
  String toString() {
    return 'AuthEvent.signUpWithEmailAndPassword(email: $email, password: $password, username: $username)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthSignUpWithEmailAndPasswordEvent &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality().equals(other.username, username));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(username));

  @JsonKey(ignore: true)
  @override
  _$$AuthSignUpWithEmailAndPasswordEventCopyWith<
          _$AuthSignUpWithEmailAndPasswordEvent>
      get copyWith => __$$AuthSignUpWithEmailAndPasswordEventCopyWithImpl<
          _$AuthSignUpWithEmailAndPasswordEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password)
        signInWithEmailAndPassword,
    required TResult Function(String email, String password, String username)
        signUpWithEmailAndPassword,
    required TResult Function() signInWithGoogleAccount,
    required TResult Function() signInWithFacebookAccount,
    required TResult Function() signOut,
    required TResult Function() backToSigning,
    required TResult Function(User? user) changeAuthUser,
    required TResult Function() requestPasswordRecovery,
    required TResult Function(String oldPassword, String newPassword)
        changePassword,
    required TResult Function(String email) enterEmailForRecovery,
    required TResult Function() confirmEmailRecovery,
  }) {
    return signUpWithEmailAndPassword(email, password, username);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email, String password)? signInWithEmailAndPassword,
    TResult Function(String email, String password, String username)?
        signUpWithEmailAndPassword,
    TResult Function()? signInWithGoogleAccount,
    TResult Function()? signInWithFacebookAccount,
    TResult Function()? signOut,
    TResult Function()? backToSigning,
    TResult Function(User? user)? changeAuthUser,
    TResult Function()? requestPasswordRecovery,
    TResult Function(String oldPassword, String newPassword)? changePassword,
    TResult Function(String email)? enterEmailForRecovery,
    TResult Function()? confirmEmailRecovery,
  }) {
    return signUpWithEmailAndPassword?.call(email, password, username);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signInWithEmailAndPassword,
    TResult Function(String email, String password, String username)?
        signUpWithEmailAndPassword,
    TResult Function()? signInWithGoogleAccount,
    TResult Function()? signInWithFacebookAccount,
    TResult Function()? signOut,
    TResult Function()? backToSigning,
    TResult Function(User? user)? changeAuthUser,
    TResult Function()? requestPasswordRecovery,
    TResult Function(String oldPassword, String newPassword)? changePassword,
    TResult Function(String email)? enterEmailForRecovery,
    TResult Function()? confirmEmailRecovery,
    required TResult orElse(),
  }) {
    if (signUpWithEmailAndPassword != null) {
      return signUpWithEmailAndPassword(email, password, username);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthSignInWithEmailAndPasswordEvent value)
        signInWithEmailAndPassword,
    required TResult Function(AuthSignUpWithEmailAndPasswordEvent value)
        signUpWithEmailAndPassword,
    required TResult Function(AuthSignInWithGoogleAccountEvent value)
        signInWithGoogleAccount,
    required TResult Function(AuthSignInWithFacebookAccountEvent value)
        signInWithFacebookAccount,
    required TResult Function(AuthSignOutEvent value) signOut,
    required TResult Function(AuthBackToSigningEvent value) backToSigning,
    required TResult Function(AuthChangeAuthUserEvent value) changeAuthUser,
    required TResult Function(AuthRequestPasswordRecoveryEvent value)
        requestPasswordRecovery,
    required TResult Function(AuthChangePasswordEvent value) changePassword,
    required TResult Function(AuthEnterEmailForRecoveryEvent value)
        enterEmailForRecovery,
    required TResult Function(AuthConfirmEmailRecoveryEvent value)
        confirmEmailRecovery,
  }) {
    return signUpWithEmailAndPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthSignInWithEmailAndPasswordEvent value)?
        signInWithEmailAndPassword,
    TResult Function(AuthSignUpWithEmailAndPasswordEvent value)?
        signUpWithEmailAndPassword,
    TResult Function(AuthSignInWithGoogleAccountEvent value)?
        signInWithGoogleAccount,
    TResult Function(AuthSignInWithFacebookAccountEvent value)?
        signInWithFacebookAccount,
    TResult Function(AuthSignOutEvent value)? signOut,
    TResult Function(AuthBackToSigningEvent value)? backToSigning,
    TResult Function(AuthChangeAuthUserEvent value)? changeAuthUser,
    TResult Function(AuthRequestPasswordRecoveryEvent value)?
        requestPasswordRecovery,
    TResult Function(AuthChangePasswordEvent value)? changePassword,
    TResult Function(AuthEnterEmailForRecoveryEvent value)?
        enterEmailForRecovery,
    TResult Function(AuthConfirmEmailRecoveryEvent value)? confirmEmailRecovery,
  }) {
    return signUpWithEmailAndPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthSignInWithEmailAndPasswordEvent value)?
        signInWithEmailAndPassword,
    TResult Function(AuthSignUpWithEmailAndPasswordEvent value)?
        signUpWithEmailAndPassword,
    TResult Function(AuthSignInWithGoogleAccountEvent value)?
        signInWithGoogleAccount,
    TResult Function(AuthSignInWithFacebookAccountEvent value)?
        signInWithFacebookAccount,
    TResult Function(AuthSignOutEvent value)? signOut,
    TResult Function(AuthBackToSigningEvent value)? backToSigning,
    TResult Function(AuthChangeAuthUserEvent value)? changeAuthUser,
    TResult Function(AuthRequestPasswordRecoveryEvent value)?
        requestPasswordRecovery,
    TResult Function(AuthChangePasswordEvent value)? changePassword,
    TResult Function(AuthEnterEmailForRecoveryEvent value)?
        enterEmailForRecovery,
    TResult Function(AuthConfirmEmailRecoveryEvent value)? confirmEmailRecovery,
    required TResult orElse(),
  }) {
    if (signUpWithEmailAndPassword != null) {
      return signUpWithEmailAndPassword(this);
    }
    return orElse();
  }
}

abstract class AuthSignUpWithEmailAndPasswordEvent implements AuthEvent {
  const factory AuthSignUpWithEmailAndPasswordEvent(
      {required final String email,
      required final String password,
      required final String username}) = _$AuthSignUpWithEmailAndPasswordEvent;

  String get email;
  String get password;
  String get username;
  @JsonKey(ignore: true)
  _$$AuthSignUpWithEmailAndPasswordEventCopyWith<
          _$AuthSignUpWithEmailAndPasswordEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthSignInWithGoogleAccountEventCopyWith<$Res> {
  factory _$$AuthSignInWithGoogleAccountEventCopyWith(
          _$AuthSignInWithGoogleAccountEvent value,
          $Res Function(_$AuthSignInWithGoogleAccountEvent) then) =
      __$$AuthSignInWithGoogleAccountEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthSignInWithGoogleAccountEventCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res>
    implements _$$AuthSignInWithGoogleAccountEventCopyWith<$Res> {
  __$$AuthSignInWithGoogleAccountEventCopyWithImpl(
      _$AuthSignInWithGoogleAccountEvent _value,
      $Res Function(_$AuthSignInWithGoogleAccountEvent) _then)
      : super(_value, (v) => _then(v as _$AuthSignInWithGoogleAccountEvent));

  @override
  _$AuthSignInWithGoogleAccountEvent get _value =>
      super._value as _$AuthSignInWithGoogleAccountEvent;
}

/// @nodoc

class _$AuthSignInWithGoogleAccountEvent
    implements AuthSignInWithGoogleAccountEvent {
  const _$AuthSignInWithGoogleAccountEvent();

  @override
  String toString() {
    return 'AuthEvent.signInWithGoogleAccount()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthSignInWithGoogleAccountEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password)
        signInWithEmailAndPassword,
    required TResult Function(String email, String password, String username)
        signUpWithEmailAndPassword,
    required TResult Function() signInWithGoogleAccount,
    required TResult Function() signInWithFacebookAccount,
    required TResult Function() signOut,
    required TResult Function() backToSigning,
    required TResult Function(User? user) changeAuthUser,
    required TResult Function() requestPasswordRecovery,
    required TResult Function(String oldPassword, String newPassword)
        changePassword,
    required TResult Function(String email) enterEmailForRecovery,
    required TResult Function() confirmEmailRecovery,
  }) {
    return signInWithGoogleAccount();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email, String password)? signInWithEmailAndPassword,
    TResult Function(String email, String password, String username)?
        signUpWithEmailAndPassword,
    TResult Function()? signInWithGoogleAccount,
    TResult Function()? signInWithFacebookAccount,
    TResult Function()? signOut,
    TResult Function()? backToSigning,
    TResult Function(User? user)? changeAuthUser,
    TResult Function()? requestPasswordRecovery,
    TResult Function(String oldPassword, String newPassword)? changePassword,
    TResult Function(String email)? enterEmailForRecovery,
    TResult Function()? confirmEmailRecovery,
  }) {
    return signInWithGoogleAccount?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signInWithEmailAndPassword,
    TResult Function(String email, String password, String username)?
        signUpWithEmailAndPassword,
    TResult Function()? signInWithGoogleAccount,
    TResult Function()? signInWithFacebookAccount,
    TResult Function()? signOut,
    TResult Function()? backToSigning,
    TResult Function(User? user)? changeAuthUser,
    TResult Function()? requestPasswordRecovery,
    TResult Function(String oldPassword, String newPassword)? changePassword,
    TResult Function(String email)? enterEmailForRecovery,
    TResult Function()? confirmEmailRecovery,
    required TResult orElse(),
  }) {
    if (signInWithGoogleAccount != null) {
      return signInWithGoogleAccount();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthSignInWithEmailAndPasswordEvent value)
        signInWithEmailAndPassword,
    required TResult Function(AuthSignUpWithEmailAndPasswordEvent value)
        signUpWithEmailAndPassword,
    required TResult Function(AuthSignInWithGoogleAccountEvent value)
        signInWithGoogleAccount,
    required TResult Function(AuthSignInWithFacebookAccountEvent value)
        signInWithFacebookAccount,
    required TResult Function(AuthSignOutEvent value) signOut,
    required TResult Function(AuthBackToSigningEvent value) backToSigning,
    required TResult Function(AuthChangeAuthUserEvent value) changeAuthUser,
    required TResult Function(AuthRequestPasswordRecoveryEvent value)
        requestPasswordRecovery,
    required TResult Function(AuthChangePasswordEvent value) changePassword,
    required TResult Function(AuthEnterEmailForRecoveryEvent value)
        enterEmailForRecovery,
    required TResult Function(AuthConfirmEmailRecoveryEvent value)
        confirmEmailRecovery,
  }) {
    return signInWithGoogleAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthSignInWithEmailAndPasswordEvent value)?
        signInWithEmailAndPassword,
    TResult Function(AuthSignUpWithEmailAndPasswordEvent value)?
        signUpWithEmailAndPassword,
    TResult Function(AuthSignInWithGoogleAccountEvent value)?
        signInWithGoogleAccount,
    TResult Function(AuthSignInWithFacebookAccountEvent value)?
        signInWithFacebookAccount,
    TResult Function(AuthSignOutEvent value)? signOut,
    TResult Function(AuthBackToSigningEvent value)? backToSigning,
    TResult Function(AuthChangeAuthUserEvent value)? changeAuthUser,
    TResult Function(AuthRequestPasswordRecoveryEvent value)?
        requestPasswordRecovery,
    TResult Function(AuthChangePasswordEvent value)? changePassword,
    TResult Function(AuthEnterEmailForRecoveryEvent value)?
        enterEmailForRecovery,
    TResult Function(AuthConfirmEmailRecoveryEvent value)? confirmEmailRecovery,
  }) {
    return signInWithGoogleAccount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthSignInWithEmailAndPasswordEvent value)?
        signInWithEmailAndPassword,
    TResult Function(AuthSignUpWithEmailAndPasswordEvent value)?
        signUpWithEmailAndPassword,
    TResult Function(AuthSignInWithGoogleAccountEvent value)?
        signInWithGoogleAccount,
    TResult Function(AuthSignInWithFacebookAccountEvent value)?
        signInWithFacebookAccount,
    TResult Function(AuthSignOutEvent value)? signOut,
    TResult Function(AuthBackToSigningEvent value)? backToSigning,
    TResult Function(AuthChangeAuthUserEvent value)? changeAuthUser,
    TResult Function(AuthRequestPasswordRecoveryEvent value)?
        requestPasswordRecovery,
    TResult Function(AuthChangePasswordEvent value)? changePassword,
    TResult Function(AuthEnterEmailForRecoveryEvent value)?
        enterEmailForRecovery,
    TResult Function(AuthConfirmEmailRecoveryEvent value)? confirmEmailRecovery,
    required TResult orElse(),
  }) {
    if (signInWithGoogleAccount != null) {
      return signInWithGoogleAccount(this);
    }
    return orElse();
  }
}

abstract class AuthSignInWithGoogleAccountEvent implements AuthEvent {
  const factory AuthSignInWithGoogleAccountEvent() =
      _$AuthSignInWithGoogleAccountEvent;
}

/// @nodoc
abstract class _$$AuthSignInWithFacebookAccountEventCopyWith<$Res> {
  factory _$$AuthSignInWithFacebookAccountEventCopyWith(
          _$AuthSignInWithFacebookAccountEvent value,
          $Res Function(_$AuthSignInWithFacebookAccountEvent) then) =
      __$$AuthSignInWithFacebookAccountEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthSignInWithFacebookAccountEventCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res>
    implements _$$AuthSignInWithFacebookAccountEventCopyWith<$Res> {
  __$$AuthSignInWithFacebookAccountEventCopyWithImpl(
      _$AuthSignInWithFacebookAccountEvent _value,
      $Res Function(_$AuthSignInWithFacebookAccountEvent) _then)
      : super(_value, (v) => _then(v as _$AuthSignInWithFacebookAccountEvent));

  @override
  _$AuthSignInWithFacebookAccountEvent get _value =>
      super._value as _$AuthSignInWithFacebookAccountEvent;
}

/// @nodoc

class _$AuthSignInWithFacebookAccountEvent
    implements AuthSignInWithFacebookAccountEvent {
  const _$AuthSignInWithFacebookAccountEvent();

  @override
  String toString() {
    return 'AuthEvent.signInWithFacebookAccount()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthSignInWithFacebookAccountEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password)
        signInWithEmailAndPassword,
    required TResult Function(String email, String password, String username)
        signUpWithEmailAndPassword,
    required TResult Function() signInWithGoogleAccount,
    required TResult Function() signInWithFacebookAccount,
    required TResult Function() signOut,
    required TResult Function() backToSigning,
    required TResult Function(User? user) changeAuthUser,
    required TResult Function() requestPasswordRecovery,
    required TResult Function(String oldPassword, String newPassword)
        changePassword,
    required TResult Function(String email) enterEmailForRecovery,
    required TResult Function() confirmEmailRecovery,
  }) {
    return signInWithFacebookAccount();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email, String password)? signInWithEmailAndPassword,
    TResult Function(String email, String password, String username)?
        signUpWithEmailAndPassword,
    TResult Function()? signInWithGoogleAccount,
    TResult Function()? signInWithFacebookAccount,
    TResult Function()? signOut,
    TResult Function()? backToSigning,
    TResult Function(User? user)? changeAuthUser,
    TResult Function()? requestPasswordRecovery,
    TResult Function(String oldPassword, String newPassword)? changePassword,
    TResult Function(String email)? enterEmailForRecovery,
    TResult Function()? confirmEmailRecovery,
  }) {
    return signInWithFacebookAccount?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signInWithEmailAndPassword,
    TResult Function(String email, String password, String username)?
        signUpWithEmailAndPassword,
    TResult Function()? signInWithGoogleAccount,
    TResult Function()? signInWithFacebookAccount,
    TResult Function()? signOut,
    TResult Function()? backToSigning,
    TResult Function(User? user)? changeAuthUser,
    TResult Function()? requestPasswordRecovery,
    TResult Function(String oldPassword, String newPassword)? changePassword,
    TResult Function(String email)? enterEmailForRecovery,
    TResult Function()? confirmEmailRecovery,
    required TResult orElse(),
  }) {
    if (signInWithFacebookAccount != null) {
      return signInWithFacebookAccount();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthSignInWithEmailAndPasswordEvent value)
        signInWithEmailAndPassword,
    required TResult Function(AuthSignUpWithEmailAndPasswordEvent value)
        signUpWithEmailAndPassword,
    required TResult Function(AuthSignInWithGoogleAccountEvent value)
        signInWithGoogleAccount,
    required TResult Function(AuthSignInWithFacebookAccountEvent value)
        signInWithFacebookAccount,
    required TResult Function(AuthSignOutEvent value) signOut,
    required TResult Function(AuthBackToSigningEvent value) backToSigning,
    required TResult Function(AuthChangeAuthUserEvent value) changeAuthUser,
    required TResult Function(AuthRequestPasswordRecoveryEvent value)
        requestPasswordRecovery,
    required TResult Function(AuthChangePasswordEvent value) changePassword,
    required TResult Function(AuthEnterEmailForRecoveryEvent value)
        enterEmailForRecovery,
    required TResult Function(AuthConfirmEmailRecoveryEvent value)
        confirmEmailRecovery,
  }) {
    return signInWithFacebookAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthSignInWithEmailAndPasswordEvent value)?
        signInWithEmailAndPassword,
    TResult Function(AuthSignUpWithEmailAndPasswordEvent value)?
        signUpWithEmailAndPassword,
    TResult Function(AuthSignInWithGoogleAccountEvent value)?
        signInWithGoogleAccount,
    TResult Function(AuthSignInWithFacebookAccountEvent value)?
        signInWithFacebookAccount,
    TResult Function(AuthSignOutEvent value)? signOut,
    TResult Function(AuthBackToSigningEvent value)? backToSigning,
    TResult Function(AuthChangeAuthUserEvent value)? changeAuthUser,
    TResult Function(AuthRequestPasswordRecoveryEvent value)?
        requestPasswordRecovery,
    TResult Function(AuthChangePasswordEvent value)? changePassword,
    TResult Function(AuthEnterEmailForRecoveryEvent value)?
        enterEmailForRecovery,
    TResult Function(AuthConfirmEmailRecoveryEvent value)? confirmEmailRecovery,
  }) {
    return signInWithFacebookAccount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthSignInWithEmailAndPasswordEvent value)?
        signInWithEmailAndPassword,
    TResult Function(AuthSignUpWithEmailAndPasswordEvent value)?
        signUpWithEmailAndPassword,
    TResult Function(AuthSignInWithGoogleAccountEvent value)?
        signInWithGoogleAccount,
    TResult Function(AuthSignInWithFacebookAccountEvent value)?
        signInWithFacebookAccount,
    TResult Function(AuthSignOutEvent value)? signOut,
    TResult Function(AuthBackToSigningEvent value)? backToSigning,
    TResult Function(AuthChangeAuthUserEvent value)? changeAuthUser,
    TResult Function(AuthRequestPasswordRecoveryEvent value)?
        requestPasswordRecovery,
    TResult Function(AuthChangePasswordEvent value)? changePassword,
    TResult Function(AuthEnterEmailForRecoveryEvent value)?
        enterEmailForRecovery,
    TResult Function(AuthConfirmEmailRecoveryEvent value)? confirmEmailRecovery,
    required TResult orElse(),
  }) {
    if (signInWithFacebookAccount != null) {
      return signInWithFacebookAccount(this);
    }
    return orElse();
  }
}

abstract class AuthSignInWithFacebookAccountEvent implements AuthEvent {
  const factory AuthSignInWithFacebookAccountEvent() =
      _$AuthSignInWithFacebookAccountEvent;
}

/// @nodoc
abstract class _$$AuthSignOutEventCopyWith<$Res> {
  factory _$$AuthSignOutEventCopyWith(
          _$AuthSignOutEvent value, $Res Function(_$AuthSignOutEvent) then) =
      __$$AuthSignOutEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthSignOutEventCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res>
    implements _$$AuthSignOutEventCopyWith<$Res> {
  __$$AuthSignOutEventCopyWithImpl(
      _$AuthSignOutEvent _value, $Res Function(_$AuthSignOutEvent) _then)
      : super(_value, (v) => _then(v as _$AuthSignOutEvent));

  @override
  _$AuthSignOutEvent get _value => super._value as _$AuthSignOutEvent;
}

/// @nodoc

class _$AuthSignOutEvent implements AuthSignOutEvent {
  const _$AuthSignOutEvent();

  @override
  String toString() {
    return 'AuthEvent.signOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthSignOutEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password)
        signInWithEmailAndPassword,
    required TResult Function(String email, String password, String username)
        signUpWithEmailAndPassword,
    required TResult Function() signInWithGoogleAccount,
    required TResult Function() signInWithFacebookAccount,
    required TResult Function() signOut,
    required TResult Function() backToSigning,
    required TResult Function(User? user) changeAuthUser,
    required TResult Function() requestPasswordRecovery,
    required TResult Function(String oldPassword, String newPassword)
        changePassword,
    required TResult Function(String email) enterEmailForRecovery,
    required TResult Function() confirmEmailRecovery,
  }) {
    return signOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email, String password)? signInWithEmailAndPassword,
    TResult Function(String email, String password, String username)?
        signUpWithEmailAndPassword,
    TResult Function()? signInWithGoogleAccount,
    TResult Function()? signInWithFacebookAccount,
    TResult Function()? signOut,
    TResult Function()? backToSigning,
    TResult Function(User? user)? changeAuthUser,
    TResult Function()? requestPasswordRecovery,
    TResult Function(String oldPassword, String newPassword)? changePassword,
    TResult Function(String email)? enterEmailForRecovery,
    TResult Function()? confirmEmailRecovery,
  }) {
    return signOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signInWithEmailAndPassword,
    TResult Function(String email, String password, String username)?
        signUpWithEmailAndPassword,
    TResult Function()? signInWithGoogleAccount,
    TResult Function()? signInWithFacebookAccount,
    TResult Function()? signOut,
    TResult Function()? backToSigning,
    TResult Function(User? user)? changeAuthUser,
    TResult Function()? requestPasswordRecovery,
    TResult Function(String oldPassword, String newPassword)? changePassword,
    TResult Function(String email)? enterEmailForRecovery,
    TResult Function()? confirmEmailRecovery,
    required TResult orElse(),
  }) {
    if (signOut != null) {
      return signOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthSignInWithEmailAndPasswordEvent value)
        signInWithEmailAndPassword,
    required TResult Function(AuthSignUpWithEmailAndPasswordEvent value)
        signUpWithEmailAndPassword,
    required TResult Function(AuthSignInWithGoogleAccountEvent value)
        signInWithGoogleAccount,
    required TResult Function(AuthSignInWithFacebookAccountEvent value)
        signInWithFacebookAccount,
    required TResult Function(AuthSignOutEvent value) signOut,
    required TResult Function(AuthBackToSigningEvent value) backToSigning,
    required TResult Function(AuthChangeAuthUserEvent value) changeAuthUser,
    required TResult Function(AuthRequestPasswordRecoveryEvent value)
        requestPasswordRecovery,
    required TResult Function(AuthChangePasswordEvent value) changePassword,
    required TResult Function(AuthEnterEmailForRecoveryEvent value)
        enterEmailForRecovery,
    required TResult Function(AuthConfirmEmailRecoveryEvent value)
        confirmEmailRecovery,
  }) {
    return signOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthSignInWithEmailAndPasswordEvent value)?
        signInWithEmailAndPassword,
    TResult Function(AuthSignUpWithEmailAndPasswordEvent value)?
        signUpWithEmailAndPassword,
    TResult Function(AuthSignInWithGoogleAccountEvent value)?
        signInWithGoogleAccount,
    TResult Function(AuthSignInWithFacebookAccountEvent value)?
        signInWithFacebookAccount,
    TResult Function(AuthSignOutEvent value)? signOut,
    TResult Function(AuthBackToSigningEvent value)? backToSigning,
    TResult Function(AuthChangeAuthUserEvent value)? changeAuthUser,
    TResult Function(AuthRequestPasswordRecoveryEvent value)?
        requestPasswordRecovery,
    TResult Function(AuthChangePasswordEvent value)? changePassword,
    TResult Function(AuthEnterEmailForRecoveryEvent value)?
        enterEmailForRecovery,
    TResult Function(AuthConfirmEmailRecoveryEvent value)? confirmEmailRecovery,
  }) {
    return signOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthSignInWithEmailAndPasswordEvent value)?
        signInWithEmailAndPassword,
    TResult Function(AuthSignUpWithEmailAndPasswordEvent value)?
        signUpWithEmailAndPassword,
    TResult Function(AuthSignInWithGoogleAccountEvent value)?
        signInWithGoogleAccount,
    TResult Function(AuthSignInWithFacebookAccountEvent value)?
        signInWithFacebookAccount,
    TResult Function(AuthSignOutEvent value)? signOut,
    TResult Function(AuthBackToSigningEvent value)? backToSigning,
    TResult Function(AuthChangeAuthUserEvent value)? changeAuthUser,
    TResult Function(AuthRequestPasswordRecoveryEvent value)?
        requestPasswordRecovery,
    TResult Function(AuthChangePasswordEvent value)? changePassword,
    TResult Function(AuthEnterEmailForRecoveryEvent value)?
        enterEmailForRecovery,
    TResult Function(AuthConfirmEmailRecoveryEvent value)? confirmEmailRecovery,
    required TResult orElse(),
  }) {
    if (signOut != null) {
      return signOut(this);
    }
    return orElse();
  }
}

abstract class AuthSignOutEvent implements AuthEvent {
  const factory AuthSignOutEvent() = _$AuthSignOutEvent;
}

/// @nodoc
abstract class _$$AuthBackToSigningEventCopyWith<$Res> {
  factory _$$AuthBackToSigningEventCopyWith(_$AuthBackToSigningEvent value,
          $Res Function(_$AuthBackToSigningEvent) then) =
      __$$AuthBackToSigningEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthBackToSigningEventCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res>
    implements _$$AuthBackToSigningEventCopyWith<$Res> {
  __$$AuthBackToSigningEventCopyWithImpl(_$AuthBackToSigningEvent _value,
      $Res Function(_$AuthBackToSigningEvent) _then)
      : super(_value, (v) => _then(v as _$AuthBackToSigningEvent));

  @override
  _$AuthBackToSigningEvent get _value =>
      super._value as _$AuthBackToSigningEvent;
}

/// @nodoc

class _$AuthBackToSigningEvent implements AuthBackToSigningEvent {
  const _$AuthBackToSigningEvent();

  @override
  String toString() {
    return 'AuthEvent.backToSigning()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthBackToSigningEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password)
        signInWithEmailAndPassword,
    required TResult Function(String email, String password, String username)
        signUpWithEmailAndPassword,
    required TResult Function() signInWithGoogleAccount,
    required TResult Function() signInWithFacebookAccount,
    required TResult Function() signOut,
    required TResult Function() backToSigning,
    required TResult Function(User? user) changeAuthUser,
    required TResult Function() requestPasswordRecovery,
    required TResult Function(String oldPassword, String newPassword)
        changePassword,
    required TResult Function(String email) enterEmailForRecovery,
    required TResult Function() confirmEmailRecovery,
  }) {
    return backToSigning();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email, String password)? signInWithEmailAndPassword,
    TResult Function(String email, String password, String username)?
        signUpWithEmailAndPassword,
    TResult Function()? signInWithGoogleAccount,
    TResult Function()? signInWithFacebookAccount,
    TResult Function()? signOut,
    TResult Function()? backToSigning,
    TResult Function(User? user)? changeAuthUser,
    TResult Function()? requestPasswordRecovery,
    TResult Function(String oldPassword, String newPassword)? changePassword,
    TResult Function(String email)? enterEmailForRecovery,
    TResult Function()? confirmEmailRecovery,
  }) {
    return backToSigning?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signInWithEmailAndPassword,
    TResult Function(String email, String password, String username)?
        signUpWithEmailAndPassword,
    TResult Function()? signInWithGoogleAccount,
    TResult Function()? signInWithFacebookAccount,
    TResult Function()? signOut,
    TResult Function()? backToSigning,
    TResult Function(User? user)? changeAuthUser,
    TResult Function()? requestPasswordRecovery,
    TResult Function(String oldPassword, String newPassword)? changePassword,
    TResult Function(String email)? enterEmailForRecovery,
    TResult Function()? confirmEmailRecovery,
    required TResult orElse(),
  }) {
    if (backToSigning != null) {
      return backToSigning();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthSignInWithEmailAndPasswordEvent value)
        signInWithEmailAndPassword,
    required TResult Function(AuthSignUpWithEmailAndPasswordEvent value)
        signUpWithEmailAndPassword,
    required TResult Function(AuthSignInWithGoogleAccountEvent value)
        signInWithGoogleAccount,
    required TResult Function(AuthSignInWithFacebookAccountEvent value)
        signInWithFacebookAccount,
    required TResult Function(AuthSignOutEvent value) signOut,
    required TResult Function(AuthBackToSigningEvent value) backToSigning,
    required TResult Function(AuthChangeAuthUserEvent value) changeAuthUser,
    required TResult Function(AuthRequestPasswordRecoveryEvent value)
        requestPasswordRecovery,
    required TResult Function(AuthChangePasswordEvent value) changePassword,
    required TResult Function(AuthEnterEmailForRecoveryEvent value)
        enterEmailForRecovery,
    required TResult Function(AuthConfirmEmailRecoveryEvent value)
        confirmEmailRecovery,
  }) {
    return backToSigning(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthSignInWithEmailAndPasswordEvent value)?
        signInWithEmailAndPassword,
    TResult Function(AuthSignUpWithEmailAndPasswordEvent value)?
        signUpWithEmailAndPassword,
    TResult Function(AuthSignInWithGoogleAccountEvent value)?
        signInWithGoogleAccount,
    TResult Function(AuthSignInWithFacebookAccountEvent value)?
        signInWithFacebookAccount,
    TResult Function(AuthSignOutEvent value)? signOut,
    TResult Function(AuthBackToSigningEvent value)? backToSigning,
    TResult Function(AuthChangeAuthUserEvent value)? changeAuthUser,
    TResult Function(AuthRequestPasswordRecoveryEvent value)?
        requestPasswordRecovery,
    TResult Function(AuthChangePasswordEvent value)? changePassword,
    TResult Function(AuthEnterEmailForRecoveryEvent value)?
        enterEmailForRecovery,
    TResult Function(AuthConfirmEmailRecoveryEvent value)? confirmEmailRecovery,
  }) {
    return backToSigning?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthSignInWithEmailAndPasswordEvent value)?
        signInWithEmailAndPassword,
    TResult Function(AuthSignUpWithEmailAndPasswordEvent value)?
        signUpWithEmailAndPassword,
    TResult Function(AuthSignInWithGoogleAccountEvent value)?
        signInWithGoogleAccount,
    TResult Function(AuthSignInWithFacebookAccountEvent value)?
        signInWithFacebookAccount,
    TResult Function(AuthSignOutEvent value)? signOut,
    TResult Function(AuthBackToSigningEvent value)? backToSigning,
    TResult Function(AuthChangeAuthUserEvent value)? changeAuthUser,
    TResult Function(AuthRequestPasswordRecoveryEvent value)?
        requestPasswordRecovery,
    TResult Function(AuthChangePasswordEvent value)? changePassword,
    TResult Function(AuthEnterEmailForRecoveryEvent value)?
        enterEmailForRecovery,
    TResult Function(AuthConfirmEmailRecoveryEvent value)? confirmEmailRecovery,
    required TResult orElse(),
  }) {
    if (backToSigning != null) {
      return backToSigning(this);
    }
    return orElse();
  }
}

abstract class AuthBackToSigningEvent implements AuthEvent {
  const factory AuthBackToSigningEvent() = _$AuthBackToSigningEvent;
}

/// @nodoc
abstract class _$$AuthChangeAuthUserEventCopyWith<$Res> {
  factory _$$AuthChangeAuthUserEventCopyWith(_$AuthChangeAuthUserEvent value,
          $Res Function(_$AuthChangeAuthUserEvent) then) =
      __$$AuthChangeAuthUserEventCopyWithImpl<$Res>;
  $Res call({User? user});
}

/// @nodoc
class __$$AuthChangeAuthUserEventCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res>
    implements _$$AuthChangeAuthUserEventCopyWith<$Res> {
  __$$AuthChangeAuthUserEventCopyWithImpl(_$AuthChangeAuthUserEvent _value,
      $Res Function(_$AuthChangeAuthUserEvent) _then)
      : super(_value, (v) => _then(v as _$AuthChangeAuthUserEvent));

  @override
  _$AuthChangeAuthUserEvent get _value =>
      super._value as _$AuthChangeAuthUserEvent;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$AuthChangeAuthUserEvent(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc

class _$AuthChangeAuthUserEvent implements AuthChangeAuthUserEvent {
  const _$AuthChangeAuthUserEvent({required this.user});

  @override
  final User? user;

  @override
  String toString() {
    return 'AuthEvent.changeAuthUser(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthChangeAuthUserEvent &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$$AuthChangeAuthUserEventCopyWith<_$AuthChangeAuthUserEvent> get copyWith =>
      __$$AuthChangeAuthUserEventCopyWithImpl<_$AuthChangeAuthUserEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password)
        signInWithEmailAndPassword,
    required TResult Function(String email, String password, String username)
        signUpWithEmailAndPassword,
    required TResult Function() signInWithGoogleAccount,
    required TResult Function() signInWithFacebookAccount,
    required TResult Function() signOut,
    required TResult Function() backToSigning,
    required TResult Function(User? user) changeAuthUser,
    required TResult Function() requestPasswordRecovery,
    required TResult Function(String oldPassword, String newPassword)
        changePassword,
    required TResult Function(String email) enterEmailForRecovery,
    required TResult Function() confirmEmailRecovery,
  }) {
    return changeAuthUser(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email, String password)? signInWithEmailAndPassword,
    TResult Function(String email, String password, String username)?
        signUpWithEmailAndPassword,
    TResult Function()? signInWithGoogleAccount,
    TResult Function()? signInWithFacebookAccount,
    TResult Function()? signOut,
    TResult Function()? backToSigning,
    TResult Function(User? user)? changeAuthUser,
    TResult Function()? requestPasswordRecovery,
    TResult Function(String oldPassword, String newPassword)? changePassword,
    TResult Function(String email)? enterEmailForRecovery,
    TResult Function()? confirmEmailRecovery,
  }) {
    return changeAuthUser?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signInWithEmailAndPassword,
    TResult Function(String email, String password, String username)?
        signUpWithEmailAndPassword,
    TResult Function()? signInWithGoogleAccount,
    TResult Function()? signInWithFacebookAccount,
    TResult Function()? signOut,
    TResult Function()? backToSigning,
    TResult Function(User? user)? changeAuthUser,
    TResult Function()? requestPasswordRecovery,
    TResult Function(String oldPassword, String newPassword)? changePassword,
    TResult Function(String email)? enterEmailForRecovery,
    TResult Function()? confirmEmailRecovery,
    required TResult orElse(),
  }) {
    if (changeAuthUser != null) {
      return changeAuthUser(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthSignInWithEmailAndPasswordEvent value)
        signInWithEmailAndPassword,
    required TResult Function(AuthSignUpWithEmailAndPasswordEvent value)
        signUpWithEmailAndPassword,
    required TResult Function(AuthSignInWithGoogleAccountEvent value)
        signInWithGoogleAccount,
    required TResult Function(AuthSignInWithFacebookAccountEvent value)
        signInWithFacebookAccount,
    required TResult Function(AuthSignOutEvent value) signOut,
    required TResult Function(AuthBackToSigningEvent value) backToSigning,
    required TResult Function(AuthChangeAuthUserEvent value) changeAuthUser,
    required TResult Function(AuthRequestPasswordRecoveryEvent value)
        requestPasswordRecovery,
    required TResult Function(AuthChangePasswordEvent value) changePassword,
    required TResult Function(AuthEnterEmailForRecoveryEvent value)
        enterEmailForRecovery,
    required TResult Function(AuthConfirmEmailRecoveryEvent value)
        confirmEmailRecovery,
  }) {
    return changeAuthUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthSignInWithEmailAndPasswordEvent value)?
        signInWithEmailAndPassword,
    TResult Function(AuthSignUpWithEmailAndPasswordEvent value)?
        signUpWithEmailAndPassword,
    TResult Function(AuthSignInWithGoogleAccountEvent value)?
        signInWithGoogleAccount,
    TResult Function(AuthSignInWithFacebookAccountEvent value)?
        signInWithFacebookAccount,
    TResult Function(AuthSignOutEvent value)? signOut,
    TResult Function(AuthBackToSigningEvent value)? backToSigning,
    TResult Function(AuthChangeAuthUserEvent value)? changeAuthUser,
    TResult Function(AuthRequestPasswordRecoveryEvent value)?
        requestPasswordRecovery,
    TResult Function(AuthChangePasswordEvent value)? changePassword,
    TResult Function(AuthEnterEmailForRecoveryEvent value)?
        enterEmailForRecovery,
    TResult Function(AuthConfirmEmailRecoveryEvent value)? confirmEmailRecovery,
  }) {
    return changeAuthUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthSignInWithEmailAndPasswordEvent value)?
        signInWithEmailAndPassword,
    TResult Function(AuthSignUpWithEmailAndPasswordEvent value)?
        signUpWithEmailAndPassword,
    TResult Function(AuthSignInWithGoogleAccountEvent value)?
        signInWithGoogleAccount,
    TResult Function(AuthSignInWithFacebookAccountEvent value)?
        signInWithFacebookAccount,
    TResult Function(AuthSignOutEvent value)? signOut,
    TResult Function(AuthBackToSigningEvent value)? backToSigning,
    TResult Function(AuthChangeAuthUserEvent value)? changeAuthUser,
    TResult Function(AuthRequestPasswordRecoveryEvent value)?
        requestPasswordRecovery,
    TResult Function(AuthChangePasswordEvent value)? changePassword,
    TResult Function(AuthEnterEmailForRecoveryEvent value)?
        enterEmailForRecovery,
    TResult Function(AuthConfirmEmailRecoveryEvent value)? confirmEmailRecovery,
    required TResult orElse(),
  }) {
    if (changeAuthUser != null) {
      return changeAuthUser(this);
    }
    return orElse();
  }
}

abstract class AuthChangeAuthUserEvent implements AuthEvent {
  const factory AuthChangeAuthUserEvent({required final User? user}) =
      _$AuthChangeAuthUserEvent;

  User? get user;
  @JsonKey(ignore: true)
  _$$AuthChangeAuthUserEventCopyWith<_$AuthChangeAuthUserEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthRequestPasswordRecoveryEventCopyWith<$Res> {
  factory _$$AuthRequestPasswordRecoveryEventCopyWith(
          _$AuthRequestPasswordRecoveryEvent value,
          $Res Function(_$AuthRequestPasswordRecoveryEvent) then) =
      __$$AuthRequestPasswordRecoveryEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthRequestPasswordRecoveryEventCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res>
    implements _$$AuthRequestPasswordRecoveryEventCopyWith<$Res> {
  __$$AuthRequestPasswordRecoveryEventCopyWithImpl(
      _$AuthRequestPasswordRecoveryEvent _value,
      $Res Function(_$AuthRequestPasswordRecoveryEvent) _then)
      : super(_value, (v) => _then(v as _$AuthRequestPasswordRecoveryEvent));

  @override
  _$AuthRequestPasswordRecoveryEvent get _value =>
      super._value as _$AuthRequestPasswordRecoveryEvent;
}

/// @nodoc

class _$AuthRequestPasswordRecoveryEvent
    implements AuthRequestPasswordRecoveryEvent {
  const _$AuthRequestPasswordRecoveryEvent();

  @override
  String toString() {
    return 'AuthEvent.requestPasswordRecovery()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthRequestPasswordRecoveryEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password)
        signInWithEmailAndPassword,
    required TResult Function(String email, String password, String username)
        signUpWithEmailAndPassword,
    required TResult Function() signInWithGoogleAccount,
    required TResult Function() signInWithFacebookAccount,
    required TResult Function() signOut,
    required TResult Function() backToSigning,
    required TResult Function(User? user) changeAuthUser,
    required TResult Function() requestPasswordRecovery,
    required TResult Function(String oldPassword, String newPassword)
        changePassword,
    required TResult Function(String email) enterEmailForRecovery,
    required TResult Function() confirmEmailRecovery,
  }) {
    return requestPasswordRecovery();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email, String password)? signInWithEmailAndPassword,
    TResult Function(String email, String password, String username)?
        signUpWithEmailAndPassword,
    TResult Function()? signInWithGoogleAccount,
    TResult Function()? signInWithFacebookAccount,
    TResult Function()? signOut,
    TResult Function()? backToSigning,
    TResult Function(User? user)? changeAuthUser,
    TResult Function()? requestPasswordRecovery,
    TResult Function(String oldPassword, String newPassword)? changePassword,
    TResult Function(String email)? enterEmailForRecovery,
    TResult Function()? confirmEmailRecovery,
  }) {
    return requestPasswordRecovery?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signInWithEmailAndPassword,
    TResult Function(String email, String password, String username)?
        signUpWithEmailAndPassword,
    TResult Function()? signInWithGoogleAccount,
    TResult Function()? signInWithFacebookAccount,
    TResult Function()? signOut,
    TResult Function()? backToSigning,
    TResult Function(User? user)? changeAuthUser,
    TResult Function()? requestPasswordRecovery,
    TResult Function(String oldPassword, String newPassword)? changePassword,
    TResult Function(String email)? enterEmailForRecovery,
    TResult Function()? confirmEmailRecovery,
    required TResult orElse(),
  }) {
    if (requestPasswordRecovery != null) {
      return requestPasswordRecovery();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthSignInWithEmailAndPasswordEvent value)
        signInWithEmailAndPassword,
    required TResult Function(AuthSignUpWithEmailAndPasswordEvent value)
        signUpWithEmailAndPassword,
    required TResult Function(AuthSignInWithGoogleAccountEvent value)
        signInWithGoogleAccount,
    required TResult Function(AuthSignInWithFacebookAccountEvent value)
        signInWithFacebookAccount,
    required TResult Function(AuthSignOutEvent value) signOut,
    required TResult Function(AuthBackToSigningEvent value) backToSigning,
    required TResult Function(AuthChangeAuthUserEvent value) changeAuthUser,
    required TResult Function(AuthRequestPasswordRecoveryEvent value)
        requestPasswordRecovery,
    required TResult Function(AuthChangePasswordEvent value) changePassword,
    required TResult Function(AuthEnterEmailForRecoveryEvent value)
        enterEmailForRecovery,
    required TResult Function(AuthConfirmEmailRecoveryEvent value)
        confirmEmailRecovery,
  }) {
    return requestPasswordRecovery(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthSignInWithEmailAndPasswordEvent value)?
        signInWithEmailAndPassword,
    TResult Function(AuthSignUpWithEmailAndPasswordEvent value)?
        signUpWithEmailAndPassword,
    TResult Function(AuthSignInWithGoogleAccountEvent value)?
        signInWithGoogleAccount,
    TResult Function(AuthSignInWithFacebookAccountEvent value)?
        signInWithFacebookAccount,
    TResult Function(AuthSignOutEvent value)? signOut,
    TResult Function(AuthBackToSigningEvent value)? backToSigning,
    TResult Function(AuthChangeAuthUserEvent value)? changeAuthUser,
    TResult Function(AuthRequestPasswordRecoveryEvent value)?
        requestPasswordRecovery,
    TResult Function(AuthChangePasswordEvent value)? changePassword,
    TResult Function(AuthEnterEmailForRecoveryEvent value)?
        enterEmailForRecovery,
    TResult Function(AuthConfirmEmailRecoveryEvent value)? confirmEmailRecovery,
  }) {
    return requestPasswordRecovery?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthSignInWithEmailAndPasswordEvent value)?
        signInWithEmailAndPassword,
    TResult Function(AuthSignUpWithEmailAndPasswordEvent value)?
        signUpWithEmailAndPassword,
    TResult Function(AuthSignInWithGoogleAccountEvent value)?
        signInWithGoogleAccount,
    TResult Function(AuthSignInWithFacebookAccountEvent value)?
        signInWithFacebookAccount,
    TResult Function(AuthSignOutEvent value)? signOut,
    TResult Function(AuthBackToSigningEvent value)? backToSigning,
    TResult Function(AuthChangeAuthUserEvent value)? changeAuthUser,
    TResult Function(AuthRequestPasswordRecoveryEvent value)?
        requestPasswordRecovery,
    TResult Function(AuthChangePasswordEvent value)? changePassword,
    TResult Function(AuthEnterEmailForRecoveryEvent value)?
        enterEmailForRecovery,
    TResult Function(AuthConfirmEmailRecoveryEvent value)? confirmEmailRecovery,
    required TResult orElse(),
  }) {
    if (requestPasswordRecovery != null) {
      return requestPasswordRecovery(this);
    }
    return orElse();
  }
}

abstract class AuthRequestPasswordRecoveryEvent implements AuthEvent {
  const factory AuthRequestPasswordRecoveryEvent() =
      _$AuthRequestPasswordRecoveryEvent;
}

/// @nodoc
abstract class _$$AuthChangePasswordEventCopyWith<$Res> {
  factory _$$AuthChangePasswordEventCopyWith(_$AuthChangePasswordEvent value,
          $Res Function(_$AuthChangePasswordEvent) then) =
      __$$AuthChangePasswordEventCopyWithImpl<$Res>;
  $Res call({String oldPassword, String newPassword});
}

/// @nodoc
class __$$AuthChangePasswordEventCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res>
    implements _$$AuthChangePasswordEventCopyWith<$Res> {
  __$$AuthChangePasswordEventCopyWithImpl(_$AuthChangePasswordEvent _value,
      $Res Function(_$AuthChangePasswordEvent) _then)
      : super(_value, (v) => _then(v as _$AuthChangePasswordEvent));

  @override
  _$AuthChangePasswordEvent get _value =>
      super._value as _$AuthChangePasswordEvent;

  @override
  $Res call({
    Object? oldPassword = freezed,
    Object? newPassword = freezed,
  }) {
    return _then(_$AuthChangePasswordEvent(
      oldPassword: oldPassword == freezed
          ? _value.oldPassword
          : oldPassword // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: newPassword == freezed
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthChangePasswordEvent implements AuthChangePasswordEvent {
  const _$AuthChangePasswordEvent(
      {required this.oldPassword, required this.newPassword});

  @override
  final String oldPassword;
  @override
  final String newPassword;

  @override
  String toString() {
    return 'AuthEvent.changePassword(oldPassword: $oldPassword, newPassword: $newPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthChangePasswordEvent &&
            const DeepCollectionEquality()
                .equals(other.oldPassword, oldPassword) &&
            const DeepCollectionEquality()
                .equals(other.newPassword, newPassword));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(oldPassword),
      const DeepCollectionEquality().hash(newPassword));

  @JsonKey(ignore: true)
  @override
  _$$AuthChangePasswordEventCopyWith<_$AuthChangePasswordEvent> get copyWith =>
      __$$AuthChangePasswordEventCopyWithImpl<_$AuthChangePasswordEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password)
        signInWithEmailAndPassword,
    required TResult Function(String email, String password, String username)
        signUpWithEmailAndPassword,
    required TResult Function() signInWithGoogleAccount,
    required TResult Function() signInWithFacebookAccount,
    required TResult Function() signOut,
    required TResult Function() backToSigning,
    required TResult Function(User? user) changeAuthUser,
    required TResult Function() requestPasswordRecovery,
    required TResult Function(String oldPassword, String newPassword)
        changePassword,
    required TResult Function(String email) enterEmailForRecovery,
    required TResult Function() confirmEmailRecovery,
  }) {
    return changePassword(oldPassword, newPassword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email, String password)? signInWithEmailAndPassword,
    TResult Function(String email, String password, String username)?
        signUpWithEmailAndPassword,
    TResult Function()? signInWithGoogleAccount,
    TResult Function()? signInWithFacebookAccount,
    TResult Function()? signOut,
    TResult Function()? backToSigning,
    TResult Function(User? user)? changeAuthUser,
    TResult Function()? requestPasswordRecovery,
    TResult Function(String oldPassword, String newPassword)? changePassword,
    TResult Function(String email)? enterEmailForRecovery,
    TResult Function()? confirmEmailRecovery,
  }) {
    return changePassword?.call(oldPassword, newPassword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signInWithEmailAndPassword,
    TResult Function(String email, String password, String username)?
        signUpWithEmailAndPassword,
    TResult Function()? signInWithGoogleAccount,
    TResult Function()? signInWithFacebookAccount,
    TResult Function()? signOut,
    TResult Function()? backToSigning,
    TResult Function(User? user)? changeAuthUser,
    TResult Function()? requestPasswordRecovery,
    TResult Function(String oldPassword, String newPassword)? changePassword,
    TResult Function(String email)? enterEmailForRecovery,
    TResult Function()? confirmEmailRecovery,
    required TResult orElse(),
  }) {
    if (changePassword != null) {
      return changePassword(oldPassword, newPassword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthSignInWithEmailAndPasswordEvent value)
        signInWithEmailAndPassword,
    required TResult Function(AuthSignUpWithEmailAndPasswordEvent value)
        signUpWithEmailAndPassword,
    required TResult Function(AuthSignInWithGoogleAccountEvent value)
        signInWithGoogleAccount,
    required TResult Function(AuthSignInWithFacebookAccountEvent value)
        signInWithFacebookAccount,
    required TResult Function(AuthSignOutEvent value) signOut,
    required TResult Function(AuthBackToSigningEvent value) backToSigning,
    required TResult Function(AuthChangeAuthUserEvent value) changeAuthUser,
    required TResult Function(AuthRequestPasswordRecoveryEvent value)
        requestPasswordRecovery,
    required TResult Function(AuthChangePasswordEvent value) changePassword,
    required TResult Function(AuthEnterEmailForRecoveryEvent value)
        enterEmailForRecovery,
    required TResult Function(AuthConfirmEmailRecoveryEvent value)
        confirmEmailRecovery,
  }) {
    return changePassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthSignInWithEmailAndPasswordEvent value)?
        signInWithEmailAndPassword,
    TResult Function(AuthSignUpWithEmailAndPasswordEvent value)?
        signUpWithEmailAndPassword,
    TResult Function(AuthSignInWithGoogleAccountEvent value)?
        signInWithGoogleAccount,
    TResult Function(AuthSignInWithFacebookAccountEvent value)?
        signInWithFacebookAccount,
    TResult Function(AuthSignOutEvent value)? signOut,
    TResult Function(AuthBackToSigningEvent value)? backToSigning,
    TResult Function(AuthChangeAuthUserEvent value)? changeAuthUser,
    TResult Function(AuthRequestPasswordRecoveryEvent value)?
        requestPasswordRecovery,
    TResult Function(AuthChangePasswordEvent value)? changePassword,
    TResult Function(AuthEnterEmailForRecoveryEvent value)?
        enterEmailForRecovery,
    TResult Function(AuthConfirmEmailRecoveryEvent value)? confirmEmailRecovery,
  }) {
    return changePassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthSignInWithEmailAndPasswordEvent value)?
        signInWithEmailAndPassword,
    TResult Function(AuthSignUpWithEmailAndPasswordEvent value)?
        signUpWithEmailAndPassword,
    TResult Function(AuthSignInWithGoogleAccountEvent value)?
        signInWithGoogleAccount,
    TResult Function(AuthSignInWithFacebookAccountEvent value)?
        signInWithFacebookAccount,
    TResult Function(AuthSignOutEvent value)? signOut,
    TResult Function(AuthBackToSigningEvent value)? backToSigning,
    TResult Function(AuthChangeAuthUserEvent value)? changeAuthUser,
    TResult Function(AuthRequestPasswordRecoveryEvent value)?
        requestPasswordRecovery,
    TResult Function(AuthChangePasswordEvent value)? changePassword,
    TResult Function(AuthEnterEmailForRecoveryEvent value)?
        enterEmailForRecovery,
    TResult Function(AuthConfirmEmailRecoveryEvent value)? confirmEmailRecovery,
    required TResult orElse(),
  }) {
    if (changePassword != null) {
      return changePassword(this);
    }
    return orElse();
  }
}

abstract class AuthChangePasswordEvent implements AuthEvent {
  const factory AuthChangePasswordEvent(
      {required final String oldPassword,
      required final String newPassword}) = _$AuthChangePasswordEvent;

  String get oldPassword;
  String get newPassword;
  @JsonKey(ignore: true)
  _$$AuthChangePasswordEventCopyWith<_$AuthChangePasswordEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthEnterEmailForRecoveryEventCopyWith<$Res> {
  factory _$$AuthEnterEmailForRecoveryEventCopyWith(
          _$AuthEnterEmailForRecoveryEvent value,
          $Res Function(_$AuthEnterEmailForRecoveryEvent) then) =
      __$$AuthEnterEmailForRecoveryEventCopyWithImpl<$Res>;
  $Res call({String email});
}

/// @nodoc
class __$$AuthEnterEmailForRecoveryEventCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res>
    implements _$$AuthEnterEmailForRecoveryEventCopyWith<$Res> {
  __$$AuthEnterEmailForRecoveryEventCopyWithImpl(
      _$AuthEnterEmailForRecoveryEvent _value,
      $Res Function(_$AuthEnterEmailForRecoveryEvent) _then)
      : super(_value, (v) => _then(v as _$AuthEnterEmailForRecoveryEvent));

  @override
  _$AuthEnterEmailForRecoveryEvent get _value =>
      super._value as _$AuthEnterEmailForRecoveryEvent;

  @override
  $Res call({
    Object? email = freezed,
  }) {
    return _then(_$AuthEnterEmailForRecoveryEvent(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthEnterEmailForRecoveryEvent
    implements AuthEnterEmailForRecoveryEvent {
  const _$AuthEnterEmailForRecoveryEvent({required this.email});

  @override
  final String email;

  @override
  String toString() {
    return 'AuthEvent.enterEmailForRecovery(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthEnterEmailForRecoveryEvent &&
            const DeepCollectionEquality().equals(other.email, email));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(email));

  @JsonKey(ignore: true)
  @override
  _$$AuthEnterEmailForRecoveryEventCopyWith<_$AuthEnterEmailForRecoveryEvent>
      get copyWith => __$$AuthEnterEmailForRecoveryEventCopyWithImpl<
          _$AuthEnterEmailForRecoveryEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password)
        signInWithEmailAndPassword,
    required TResult Function(String email, String password, String username)
        signUpWithEmailAndPassword,
    required TResult Function() signInWithGoogleAccount,
    required TResult Function() signInWithFacebookAccount,
    required TResult Function() signOut,
    required TResult Function() backToSigning,
    required TResult Function(User? user) changeAuthUser,
    required TResult Function() requestPasswordRecovery,
    required TResult Function(String oldPassword, String newPassword)
        changePassword,
    required TResult Function(String email) enterEmailForRecovery,
    required TResult Function() confirmEmailRecovery,
  }) {
    return enterEmailForRecovery(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email, String password)? signInWithEmailAndPassword,
    TResult Function(String email, String password, String username)?
        signUpWithEmailAndPassword,
    TResult Function()? signInWithGoogleAccount,
    TResult Function()? signInWithFacebookAccount,
    TResult Function()? signOut,
    TResult Function()? backToSigning,
    TResult Function(User? user)? changeAuthUser,
    TResult Function()? requestPasswordRecovery,
    TResult Function(String oldPassword, String newPassword)? changePassword,
    TResult Function(String email)? enterEmailForRecovery,
    TResult Function()? confirmEmailRecovery,
  }) {
    return enterEmailForRecovery?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signInWithEmailAndPassword,
    TResult Function(String email, String password, String username)?
        signUpWithEmailAndPassword,
    TResult Function()? signInWithGoogleAccount,
    TResult Function()? signInWithFacebookAccount,
    TResult Function()? signOut,
    TResult Function()? backToSigning,
    TResult Function(User? user)? changeAuthUser,
    TResult Function()? requestPasswordRecovery,
    TResult Function(String oldPassword, String newPassword)? changePassword,
    TResult Function(String email)? enterEmailForRecovery,
    TResult Function()? confirmEmailRecovery,
    required TResult orElse(),
  }) {
    if (enterEmailForRecovery != null) {
      return enterEmailForRecovery(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthSignInWithEmailAndPasswordEvent value)
        signInWithEmailAndPassword,
    required TResult Function(AuthSignUpWithEmailAndPasswordEvent value)
        signUpWithEmailAndPassword,
    required TResult Function(AuthSignInWithGoogleAccountEvent value)
        signInWithGoogleAccount,
    required TResult Function(AuthSignInWithFacebookAccountEvent value)
        signInWithFacebookAccount,
    required TResult Function(AuthSignOutEvent value) signOut,
    required TResult Function(AuthBackToSigningEvent value) backToSigning,
    required TResult Function(AuthChangeAuthUserEvent value) changeAuthUser,
    required TResult Function(AuthRequestPasswordRecoveryEvent value)
        requestPasswordRecovery,
    required TResult Function(AuthChangePasswordEvent value) changePassword,
    required TResult Function(AuthEnterEmailForRecoveryEvent value)
        enterEmailForRecovery,
    required TResult Function(AuthConfirmEmailRecoveryEvent value)
        confirmEmailRecovery,
  }) {
    return enterEmailForRecovery(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthSignInWithEmailAndPasswordEvent value)?
        signInWithEmailAndPassword,
    TResult Function(AuthSignUpWithEmailAndPasswordEvent value)?
        signUpWithEmailAndPassword,
    TResult Function(AuthSignInWithGoogleAccountEvent value)?
        signInWithGoogleAccount,
    TResult Function(AuthSignInWithFacebookAccountEvent value)?
        signInWithFacebookAccount,
    TResult Function(AuthSignOutEvent value)? signOut,
    TResult Function(AuthBackToSigningEvent value)? backToSigning,
    TResult Function(AuthChangeAuthUserEvent value)? changeAuthUser,
    TResult Function(AuthRequestPasswordRecoveryEvent value)?
        requestPasswordRecovery,
    TResult Function(AuthChangePasswordEvent value)? changePassword,
    TResult Function(AuthEnterEmailForRecoveryEvent value)?
        enterEmailForRecovery,
    TResult Function(AuthConfirmEmailRecoveryEvent value)? confirmEmailRecovery,
  }) {
    return enterEmailForRecovery?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthSignInWithEmailAndPasswordEvent value)?
        signInWithEmailAndPassword,
    TResult Function(AuthSignUpWithEmailAndPasswordEvent value)?
        signUpWithEmailAndPassword,
    TResult Function(AuthSignInWithGoogleAccountEvent value)?
        signInWithGoogleAccount,
    TResult Function(AuthSignInWithFacebookAccountEvent value)?
        signInWithFacebookAccount,
    TResult Function(AuthSignOutEvent value)? signOut,
    TResult Function(AuthBackToSigningEvent value)? backToSigning,
    TResult Function(AuthChangeAuthUserEvent value)? changeAuthUser,
    TResult Function(AuthRequestPasswordRecoveryEvent value)?
        requestPasswordRecovery,
    TResult Function(AuthChangePasswordEvent value)? changePassword,
    TResult Function(AuthEnterEmailForRecoveryEvent value)?
        enterEmailForRecovery,
    TResult Function(AuthConfirmEmailRecoveryEvent value)? confirmEmailRecovery,
    required TResult orElse(),
  }) {
    if (enterEmailForRecovery != null) {
      return enterEmailForRecovery(this);
    }
    return orElse();
  }
}

abstract class AuthEnterEmailForRecoveryEvent implements AuthEvent {
  const factory AuthEnterEmailForRecoveryEvent({required final String email}) =
      _$AuthEnterEmailForRecoveryEvent;

  String get email;
  @JsonKey(ignore: true)
  _$$AuthEnterEmailForRecoveryEventCopyWith<_$AuthEnterEmailForRecoveryEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthConfirmEmailRecoveryEventCopyWith<$Res> {
  factory _$$AuthConfirmEmailRecoveryEventCopyWith(
          _$AuthConfirmEmailRecoveryEvent value,
          $Res Function(_$AuthConfirmEmailRecoveryEvent) then) =
      __$$AuthConfirmEmailRecoveryEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthConfirmEmailRecoveryEventCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res>
    implements _$$AuthConfirmEmailRecoveryEventCopyWith<$Res> {
  __$$AuthConfirmEmailRecoveryEventCopyWithImpl(
      _$AuthConfirmEmailRecoveryEvent _value,
      $Res Function(_$AuthConfirmEmailRecoveryEvent) _then)
      : super(_value, (v) => _then(v as _$AuthConfirmEmailRecoveryEvent));

  @override
  _$AuthConfirmEmailRecoveryEvent get _value =>
      super._value as _$AuthConfirmEmailRecoveryEvent;
}

/// @nodoc

class _$AuthConfirmEmailRecoveryEvent implements AuthConfirmEmailRecoveryEvent {
  const _$AuthConfirmEmailRecoveryEvent();

  @override
  String toString() {
    return 'AuthEvent.confirmEmailRecovery()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthConfirmEmailRecoveryEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password)
        signInWithEmailAndPassword,
    required TResult Function(String email, String password, String username)
        signUpWithEmailAndPassword,
    required TResult Function() signInWithGoogleAccount,
    required TResult Function() signInWithFacebookAccount,
    required TResult Function() signOut,
    required TResult Function() backToSigning,
    required TResult Function(User? user) changeAuthUser,
    required TResult Function() requestPasswordRecovery,
    required TResult Function(String oldPassword, String newPassword)
        changePassword,
    required TResult Function(String email) enterEmailForRecovery,
    required TResult Function() confirmEmailRecovery,
  }) {
    return confirmEmailRecovery();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email, String password)? signInWithEmailAndPassword,
    TResult Function(String email, String password, String username)?
        signUpWithEmailAndPassword,
    TResult Function()? signInWithGoogleAccount,
    TResult Function()? signInWithFacebookAccount,
    TResult Function()? signOut,
    TResult Function()? backToSigning,
    TResult Function(User? user)? changeAuthUser,
    TResult Function()? requestPasswordRecovery,
    TResult Function(String oldPassword, String newPassword)? changePassword,
    TResult Function(String email)? enterEmailForRecovery,
    TResult Function()? confirmEmailRecovery,
  }) {
    return confirmEmailRecovery?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signInWithEmailAndPassword,
    TResult Function(String email, String password, String username)?
        signUpWithEmailAndPassword,
    TResult Function()? signInWithGoogleAccount,
    TResult Function()? signInWithFacebookAccount,
    TResult Function()? signOut,
    TResult Function()? backToSigning,
    TResult Function(User? user)? changeAuthUser,
    TResult Function()? requestPasswordRecovery,
    TResult Function(String oldPassword, String newPassword)? changePassword,
    TResult Function(String email)? enterEmailForRecovery,
    TResult Function()? confirmEmailRecovery,
    required TResult orElse(),
  }) {
    if (confirmEmailRecovery != null) {
      return confirmEmailRecovery();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthSignInWithEmailAndPasswordEvent value)
        signInWithEmailAndPassword,
    required TResult Function(AuthSignUpWithEmailAndPasswordEvent value)
        signUpWithEmailAndPassword,
    required TResult Function(AuthSignInWithGoogleAccountEvent value)
        signInWithGoogleAccount,
    required TResult Function(AuthSignInWithFacebookAccountEvent value)
        signInWithFacebookAccount,
    required TResult Function(AuthSignOutEvent value) signOut,
    required TResult Function(AuthBackToSigningEvent value) backToSigning,
    required TResult Function(AuthChangeAuthUserEvent value) changeAuthUser,
    required TResult Function(AuthRequestPasswordRecoveryEvent value)
        requestPasswordRecovery,
    required TResult Function(AuthChangePasswordEvent value) changePassword,
    required TResult Function(AuthEnterEmailForRecoveryEvent value)
        enterEmailForRecovery,
    required TResult Function(AuthConfirmEmailRecoveryEvent value)
        confirmEmailRecovery,
  }) {
    return confirmEmailRecovery(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthSignInWithEmailAndPasswordEvent value)?
        signInWithEmailAndPassword,
    TResult Function(AuthSignUpWithEmailAndPasswordEvent value)?
        signUpWithEmailAndPassword,
    TResult Function(AuthSignInWithGoogleAccountEvent value)?
        signInWithGoogleAccount,
    TResult Function(AuthSignInWithFacebookAccountEvent value)?
        signInWithFacebookAccount,
    TResult Function(AuthSignOutEvent value)? signOut,
    TResult Function(AuthBackToSigningEvent value)? backToSigning,
    TResult Function(AuthChangeAuthUserEvent value)? changeAuthUser,
    TResult Function(AuthRequestPasswordRecoveryEvent value)?
        requestPasswordRecovery,
    TResult Function(AuthChangePasswordEvent value)? changePassword,
    TResult Function(AuthEnterEmailForRecoveryEvent value)?
        enterEmailForRecovery,
    TResult Function(AuthConfirmEmailRecoveryEvent value)? confirmEmailRecovery,
  }) {
    return confirmEmailRecovery?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthSignInWithEmailAndPasswordEvent value)?
        signInWithEmailAndPassword,
    TResult Function(AuthSignUpWithEmailAndPasswordEvent value)?
        signUpWithEmailAndPassword,
    TResult Function(AuthSignInWithGoogleAccountEvent value)?
        signInWithGoogleAccount,
    TResult Function(AuthSignInWithFacebookAccountEvent value)?
        signInWithFacebookAccount,
    TResult Function(AuthSignOutEvent value)? signOut,
    TResult Function(AuthBackToSigningEvent value)? backToSigning,
    TResult Function(AuthChangeAuthUserEvent value)? changeAuthUser,
    TResult Function(AuthRequestPasswordRecoveryEvent value)?
        requestPasswordRecovery,
    TResult Function(AuthChangePasswordEvent value)? changePassword,
    TResult Function(AuthEnterEmailForRecoveryEvent value)?
        enterEmailForRecovery,
    TResult Function(AuthConfirmEmailRecoveryEvent value)? confirmEmailRecovery,
    required TResult orElse(),
  }) {
    if (confirmEmailRecovery != null) {
      return confirmEmailRecovery(this);
    }
    return orElse();
  }
}

abstract class AuthConfirmEmailRecoveryEvent implements AuthEvent {
  const factory AuthConfirmEmailRecoveryEvent() =
      _$AuthConfirmEmailRecoveryEvent;
}

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CustomError error) error,
    required TResult Function() forgotPassword,
    required TResult Function(String email) recoveryEmailPasswordLinkSent,
    required TResult Function(User user) authenticated,
    required TResult Function() notAuthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CustomError error)? error,
    TResult Function()? forgotPassword,
    TResult Function(String email)? recoveryEmailPasswordLinkSent,
    TResult Function(User user)? authenticated,
    TResult Function()? notAuthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CustomError error)? error,
    TResult Function()? forgotPassword,
    TResult Function(String email)? recoveryEmailPasswordLinkSent,
    TResult Function(User user)? authenticated,
    TResult Function()? notAuthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitialState value) initial,
    required TResult Function(AuthLoadingState value) loading,
    required TResult Function(AuthErrorState value) error,
    required TResult Function(AuthForgotPasswordState value) forgotPassword,
    required TResult Function(AuthRecoveryEmailPasswordLinkSentState value)
        recoveryEmailPasswordLinkSent,
    required TResult Function(AuthAuthenticatedState value) authenticated,
    required TResult Function(AuthNotAuthenticatedState value) notAuthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthInitialState value)? initial,
    TResult Function(AuthLoadingState value)? loading,
    TResult Function(AuthErrorState value)? error,
    TResult Function(AuthForgotPasswordState value)? forgotPassword,
    TResult Function(AuthRecoveryEmailPasswordLinkSentState value)?
        recoveryEmailPasswordLinkSent,
    TResult Function(AuthAuthenticatedState value)? authenticated,
    TResult Function(AuthNotAuthenticatedState value)? notAuthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitialState value)? initial,
    TResult Function(AuthLoadingState value)? loading,
    TResult Function(AuthErrorState value)? error,
    TResult Function(AuthForgotPasswordState value)? forgotPassword,
    TResult Function(AuthRecoveryEmailPasswordLinkSentState value)?
        recoveryEmailPasswordLinkSent,
    TResult Function(AuthAuthenticatedState value)? authenticated,
    TResult Function(AuthNotAuthenticatedState value)? notAuthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;
}

/// @nodoc
abstract class _$$AuthInitialStateCopyWith<$Res> {
  factory _$$AuthInitialStateCopyWith(
          _$AuthInitialState value, $Res Function(_$AuthInitialState) then) =
      __$$AuthInitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthInitialStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$$AuthInitialStateCopyWith<$Res> {
  __$$AuthInitialStateCopyWithImpl(
      _$AuthInitialState _value, $Res Function(_$AuthInitialState) _then)
      : super(_value, (v) => _then(v as _$AuthInitialState));

  @override
  _$AuthInitialState get _value => super._value as _$AuthInitialState;
}

/// @nodoc

class _$AuthInitialState extends AuthInitialState {
  const _$AuthInitialState() : super._();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthInitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CustomError error) error,
    required TResult Function() forgotPassword,
    required TResult Function(String email) recoveryEmailPasswordLinkSent,
    required TResult Function(User user) authenticated,
    required TResult Function() notAuthenticated,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CustomError error)? error,
    TResult Function()? forgotPassword,
    TResult Function(String email)? recoveryEmailPasswordLinkSent,
    TResult Function(User user)? authenticated,
    TResult Function()? notAuthenticated,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CustomError error)? error,
    TResult Function()? forgotPassword,
    TResult Function(String email)? recoveryEmailPasswordLinkSent,
    TResult Function(User user)? authenticated,
    TResult Function()? notAuthenticated,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitialState value) initial,
    required TResult Function(AuthLoadingState value) loading,
    required TResult Function(AuthErrorState value) error,
    required TResult Function(AuthForgotPasswordState value) forgotPassword,
    required TResult Function(AuthRecoveryEmailPasswordLinkSentState value)
        recoveryEmailPasswordLinkSent,
    required TResult Function(AuthAuthenticatedState value) authenticated,
    required TResult Function(AuthNotAuthenticatedState value) notAuthenticated,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthInitialState value)? initial,
    TResult Function(AuthLoadingState value)? loading,
    TResult Function(AuthErrorState value)? error,
    TResult Function(AuthForgotPasswordState value)? forgotPassword,
    TResult Function(AuthRecoveryEmailPasswordLinkSentState value)?
        recoveryEmailPasswordLinkSent,
    TResult Function(AuthAuthenticatedState value)? authenticated,
    TResult Function(AuthNotAuthenticatedState value)? notAuthenticated,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitialState value)? initial,
    TResult Function(AuthLoadingState value)? loading,
    TResult Function(AuthErrorState value)? error,
    TResult Function(AuthForgotPasswordState value)? forgotPassword,
    TResult Function(AuthRecoveryEmailPasswordLinkSentState value)?
        recoveryEmailPasswordLinkSent,
    TResult Function(AuthAuthenticatedState value)? authenticated,
    TResult Function(AuthNotAuthenticatedState value)? notAuthenticated,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AuthInitialState extends AuthState {
  const factory AuthInitialState() = _$AuthInitialState;
  const AuthInitialState._() : super._();
}

/// @nodoc
abstract class _$$AuthLoadingStateCopyWith<$Res> {
  factory _$$AuthLoadingStateCopyWith(
          _$AuthLoadingState value, $Res Function(_$AuthLoadingState) then) =
      __$$AuthLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthLoadingStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$$AuthLoadingStateCopyWith<$Res> {
  __$$AuthLoadingStateCopyWithImpl(
      _$AuthLoadingState _value, $Res Function(_$AuthLoadingState) _then)
      : super(_value, (v) => _then(v as _$AuthLoadingState));

  @override
  _$AuthLoadingState get _value => super._value as _$AuthLoadingState;
}

/// @nodoc

class _$AuthLoadingState extends AuthLoadingState {
  const _$AuthLoadingState() : super._();

  @override
  String toString() {
    return 'AuthState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CustomError error) error,
    required TResult Function() forgotPassword,
    required TResult Function(String email) recoveryEmailPasswordLinkSent,
    required TResult Function(User user) authenticated,
    required TResult Function() notAuthenticated,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CustomError error)? error,
    TResult Function()? forgotPassword,
    TResult Function(String email)? recoveryEmailPasswordLinkSent,
    TResult Function(User user)? authenticated,
    TResult Function()? notAuthenticated,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CustomError error)? error,
    TResult Function()? forgotPassword,
    TResult Function(String email)? recoveryEmailPasswordLinkSent,
    TResult Function(User user)? authenticated,
    TResult Function()? notAuthenticated,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitialState value) initial,
    required TResult Function(AuthLoadingState value) loading,
    required TResult Function(AuthErrorState value) error,
    required TResult Function(AuthForgotPasswordState value) forgotPassword,
    required TResult Function(AuthRecoveryEmailPasswordLinkSentState value)
        recoveryEmailPasswordLinkSent,
    required TResult Function(AuthAuthenticatedState value) authenticated,
    required TResult Function(AuthNotAuthenticatedState value) notAuthenticated,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthInitialState value)? initial,
    TResult Function(AuthLoadingState value)? loading,
    TResult Function(AuthErrorState value)? error,
    TResult Function(AuthForgotPasswordState value)? forgotPassword,
    TResult Function(AuthRecoveryEmailPasswordLinkSentState value)?
        recoveryEmailPasswordLinkSent,
    TResult Function(AuthAuthenticatedState value)? authenticated,
    TResult Function(AuthNotAuthenticatedState value)? notAuthenticated,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitialState value)? initial,
    TResult Function(AuthLoadingState value)? loading,
    TResult Function(AuthErrorState value)? error,
    TResult Function(AuthForgotPasswordState value)? forgotPassword,
    TResult Function(AuthRecoveryEmailPasswordLinkSentState value)?
        recoveryEmailPasswordLinkSent,
    TResult Function(AuthAuthenticatedState value)? authenticated,
    TResult Function(AuthNotAuthenticatedState value)? notAuthenticated,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AuthLoadingState extends AuthState {
  const factory AuthLoadingState() = _$AuthLoadingState;
  const AuthLoadingState._() : super._();
}

/// @nodoc
abstract class _$$AuthErrorStateCopyWith<$Res> {
  factory _$$AuthErrorStateCopyWith(
          _$AuthErrorState value, $Res Function(_$AuthErrorState) then) =
      __$$AuthErrorStateCopyWithImpl<$Res>;
  $Res call({CustomError error});
}

/// @nodoc
class __$$AuthErrorStateCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$$AuthErrorStateCopyWith<$Res> {
  __$$AuthErrorStateCopyWithImpl(
      _$AuthErrorState _value, $Res Function(_$AuthErrorState) _then)
      : super(_value, (v) => _then(v as _$AuthErrorState));

  @override
  _$AuthErrorState get _value => super._value as _$AuthErrorState;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$AuthErrorState(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as CustomError,
    ));
  }
}

/// @nodoc

class _$AuthErrorState extends AuthErrorState {
  const _$AuthErrorState({required this.error}) : super._();

  @override
  final CustomError error;

  @override
  String toString() {
    return 'AuthState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthErrorState &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$AuthErrorStateCopyWith<_$AuthErrorState> get copyWith =>
      __$$AuthErrorStateCopyWithImpl<_$AuthErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CustomError error) error,
    required TResult Function() forgotPassword,
    required TResult Function(String email) recoveryEmailPasswordLinkSent,
    required TResult Function(User user) authenticated,
    required TResult Function() notAuthenticated,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CustomError error)? error,
    TResult Function()? forgotPassword,
    TResult Function(String email)? recoveryEmailPasswordLinkSent,
    TResult Function(User user)? authenticated,
    TResult Function()? notAuthenticated,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CustomError error)? error,
    TResult Function()? forgotPassword,
    TResult Function(String email)? recoveryEmailPasswordLinkSent,
    TResult Function(User user)? authenticated,
    TResult Function()? notAuthenticated,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitialState value) initial,
    required TResult Function(AuthLoadingState value) loading,
    required TResult Function(AuthErrorState value) error,
    required TResult Function(AuthForgotPasswordState value) forgotPassword,
    required TResult Function(AuthRecoveryEmailPasswordLinkSentState value)
        recoveryEmailPasswordLinkSent,
    required TResult Function(AuthAuthenticatedState value) authenticated,
    required TResult Function(AuthNotAuthenticatedState value) notAuthenticated,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthInitialState value)? initial,
    TResult Function(AuthLoadingState value)? loading,
    TResult Function(AuthErrorState value)? error,
    TResult Function(AuthForgotPasswordState value)? forgotPassword,
    TResult Function(AuthRecoveryEmailPasswordLinkSentState value)?
        recoveryEmailPasswordLinkSent,
    TResult Function(AuthAuthenticatedState value)? authenticated,
    TResult Function(AuthNotAuthenticatedState value)? notAuthenticated,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitialState value)? initial,
    TResult Function(AuthLoadingState value)? loading,
    TResult Function(AuthErrorState value)? error,
    TResult Function(AuthForgotPasswordState value)? forgotPassword,
    TResult Function(AuthRecoveryEmailPasswordLinkSentState value)?
        recoveryEmailPasswordLinkSent,
    TResult Function(AuthAuthenticatedState value)? authenticated,
    TResult Function(AuthNotAuthenticatedState value)? notAuthenticated,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AuthErrorState extends AuthState {
  const factory AuthErrorState({required final CustomError error}) =
      _$AuthErrorState;
  const AuthErrorState._() : super._();

  CustomError get error;
  @JsonKey(ignore: true)
  _$$AuthErrorStateCopyWith<_$AuthErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthForgotPasswordStateCopyWith<$Res> {
  factory _$$AuthForgotPasswordStateCopyWith(_$AuthForgotPasswordState value,
          $Res Function(_$AuthForgotPasswordState) then) =
      __$$AuthForgotPasswordStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthForgotPasswordStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$$AuthForgotPasswordStateCopyWith<$Res> {
  __$$AuthForgotPasswordStateCopyWithImpl(_$AuthForgotPasswordState _value,
      $Res Function(_$AuthForgotPasswordState) _then)
      : super(_value, (v) => _then(v as _$AuthForgotPasswordState));

  @override
  _$AuthForgotPasswordState get _value =>
      super._value as _$AuthForgotPasswordState;
}

/// @nodoc

class _$AuthForgotPasswordState extends AuthForgotPasswordState {
  const _$AuthForgotPasswordState() : super._();

  @override
  String toString() {
    return 'AuthState.forgotPassword()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthForgotPasswordState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CustomError error) error,
    required TResult Function() forgotPassword,
    required TResult Function(String email) recoveryEmailPasswordLinkSent,
    required TResult Function(User user) authenticated,
    required TResult Function() notAuthenticated,
  }) {
    return forgotPassword();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CustomError error)? error,
    TResult Function()? forgotPassword,
    TResult Function(String email)? recoveryEmailPasswordLinkSent,
    TResult Function(User user)? authenticated,
    TResult Function()? notAuthenticated,
  }) {
    return forgotPassword?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CustomError error)? error,
    TResult Function()? forgotPassword,
    TResult Function(String email)? recoveryEmailPasswordLinkSent,
    TResult Function(User user)? authenticated,
    TResult Function()? notAuthenticated,
    required TResult orElse(),
  }) {
    if (forgotPassword != null) {
      return forgotPassword();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitialState value) initial,
    required TResult Function(AuthLoadingState value) loading,
    required TResult Function(AuthErrorState value) error,
    required TResult Function(AuthForgotPasswordState value) forgotPassword,
    required TResult Function(AuthRecoveryEmailPasswordLinkSentState value)
        recoveryEmailPasswordLinkSent,
    required TResult Function(AuthAuthenticatedState value) authenticated,
    required TResult Function(AuthNotAuthenticatedState value) notAuthenticated,
  }) {
    return forgotPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthInitialState value)? initial,
    TResult Function(AuthLoadingState value)? loading,
    TResult Function(AuthErrorState value)? error,
    TResult Function(AuthForgotPasswordState value)? forgotPassword,
    TResult Function(AuthRecoveryEmailPasswordLinkSentState value)?
        recoveryEmailPasswordLinkSent,
    TResult Function(AuthAuthenticatedState value)? authenticated,
    TResult Function(AuthNotAuthenticatedState value)? notAuthenticated,
  }) {
    return forgotPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitialState value)? initial,
    TResult Function(AuthLoadingState value)? loading,
    TResult Function(AuthErrorState value)? error,
    TResult Function(AuthForgotPasswordState value)? forgotPassword,
    TResult Function(AuthRecoveryEmailPasswordLinkSentState value)?
        recoveryEmailPasswordLinkSent,
    TResult Function(AuthAuthenticatedState value)? authenticated,
    TResult Function(AuthNotAuthenticatedState value)? notAuthenticated,
    required TResult orElse(),
  }) {
    if (forgotPassword != null) {
      return forgotPassword(this);
    }
    return orElse();
  }
}

abstract class AuthForgotPasswordState extends AuthState {
  const factory AuthForgotPasswordState() = _$AuthForgotPasswordState;
  const AuthForgotPasswordState._() : super._();
}

/// @nodoc
abstract class _$$AuthRecoveryEmailPasswordLinkSentStateCopyWith<$Res> {
  factory _$$AuthRecoveryEmailPasswordLinkSentStateCopyWith(
          _$AuthRecoveryEmailPasswordLinkSentState value,
          $Res Function(_$AuthRecoveryEmailPasswordLinkSentState) then) =
      __$$AuthRecoveryEmailPasswordLinkSentStateCopyWithImpl<$Res>;
  $Res call({String email});
}

/// @nodoc
class __$$AuthRecoveryEmailPasswordLinkSentStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$$AuthRecoveryEmailPasswordLinkSentStateCopyWith<$Res> {
  __$$AuthRecoveryEmailPasswordLinkSentStateCopyWithImpl(
      _$AuthRecoveryEmailPasswordLinkSentState _value,
      $Res Function(_$AuthRecoveryEmailPasswordLinkSentState) _then)
      : super(_value,
            (v) => _then(v as _$AuthRecoveryEmailPasswordLinkSentState));

  @override
  _$AuthRecoveryEmailPasswordLinkSentState get _value =>
      super._value as _$AuthRecoveryEmailPasswordLinkSentState;

  @override
  $Res call({
    Object? email = freezed,
  }) {
    return _then(_$AuthRecoveryEmailPasswordLinkSentState(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthRecoveryEmailPasswordLinkSentState
    extends AuthRecoveryEmailPasswordLinkSentState {
  const _$AuthRecoveryEmailPasswordLinkSentState({required this.email})
      : super._();

  @override
  final String email;

  @override
  String toString() {
    return 'AuthState.recoveryEmailPasswordLinkSent(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthRecoveryEmailPasswordLinkSentState &&
            const DeepCollectionEquality().equals(other.email, email));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(email));

  @JsonKey(ignore: true)
  @override
  _$$AuthRecoveryEmailPasswordLinkSentStateCopyWith<
          _$AuthRecoveryEmailPasswordLinkSentState>
      get copyWith => __$$AuthRecoveryEmailPasswordLinkSentStateCopyWithImpl<
          _$AuthRecoveryEmailPasswordLinkSentState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CustomError error) error,
    required TResult Function() forgotPassword,
    required TResult Function(String email) recoveryEmailPasswordLinkSent,
    required TResult Function(User user) authenticated,
    required TResult Function() notAuthenticated,
  }) {
    return recoveryEmailPasswordLinkSent(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CustomError error)? error,
    TResult Function()? forgotPassword,
    TResult Function(String email)? recoveryEmailPasswordLinkSent,
    TResult Function(User user)? authenticated,
    TResult Function()? notAuthenticated,
  }) {
    return recoveryEmailPasswordLinkSent?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CustomError error)? error,
    TResult Function()? forgotPassword,
    TResult Function(String email)? recoveryEmailPasswordLinkSent,
    TResult Function(User user)? authenticated,
    TResult Function()? notAuthenticated,
    required TResult orElse(),
  }) {
    if (recoveryEmailPasswordLinkSent != null) {
      return recoveryEmailPasswordLinkSent(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitialState value) initial,
    required TResult Function(AuthLoadingState value) loading,
    required TResult Function(AuthErrorState value) error,
    required TResult Function(AuthForgotPasswordState value) forgotPassword,
    required TResult Function(AuthRecoveryEmailPasswordLinkSentState value)
        recoveryEmailPasswordLinkSent,
    required TResult Function(AuthAuthenticatedState value) authenticated,
    required TResult Function(AuthNotAuthenticatedState value) notAuthenticated,
  }) {
    return recoveryEmailPasswordLinkSent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthInitialState value)? initial,
    TResult Function(AuthLoadingState value)? loading,
    TResult Function(AuthErrorState value)? error,
    TResult Function(AuthForgotPasswordState value)? forgotPassword,
    TResult Function(AuthRecoveryEmailPasswordLinkSentState value)?
        recoveryEmailPasswordLinkSent,
    TResult Function(AuthAuthenticatedState value)? authenticated,
    TResult Function(AuthNotAuthenticatedState value)? notAuthenticated,
  }) {
    return recoveryEmailPasswordLinkSent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitialState value)? initial,
    TResult Function(AuthLoadingState value)? loading,
    TResult Function(AuthErrorState value)? error,
    TResult Function(AuthForgotPasswordState value)? forgotPassword,
    TResult Function(AuthRecoveryEmailPasswordLinkSentState value)?
        recoveryEmailPasswordLinkSent,
    TResult Function(AuthAuthenticatedState value)? authenticated,
    TResult Function(AuthNotAuthenticatedState value)? notAuthenticated,
    required TResult orElse(),
  }) {
    if (recoveryEmailPasswordLinkSent != null) {
      return recoveryEmailPasswordLinkSent(this);
    }
    return orElse();
  }
}

abstract class AuthRecoveryEmailPasswordLinkSentState extends AuthState {
  const factory AuthRecoveryEmailPasswordLinkSentState(
      {required final String email}) = _$AuthRecoveryEmailPasswordLinkSentState;
  const AuthRecoveryEmailPasswordLinkSentState._() : super._();

  String get email;
  @JsonKey(ignore: true)
  _$$AuthRecoveryEmailPasswordLinkSentStateCopyWith<
          _$AuthRecoveryEmailPasswordLinkSentState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthAuthenticatedStateCopyWith<$Res> {
  factory _$$AuthAuthenticatedStateCopyWith(_$AuthAuthenticatedState value,
          $Res Function(_$AuthAuthenticatedState) then) =
      __$$AuthAuthenticatedStateCopyWithImpl<$Res>;
  $Res call({User user});
}

/// @nodoc
class __$$AuthAuthenticatedStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$$AuthAuthenticatedStateCopyWith<$Res> {
  __$$AuthAuthenticatedStateCopyWithImpl(_$AuthAuthenticatedState _value,
      $Res Function(_$AuthAuthenticatedState) _then)
      : super(_value, (v) => _then(v as _$AuthAuthenticatedState));

  @override
  _$AuthAuthenticatedState get _value =>
      super._value as _$AuthAuthenticatedState;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$AuthAuthenticatedState(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$AuthAuthenticatedState extends AuthAuthenticatedState {
  const _$AuthAuthenticatedState({required this.user}) : super._();

  @override
  final User user;

  @override
  String toString() {
    return 'AuthState.authenticated(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthAuthenticatedState &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$$AuthAuthenticatedStateCopyWith<_$AuthAuthenticatedState> get copyWith =>
      __$$AuthAuthenticatedStateCopyWithImpl<_$AuthAuthenticatedState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CustomError error) error,
    required TResult Function() forgotPassword,
    required TResult Function(String email) recoveryEmailPasswordLinkSent,
    required TResult Function(User user) authenticated,
    required TResult Function() notAuthenticated,
  }) {
    return authenticated(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CustomError error)? error,
    TResult Function()? forgotPassword,
    TResult Function(String email)? recoveryEmailPasswordLinkSent,
    TResult Function(User user)? authenticated,
    TResult Function()? notAuthenticated,
  }) {
    return authenticated?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CustomError error)? error,
    TResult Function()? forgotPassword,
    TResult Function(String email)? recoveryEmailPasswordLinkSent,
    TResult Function(User user)? authenticated,
    TResult Function()? notAuthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitialState value) initial,
    required TResult Function(AuthLoadingState value) loading,
    required TResult Function(AuthErrorState value) error,
    required TResult Function(AuthForgotPasswordState value) forgotPassword,
    required TResult Function(AuthRecoveryEmailPasswordLinkSentState value)
        recoveryEmailPasswordLinkSent,
    required TResult Function(AuthAuthenticatedState value) authenticated,
    required TResult Function(AuthNotAuthenticatedState value) notAuthenticated,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthInitialState value)? initial,
    TResult Function(AuthLoadingState value)? loading,
    TResult Function(AuthErrorState value)? error,
    TResult Function(AuthForgotPasswordState value)? forgotPassword,
    TResult Function(AuthRecoveryEmailPasswordLinkSentState value)?
        recoveryEmailPasswordLinkSent,
    TResult Function(AuthAuthenticatedState value)? authenticated,
    TResult Function(AuthNotAuthenticatedState value)? notAuthenticated,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitialState value)? initial,
    TResult Function(AuthLoadingState value)? loading,
    TResult Function(AuthErrorState value)? error,
    TResult Function(AuthForgotPasswordState value)? forgotPassword,
    TResult Function(AuthRecoveryEmailPasswordLinkSentState value)?
        recoveryEmailPasswordLinkSent,
    TResult Function(AuthAuthenticatedState value)? authenticated,
    TResult Function(AuthNotAuthenticatedState value)? notAuthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class AuthAuthenticatedState extends AuthState {
  const factory AuthAuthenticatedState({required final User user}) =
      _$AuthAuthenticatedState;
  const AuthAuthenticatedState._() : super._();

  User get user;
  @JsonKey(ignore: true)
  _$$AuthAuthenticatedStateCopyWith<_$AuthAuthenticatedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthNotAuthenticatedStateCopyWith<$Res> {
  factory _$$AuthNotAuthenticatedStateCopyWith(
          _$AuthNotAuthenticatedState value,
          $Res Function(_$AuthNotAuthenticatedState) then) =
      __$$AuthNotAuthenticatedStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthNotAuthenticatedStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$$AuthNotAuthenticatedStateCopyWith<$Res> {
  __$$AuthNotAuthenticatedStateCopyWithImpl(_$AuthNotAuthenticatedState _value,
      $Res Function(_$AuthNotAuthenticatedState) _then)
      : super(_value, (v) => _then(v as _$AuthNotAuthenticatedState));

  @override
  _$AuthNotAuthenticatedState get _value =>
      super._value as _$AuthNotAuthenticatedState;
}

/// @nodoc

class _$AuthNotAuthenticatedState extends AuthNotAuthenticatedState {
  const _$AuthNotAuthenticatedState() : super._();

  @override
  String toString() {
    return 'AuthState.notAuthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthNotAuthenticatedState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CustomError error) error,
    required TResult Function() forgotPassword,
    required TResult Function(String email) recoveryEmailPasswordLinkSent,
    required TResult Function(User user) authenticated,
    required TResult Function() notAuthenticated,
  }) {
    return notAuthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CustomError error)? error,
    TResult Function()? forgotPassword,
    TResult Function(String email)? recoveryEmailPasswordLinkSent,
    TResult Function(User user)? authenticated,
    TResult Function()? notAuthenticated,
  }) {
    return notAuthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CustomError error)? error,
    TResult Function()? forgotPassword,
    TResult Function(String email)? recoveryEmailPasswordLinkSent,
    TResult Function(User user)? authenticated,
    TResult Function()? notAuthenticated,
    required TResult orElse(),
  }) {
    if (notAuthenticated != null) {
      return notAuthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitialState value) initial,
    required TResult Function(AuthLoadingState value) loading,
    required TResult Function(AuthErrorState value) error,
    required TResult Function(AuthForgotPasswordState value) forgotPassword,
    required TResult Function(AuthRecoveryEmailPasswordLinkSentState value)
        recoveryEmailPasswordLinkSent,
    required TResult Function(AuthAuthenticatedState value) authenticated,
    required TResult Function(AuthNotAuthenticatedState value) notAuthenticated,
  }) {
    return notAuthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthInitialState value)? initial,
    TResult Function(AuthLoadingState value)? loading,
    TResult Function(AuthErrorState value)? error,
    TResult Function(AuthForgotPasswordState value)? forgotPassword,
    TResult Function(AuthRecoveryEmailPasswordLinkSentState value)?
        recoveryEmailPasswordLinkSent,
    TResult Function(AuthAuthenticatedState value)? authenticated,
    TResult Function(AuthNotAuthenticatedState value)? notAuthenticated,
  }) {
    return notAuthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitialState value)? initial,
    TResult Function(AuthLoadingState value)? loading,
    TResult Function(AuthErrorState value)? error,
    TResult Function(AuthForgotPasswordState value)? forgotPassword,
    TResult Function(AuthRecoveryEmailPasswordLinkSentState value)?
        recoveryEmailPasswordLinkSent,
    TResult Function(AuthAuthenticatedState value)? authenticated,
    TResult Function(AuthNotAuthenticatedState value)? notAuthenticated,
    required TResult orElse(),
  }) {
    if (notAuthenticated != null) {
      return notAuthenticated(this);
    }
    return orElse();
  }
}

abstract class AuthNotAuthenticatedState extends AuthState {
  const factory AuthNotAuthenticatedState() = _$AuthNotAuthenticatedState;
  const AuthNotAuthenticatedState._() : super._();
}
