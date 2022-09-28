// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cart_coupon.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CartCoupon _$CartCouponFromJson(Map<String, dynamic> json) {
  return _CartCoupon.fromJson(json);
}

/// @nodoc
mixin _$CartCoupon {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'buyer_uid')
  String get buyerUid => throw _privateConstructorUsedError;
  @JsonKey(name: 'coupon_id')
  int get couponId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  Coupon get coupon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartCouponCopyWith<CartCoupon> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartCouponCopyWith<$Res> {
  factory $CartCouponCopyWith(
          CartCoupon value, $Res Function(CartCoupon) then) =
      _$CartCouponCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      @JsonKey(name: 'buyer_uid') String buyerUid,
      @JsonKey(name: 'coupon_id') int couponId,
      int quantity,
      Coupon coupon});

  $CouponCopyWith<$Res> get coupon;
}

/// @nodoc
class _$CartCouponCopyWithImpl<$Res> implements $CartCouponCopyWith<$Res> {
  _$CartCouponCopyWithImpl(this._value, this._then);

  final CartCoupon _value;
  // ignore: unused_field
  final $Res Function(CartCoupon) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? buyerUid = freezed,
    Object? couponId = freezed,
    Object? quantity = freezed,
    Object? coupon = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      buyerUid: buyerUid == freezed
          ? _value.buyerUid
          : buyerUid // ignore: cast_nullable_to_non_nullable
              as String,
      couponId: couponId == freezed
          ? _value.couponId
          : couponId // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_CartCouponCopyWith<$Res>
    implements $CartCouponCopyWith<$Res> {
  factory _$$_CartCouponCopyWith(
          _$_CartCoupon value, $Res Function(_$_CartCoupon) then) =
      __$$_CartCouponCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      @JsonKey(name: 'buyer_uid') String buyerUid,
      @JsonKey(name: 'coupon_id') int couponId,
      int quantity,
      Coupon coupon});

  @override
  $CouponCopyWith<$Res> get coupon;
}

/// @nodoc
class __$$_CartCouponCopyWithImpl<$Res> extends _$CartCouponCopyWithImpl<$Res>
    implements _$$_CartCouponCopyWith<$Res> {
  __$$_CartCouponCopyWithImpl(
      _$_CartCoupon _value, $Res Function(_$_CartCoupon) _then)
      : super(_value, (v) => _then(v as _$_CartCoupon));

  @override
  _$_CartCoupon get _value => super._value as _$_CartCoupon;

  @override
  $Res call({
    Object? id = freezed,
    Object? buyerUid = freezed,
    Object? couponId = freezed,
    Object? quantity = freezed,
    Object? coupon = freezed,
  }) {
    return _then(_$_CartCoupon(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      buyerUid: buyerUid == freezed
          ? _value.buyerUid
          : buyerUid // ignore: cast_nullable_to_non_nullable
              as String,
      couponId: couponId == freezed
          ? _value.couponId
          : couponId // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
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
class _$_CartCoupon extends _CartCoupon {
  _$_CartCoupon(
      {required this.id,
      @JsonKey(name: 'buyer_uid') required this.buyerUid,
      @JsonKey(name: 'coupon_id') required this.couponId,
      required this.quantity,
      required this.coupon})
      : super._();

  factory _$_CartCoupon.fromJson(Map<String, dynamic> json) =>
      _$$_CartCouponFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'buyer_uid')
  final String buyerUid;
  @override
  @JsonKey(name: 'coupon_id')
  final int couponId;
  @override
  final int quantity;
  @override
  final Coupon coupon;

  @override
  String toString() {
    return 'CartCoupon(id: $id, buyerUid: $buyerUid, couponId: $couponId, quantity: $quantity, coupon: $coupon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartCoupon &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.buyerUid, buyerUid) &&
            const DeepCollectionEquality().equals(other.couponId, couponId) &&
            const DeepCollectionEquality().equals(other.quantity, quantity) &&
            const DeepCollectionEquality().equals(other.coupon, coupon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(buyerUid),
      const DeepCollectionEquality().hash(couponId),
      const DeepCollectionEquality().hash(quantity),
      const DeepCollectionEquality().hash(coupon));

  @JsonKey(ignore: true)
  @override
  _$$_CartCouponCopyWith<_$_CartCoupon> get copyWith =>
      __$$_CartCouponCopyWithImpl<_$_CartCoupon>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CartCouponToJson(
      this,
    );
  }
}

abstract class _CartCoupon extends CartCoupon {
  factory _CartCoupon(
      {required final int? id,
      @JsonKey(name: 'buyer_uid') required final String buyerUid,
      @JsonKey(name: 'coupon_id') required final int couponId,
      required final int quantity,
      required final Coupon coupon}) = _$_CartCoupon;
  _CartCoupon._() : super._();

  factory _CartCoupon.fromJson(Map<String, dynamic> json) =
      _$_CartCoupon.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'buyer_uid')
  String get buyerUid;
  @override
  @JsonKey(name: 'coupon_id')
  int get couponId;
  @override
  int get quantity;
  @override
  Coupon get coupon;
  @override
  @JsonKey(ignore: true)
  _$$_CartCouponCopyWith<_$_CartCoupon> get copyWith =>
      throw _privateConstructorUsedError;
}
