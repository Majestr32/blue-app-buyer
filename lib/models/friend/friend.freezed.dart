// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'friend.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Friend _$FriendFromJson(Map<String, dynamic> json) {
  return _Friend.fromJson(json);
}

/// @nodoc
mixin _$Friend {
  @JsonKey(name: 'initiator_uid')
  String get initiatorUid => throw _privateConstructorUsedError;
  @JsonKey(name: 'receiver_uid')
  String get receiverUid => throw _privateConstructorUsedError;
  @JsonKey(name: 'friend')
  User get friend => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FriendCopyWith<Friend> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendCopyWith<$Res> {
  factory $FriendCopyWith(Friend value, $Res Function(Friend) then) =
      _$FriendCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'initiator_uid') String initiatorUid,
      @JsonKey(name: 'receiver_uid') String receiverUid,
      @JsonKey(name: 'friend') User friend});

  $UserCopyWith<$Res> get friend;
}

/// @nodoc
class _$FriendCopyWithImpl<$Res> implements $FriendCopyWith<$Res> {
  _$FriendCopyWithImpl(this._value, this._then);

  final Friend _value;
  // ignore: unused_field
  final $Res Function(Friend) _then;

  @override
  $Res call({
    Object? initiatorUid = freezed,
    Object? receiverUid = freezed,
    Object? friend = freezed,
  }) {
    return _then(_value.copyWith(
      initiatorUid: initiatorUid == freezed
          ? _value.initiatorUid
          : initiatorUid // ignore: cast_nullable_to_non_nullable
              as String,
      receiverUid: receiverUid == freezed
          ? _value.receiverUid
          : receiverUid // ignore: cast_nullable_to_non_nullable
              as String,
      friend: friend == freezed
          ? _value.friend
          : friend // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  $UserCopyWith<$Res> get friend {
    return $UserCopyWith<$Res>(_value.friend, (value) {
      return _then(_value.copyWith(friend: value));
    });
  }
}

/// @nodoc
abstract class _$$_FriendCopyWith<$Res> implements $FriendCopyWith<$Res> {
  factory _$$_FriendCopyWith(_$_Friend value, $Res Function(_$_Friend) then) =
      __$$_FriendCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'initiator_uid') String initiatorUid,
      @JsonKey(name: 'receiver_uid') String receiverUid,
      @JsonKey(name: 'friend') User friend});

  @override
  $UserCopyWith<$Res> get friend;
}

/// @nodoc
class __$$_FriendCopyWithImpl<$Res> extends _$FriendCopyWithImpl<$Res>
    implements _$$_FriendCopyWith<$Res> {
  __$$_FriendCopyWithImpl(_$_Friend _value, $Res Function(_$_Friend) _then)
      : super(_value, (v) => _then(v as _$_Friend));

  @override
  _$_Friend get _value => super._value as _$_Friend;

  @override
  $Res call({
    Object? initiatorUid = freezed,
    Object? receiverUid = freezed,
    Object? friend = freezed,
  }) {
    return _then(_$_Friend(
      initiatorUid: initiatorUid == freezed
          ? _value.initiatorUid
          : initiatorUid // ignore: cast_nullable_to_non_nullable
              as String,
      receiverUid: receiverUid == freezed
          ? _value.receiverUid
          : receiverUid // ignore: cast_nullable_to_non_nullable
              as String,
      friend: friend == freezed
          ? _value.friend
          : friend // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Friend extends _Friend {
  _$_Friend(
      {@JsonKey(name: 'initiator_uid') required this.initiatorUid,
      @JsonKey(name: 'receiver_uid') required this.receiverUid,
      @JsonKey(name: 'friend') required this.friend})
      : super._();

  factory _$_Friend.fromJson(Map<String, dynamic> json) =>
      _$$_FriendFromJson(json);

  @override
  @JsonKey(name: 'initiator_uid')
  final String initiatorUid;
  @override
  @JsonKey(name: 'receiver_uid')
  final String receiverUid;
  @override
  @JsonKey(name: 'friend')
  final User friend;

  @override
  String toString() {
    return 'Friend(initiatorUid: $initiatorUid, receiverUid: $receiverUid, friend: $friend)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Friend &&
            const DeepCollectionEquality()
                .equals(other.initiatorUid, initiatorUid) &&
            const DeepCollectionEquality()
                .equals(other.receiverUid, receiverUid) &&
            const DeepCollectionEquality().equals(other.friend, friend));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(initiatorUid),
      const DeepCollectionEquality().hash(receiverUid),
      const DeepCollectionEquality().hash(friend));

  @JsonKey(ignore: true)
  @override
  _$$_FriendCopyWith<_$_Friend> get copyWith =>
      __$$_FriendCopyWithImpl<_$_Friend>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FriendToJson(
      this,
    );
  }
}

abstract class _Friend extends Friend {
  factory _Friend(
      {@JsonKey(name: 'initiator_uid') required final String initiatorUid,
      @JsonKey(name: 'receiver_uid') required final String receiverUid,
      @JsonKey(name: 'friend') required final User friend}) = _$_Friend;
  _Friend._() : super._();

  factory _Friend.fromJson(Map<String, dynamic> json) = _$_Friend.fromJson;

  @override
  @JsonKey(name: 'initiator_uid')
  String get initiatorUid;
  @override
  @JsonKey(name: 'receiver_uid')
  String get receiverUid;
  @override
  @JsonKey(name: 'friend')
  User get friend;
  @override
  @JsonKey(ignore: true)
  _$$_FriendCopyWith<_$_Friend> get copyWith =>
      throw _privateConstructorUsedError;
}
