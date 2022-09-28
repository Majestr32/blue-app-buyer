// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String? get uid => throw _privateConstructorUsedError;
  set uid(String? value) => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  fb.User? get user => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  set user(fb.User? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  set createdAt(DateTime? value) => throw _privateConstructorUsedError;
  bool? get activated => throw _privateConstructorUsedError;
  set activated(bool? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'ended_tutorial')
  bool? get endedTutorial => throw _privateConstructorUsedError;
  @JsonKey(name: 'ended_tutorial')
  set endedTutorial(bool? value) => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  set username(String? value) => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  set phone(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_img_url')
  String? get profileImgUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_img_url')
  set profileImgUrl(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {String? uid,
      @JsonKey(ignore: true) fb.User? user,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      bool? activated,
      @JsonKey(name: 'ended_tutorial') bool? endedTutorial,
      String? username,
      String? phone,
      @JsonKey(name: 'profile_img_url') String? profileImgUrl});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? user = freezed,
    Object? createdAt = freezed,
    Object? activated = freezed,
    Object? endedTutorial = freezed,
    Object? username = freezed,
    Object? phone = freezed,
    Object? profileImgUrl = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as fb.User?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      activated: activated == freezed
          ? _value.activated
          : activated // ignore: cast_nullable_to_non_nullable
              as bool?,
      endedTutorial: endedTutorial == freezed
          ? _value.endedTutorial
          : endedTutorial // ignore: cast_nullable_to_non_nullable
              as bool?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImgUrl: profileImgUrl == freezed
          ? _value.profileImgUrl
          : profileImgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? uid,
      @JsonKey(ignore: true) fb.User? user,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      bool? activated,
      @JsonKey(name: 'ended_tutorial') bool? endedTutorial,
      String? username,
      String? phone,
      @JsonKey(name: 'profile_img_url') String? profileImgUrl});
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, (v) => _then(v as _$_User));

  @override
  _$_User get _value => super._value as _$_User;

  @override
  $Res call({
    Object? uid = freezed,
    Object? user = freezed,
    Object? createdAt = freezed,
    Object? activated = freezed,
    Object? endedTutorial = freezed,
    Object? username = freezed,
    Object? phone = freezed,
    Object? profileImgUrl = freezed,
  }) {
    return _then(_$_User(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as fb.User?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      activated: activated == freezed
          ? _value.activated
          : activated // ignore: cast_nullable_to_non_nullable
              as bool?,
      endedTutorial: endedTutorial == freezed
          ? _value.endedTutorial
          : endedTutorial // ignore: cast_nullable_to_non_nullable
              as bool?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImgUrl: profileImgUrl == freezed
          ? _value.profileImgUrl
          : profileImgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User extends _User {
  _$_User(
      {this.uid,
      @JsonKey(ignore: true) this.user,
      @JsonKey(name: 'created_at') this.createdAt,
      this.activated,
      @JsonKey(name: 'ended_tutorial') this.endedTutorial,
      this.username,
      this.phone,
      @JsonKey(name: 'profile_img_url') this.profileImgUrl})
      : super._();

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  String? uid;
  @override
  @JsonKey(ignore: true)
  fb.User? user;
  @override
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @override
  bool? activated;
  @override
  @JsonKey(name: 'ended_tutorial')
  bool? endedTutorial;
  @override
  String? username;
  @override
  String? phone;
  @override
  @JsonKey(name: 'profile_img_url')
  String? profileImgUrl;

  @override
  String toString() {
    return 'User(uid: $uid, user: $user, createdAt: $createdAt, activated: $activated, endedTutorial: $endedTutorial, username: $username, phone: $phone, profileImgUrl: $profileImgUrl)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User extends User {
  factory _User(
      {String? uid,
      @JsonKey(ignore: true) fb.User? user,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      bool? activated,
      @JsonKey(name: 'ended_tutorial') bool? endedTutorial,
      String? username,
      String? phone,
      @JsonKey(name: 'profile_img_url') String? profileImgUrl}) = _$_User;
  _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String? get uid;
  set uid(String? value);
  @override
  @JsonKey(ignore: true)
  fb.User? get user;
  @JsonKey(ignore: true)
  set user(fb.User? value);
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @JsonKey(name: 'created_at')
  set createdAt(DateTime? value);
  @override
  bool? get activated;
  set activated(bool? value);
  @override
  @JsonKey(name: 'ended_tutorial')
  bool? get endedTutorial;
  @JsonKey(name: 'ended_tutorial')
  set endedTutorial(bool? value);
  @override
  String? get username;
  set username(String? value);
  @override
  String? get phone;
  set phone(String? value);
  @override
  @JsonKey(name: 'profile_img_url')
  String? get profileImgUrl;
  @JsonKey(name: 'profile_img_url')
  set profileImgUrl(String? value);
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
