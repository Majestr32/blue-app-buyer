// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_fav.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserFav _$UserFavFromJson(Map<String, dynamic> json) {
  return _UserFav.fromJson(json);
}

/// @nodoc
mixin _$UserFav {
  @JsonKey(name: 'coupon_id')
  int get couponId => throw _privateConstructorUsedError;
  @JsonKey(name: 'buyer_uid')
  String get buyerUid => throw _privateConstructorUsedError;
  @JsonKey(name: 'coupon')
  Coupon get coupon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserFavCopyWith<UserFav> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserFavCopyWith<$Res> {
  factory $UserFavCopyWith(UserFav value, $Res Function(UserFav) then) =
      _$UserFavCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'coupon_id') int couponId,
      @JsonKey(name: 'buyer_uid') String buyerUid,
      @JsonKey(name: 'coupon') Coupon coupon});

  $CouponCopyWith<$Res> get coupon;
}

/// @nodoc
class _$UserFavCopyWithImpl<$Res> implements $UserFavCopyWith<$Res> {
  _$UserFavCopyWithImpl(this._value, this._then);

  final UserFav _value;
  // ignore: unused_field
  final $Res Function(UserFav) _then;

  @override
  $Res call({
    Object? couponId = freezed,
    Object? buyerUid = freezed,
    Object? coupon = freezed,
  }) {
    return _then(_value.copyWith(
      couponId: couponId == freezed
          ? _value.couponId
          : couponId // ignore: cast_nullable_to_non_nullable
              as int,
      buyerUid: buyerUid == freezed
          ? _value.buyerUid
          : buyerUid // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$_UserFavCopyWith<$Res> implements $UserFavCopyWith<$Res> {
  factory _$$_UserFavCopyWith(
          _$_UserFav value, $Res Function(_$_UserFav) then) =
      __$$_UserFavCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'coupon_id') int couponId,
      @JsonKey(name: 'buyer_uid') String buyerUid,
      @JsonKey(name: 'coupon') Coupon coupon});

  @override
  $CouponCopyWith<$Res> get coupon;
}

/// @nodoc
class __$$_UserFavCopyWithImpl<$Res> extends _$UserFavCopyWithImpl<$Res>
    implements _$$_UserFavCopyWith<$Res> {
  __$$_UserFavCopyWithImpl(_$_UserFav _value, $Res Function(_$_UserFav) _then)
      : super(_value, (v) => _then(v as _$_UserFav));

  @override
  _$_UserFav get _value => super._value as _$_UserFav;

  @override
  $Res call({
    Object? couponId = freezed,
    Object? buyerUid = freezed,
    Object? coupon = freezed,
  }) {
    return _then(_$_UserFav(
      couponId: couponId == freezed
          ? _value.couponId
          : couponId // ignore: cast_nullable_to_non_nullable
              as int,
      buyerUid: buyerUid == freezed
          ? _value.buyerUid
          : buyerUid // ignore: cast_nullable_to_non_nullable
              as String,
      coupon: coupon == freezed
          ? _value.coupon
          : coupon // ignore: cast_nullable_to_non_nullable
              as Coupon,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserFav extends _UserFav {
  _$_UserFav(
      {@JsonKey(name: 'coupon_id') required this.couponId,
      @JsonKey(name: 'buyer_uid') required this.buyerUid,
      @JsonKey(name: 'coupon') required this.coupon})
      : super._();

  factory _$_UserFav.fromJson(Map<String, dynamic> json) =>
      _$$_UserFavFromJson(json);

  @override
  @JsonKey(name: 'coupon_id')
  final int couponId;
  @override
  @JsonKey(name: 'buyer_uid')
  final String buyerUid;
  @override
  @JsonKey(name: 'coupon')
  final Coupon coupon;

  @override
  String toString() {
    return 'UserFav(couponId: $couponId, buyerUid: $buyerUid, coupon: $coupon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserFav &&
            const DeepCollectionEquality().equals(other.couponId, couponId) &&
            const DeepCollectionEquality().equals(other.buyerUid, buyerUid) &&
            const DeepCollectionEquality().equals(other.coupon, coupon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(couponId),
      const DeepCollectionEquality().hash(buyerUid),
      const DeepCollectionEquality().hash(coupon));

  @JsonKey(ignore: true)
  @override
  _$$_UserFavCopyWith<_$_UserFav> get copyWith =>
      __$$_UserFavCopyWithImpl<_$_UserFav>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserFavToJson(
      this,
    );
  }
}

abstract class _UserFav extends UserFav {
  factory _UserFav(
      {@JsonKey(name: 'coupon_id') required final int couponId,
      @JsonKey(name: 'buyer_uid') required final String buyerUid,
      @JsonKey(name: 'coupon') required final Coupon coupon}) = _$_UserFav;
  _UserFav._() : super._();

  factory _UserFav.fromJson(Map<String, dynamic> json) = _$_UserFav.fromJson;

  @override
  @JsonKey(name: 'coupon_id')
  int get couponId;
  @override
  @JsonKey(name: 'buyer_uid')
  String get buyerUid;
  @override
  @JsonKey(name: 'coupon')
  Coupon get coupon;
  @override
  @JsonKey(ignore: true)
  _$$_UserFavCopyWith<_$_UserFav> get copyWith =>
      throw _privateConstructorUsedError;
}
