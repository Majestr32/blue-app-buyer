// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_coupon.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserCoupon _$UserCouponFromJson(Map<String, dynamic> json) {
  return _UserCoupon.fromJson(json);
}

/// @nodoc
mixin _$UserCoupon {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'display_id')
  int get displayId => throw _privateConstructorUsedError;
  @JsonKey(name: 'coupon_id')
  int get couponId => throw _privateConstructorUsedError;
  String get qr => throw _privateConstructorUsedError;
  @JsonKey(name: 'buyer_uid')
  String get buyerUid => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_id')
  String get transactionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'sent_to')
  String? get sentTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'sent_to_name')
  String? get sentToName => throw _privateConstructorUsedError;
  @JsonKey(name: 'sent_from_name')
  String? get sentFromName => throw _privateConstructorUsedError;
  @JsonKey(name: 'commented')
  int get commented => throw _privateConstructorUsedError;
  @JsonKey(name: 'coupon')
  Coupon get coupon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCouponCopyWith<UserCoupon> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCouponCopyWith<$Res> {
  factory $UserCouponCopyWith(
          UserCoupon value, $Res Function(UserCoupon) then) =
      _$UserCouponCopyWithImpl<$Res>;
  $Res call(
      {int id,
      @JsonKey(name: 'display_id') int displayId,
      @JsonKey(name: 'coupon_id') int couponId,
      String qr,
      @JsonKey(name: 'buyer_uid') String buyerUid,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'transaction_id') String transactionId,
      @JsonKey(name: 'sent_to') String? sentTo,
      @JsonKey(name: 'sent_to_name') String? sentToName,
      @JsonKey(name: 'sent_from_name') String? sentFromName,
      @JsonKey(name: 'commented') int commented,
      @JsonKey(name: 'coupon') Coupon coupon});

  $CouponCopyWith<$Res> get coupon;
}

/// @nodoc
class _$UserCouponCopyWithImpl<$Res> implements $UserCouponCopyWith<$Res> {
  _$UserCouponCopyWithImpl(this._value, this._then);

  final UserCoupon _value;
  // ignore: unused_field
  final $Res Function(UserCoupon) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? displayId = freezed,
    Object? couponId = freezed,
    Object? qr = freezed,
    Object? buyerUid = freezed,
    Object? createdAt = freezed,
    Object? transactionId = freezed,
    Object? sentTo = freezed,
    Object? sentToName = freezed,
    Object? sentFromName = freezed,
    Object? commented = freezed,
    Object? coupon = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      displayId: displayId == freezed
          ? _value.displayId
          : displayId // ignore: cast_nullable_to_non_nullable
              as int,
      couponId: couponId == freezed
          ? _value.couponId
          : couponId // ignore: cast_nullable_to_non_nullable
              as int,
      qr: qr == freezed
          ? _value.qr
          : qr // ignore: cast_nullable_to_non_nullable
              as String,
      buyerUid: buyerUid == freezed
          ? _value.buyerUid
          : buyerUid // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      transactionId: transactionId == freezed
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      sentTo: sentTo == freezed
          ? _value.sentTo
          : sentTo // ignore: cast_nullable_to_non_nullable
              as String?,
      sentToName: sentToName == freezed
          ? _value.sentToName
          : sentToName // ignore: cast_nullable_to_non_nullable
              as String?,
      sentFromName: sentFromName == freezed
          ? _value.sentFromName
          : sentFromName // ignore: cast_nullable_to_non_nullable
              as String?,
      commented: commented == freezed
          ? _value.commented
          : commented // ignore: cast_nullable_to_non_nullable
              as int,
      coupon: coupon == freezed
          ? _value.coupon
          : coupon // ignore: cast_nullable_to_non_nullable
              as Coupon,
    ));
  }

  @override
  $CouponCopyWith<$Res> get coupon {
    return $CouponCopyWith<$Res>(_value.coupon, (value) {
      return _then(_value.copyWith(coupon: value));
    });
  }
}

/// @nodoc
abstract class _$$_UserCouponCopyWith<$Res>
    implements $UserCouponCopyWith<$Res> {
  factory _$$_UserCouponCopyWith(
          _$_UserCoupon value, $Res Function(_$_UserCoupon) then) =
      __$$_UserCouponCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      @JsonKey(name: 'display_id') int displayId,
      @JsonKey(name: 'coupon_id') int couponId,
      String qr,
      @JsonKey(name: 'buyer_uid') String buyerUid,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'transaction_id') String transactionId,
      @JsonKey(name: 'sent_to') String? sentTo,
      @JsonKey(name: 'sent_to_name') String? sentToName,
      @JsonKey(name: 'sent_from_name') String? sentFromName,
      @JsonKey(name: 'commented') int commented,
      @JsonKey(name: 'coupon') Coupon coupon});

  @override
  $CouponCopyWith<$Res> get coupon;
}

/// @nodoc
class __$$_UserCouponCopyWithImpl<$Res> extends _$UserCouponCopyWithImpl<$Res>
    implements _$$_UserCouponCopyWith<$Res> {
  __$$_UserCouponCopyWithImpl(
      _$_UserCoupon _value, $Res Function(_$_UserCoupon) _then)
      : super(_value, (v) => _then(v as _$_UserCoupon));

  @override
  _$_UserCoupon get _value => super._value as _$_UserCoupon;

  @override
  $Res call({
    Object? id = freezed,
    Object? displayId = freezed,
    Object? couponId = freezed,
    Object? qr = freezed,
    Object? buyerUid = freezed,
    Object? createdAt = freezed,
    Object? transactionId = freezed,
    Object? sentTo = freezed,
    Object? sentToName = freezed,
    Object? sentFromName = freezed,
    Object? commented = freezed,
    Object? coupon = freezed,
  }) {
    return _then(_$_UserCoupon(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      displayId: displayId == freezed
          ? _value.displayId
          : displayId // ignore: cast_nullable_to_non_nullable
              as int,
      couponId: couponId == freezed
          ? _value.couponId
          : couponId // ignore: cast_nullable_to_non_nullable
              as int,
      qr: qr == freezed
          ? _value.qr
          : qr // ignore: cast_nullable_to_non_nullable
              as String,
      buyerUid: buyerUid == freezed
          ? _value.buyerUid
          : buyerUid // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      transactionId: transactionId == freezed
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      sentTo: sentTo == freezed
          ? _value.sentTo
          : sentTo // ignore: cast_nullable_to_non_nullable
              as String?,
      sentToName: sentToName == freezed
          ? _value.sentToName
          : sentToName // ignore: cast_nullable_to_non_nullable
              as String?,
      sentFromName: sentFromName == freezed
          ? _value.sentFromName
          : sentFromName // ignore: cast_nullable_to_non_nullable
              as String?,
      commented: commented == freezed
          ? _value.commented
          : commented // ignore: cast_nullable_to_non_nullable
              as int,
      coupon: coupon == freezed
          ? _value.coupon
          : coupon // ignore: cast_nullable_to_non_nullable
              as Coupon,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserCoupon extends _UserCoupon {
  _$_UserCoupon(
      {required this.id,
      @JsonKey(name: 'display_id') required this.displayId,
      @JsonKey(name: 'coupon_id') required this.couponId,
      required this.qr,
      @JsonKey(name: 'buyer_uid') required this.buyerUid,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'transaction_id') required this.transactionId,
      @JsonKey(name: 'sent_to') required this.sentTo,
      @JsonKey(name: 'sent_to_name') required this.sentToName,
      @JsonKey(name: 'sent_from_name') required this.sentFromName,
      @JsonKey(name: 'commented') required this.commented,
      @JsonKey(name: 'coupon') required this.coupon})
      : super._();

  factory _$_UserCoupon.fromJson(Map<String, dynamic> json) =>
      _$$_UserCouponFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'display_id')
  final int displayId;
  @override
  @JsonKey(name: 'coupon_id')
  final int couponId;
  @override
  final String qr;
  @override
  @JsonKey(name: 'buyer_uid')
  final String buyerUid;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'transaction_id')
  final String transactionId;
  @override
  @JsonKey(name: 'sent_to')
  final String? sentTo;
  @override
  @JsonKey(name: 'sent_to_name')
  final String? sentToName;
  @override
  @JsonKey(name: 'sent_from_name')
  final String? sentFromName;
  @override
  @JsonKey(name: 'commented')
  final int commented;
  @override
  @JsonKey(name: 'coupon')
  final Coupon coupon;

  @override
  String toString() {
    return 'UserCoupon(id: $id, displayId: $displayId, couponId: $couponId, qr: $qr, buyerUid: $buyerUid, createdAt: $createdAt, transactionId: $transactionId, sentTo: $sentTo, sentToName: $sentToName, sentFromName: $sentFromName, commented: $commented, coupon: $coupon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserCoupon &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.displayId, displayId) &&
            const DeepCollectionEquality().equals(other.couponId, couponId) &&
            const DeepCollectionEquality().equals(other.qr, qr) &&
            const DeepCollectionEquality().equals(other.buyerUid, buyerUid) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality()
                .equals(other.transactionId, transactionId) &&
            const DeepCollectionEquality().equals(other.sentTo, sentTo) &&
            const DeepCollectionEquality()
                .equals(other.sentToName, sentToName) &&
            const DeepCollectionEquality()
                .equals(other.sentFromName, sentFromName) &&
            const DeepCollectionEquality().equals(other.commented, commented) &&
            const DeepCollectionEquality().equals(other.coupon, coupon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(displayId),
      const DeepCollectionEquality().hash(couponId),
      const DeepCollectionEquality().hash(qr),
      const DeepCollectionEquality().hash(buyerUid),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(transactionId),
      const DeepCollectionEquality().hash(sentTo),
      const DeepCollectionEquality().hash(sentToName),
      const DeepCollectionEquality().hash(sentFromName),
      const DeepCollectionEquality().hash(commented),
      const DeepCollectionEquality().hash(coupon));

  @JsonKey(ignore: true)
  @override
  _$$_UserCouponCopyWith<_$_UserCoupon> get copyWith =>
      __$$_UserCouponCopyWithImpl<_$_UserCoupon>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserCouponToJson(
      this,
    );
  }
}

abstract class _UserCoupon extends UserCoupon {
  factory _UserCoupon(
      {required final int id,
      @JsonKey(name: 'display_id') required final int displayId,
      @JsonKey(name: 'coupon_id') required final int couponId,
      required final String qr,
      @JsonKey(name: 'buyer_uid') required final String buyerUid,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'transaction_id') required final String transactionId,
      @JsonKey(name: 'sent_to') required final String? sentTo,
      @JsonKey(name: 'sent_to_name') required final String? sentToName,
      @JsonKey(name: 'sent_from_name') required final String? sentFromName,
      @JsonKey(name: 'commented') required final int commented,
      @JsonKey(name: 'coupon') required final Coupon coupon}) = _$_UserCoupon;
  _UserCoupon._() : super._();

  factory _UserCoupon.fromJson(Map<String, dynamic> json) =
      _$_UserCoupon.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'display_id')
  int get displayId;
  @override
  @JsonKey(name: 'coupon_id')
  int get couponId;
  @override
  String get qr;
  @override
  @JsonKey(name: 'buyer_uid')
  String get buyerUid;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'transaction_id')
  String get transactionId;
  @override
  @JsonKey(name: 'sent_to')
  String? get sentTo;
  @override
  @JsonKey(name: 'sent_to_name')
  String? get sentToName;
  @override
  @JsonKey(name: 'sent_from_name')
  String? get sentFromName;
  @override
  @JsonKey(name: 'commented')
  int get commented;
  @override
  @JsonKey(name: 'coupon')
  Coupon get coupon;
  @override
  @JsonKey(ignore: true)
  _$$_UserCouponCopyWith<_$_UserCoupon> get copyWith =>
      throw _privateConstructorUsedError;
}
