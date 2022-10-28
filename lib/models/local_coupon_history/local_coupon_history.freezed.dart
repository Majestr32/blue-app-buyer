// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'local_coupon_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LocalCouponHistory _$LocalCouponHistoryFromJson(Map<String, dynamic> json) {
  return _LocalCouponHistory.fromJson(json);
}

/// @nodoc
mixin _$LocalCouponHistory {
  int? get id => throw _privateConstructorUsedError;
  set id(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'coupon_id')
  int get couponId => throw _privateConstructorUsedError;
  @JsonKey(name: 'coupon_id')
  set couponId(int value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  set createdAt(DateTime? value) => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  Coupon? get coupon => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  set coupon(Coupon? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocalCouponHistoryCopyWith<LocalCouponHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalCouponHistoryCopyWith<$Res> {
  factory $LocalCouponHistoryCopyWith(
          LocalCouponHistory value, $Res Function(LocalCouponHistory) then) =
      _$LocalCouponHistoryCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      @JsonKey(name: 'coupon_id') int couponId,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(ignore: true) Coupon? coupon});

  $CouponCopyWith<$Res>? get coupon;
}

/// @nodoc
class _$LocalCouponHistoryCopyWithImpl<$Res>
    implements $LocalCouponHistoryCopyWith<$Res> {
  _$LocalCouponHistoryCopyWithImpl(this._value, this._then);

  final LocalCouponHistory _value;
  // ignore: unused_field
  final $Res Function(LocalCouponHistory) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? couponId = freezed,
    Object? createdAt = freezed,
    Object? coupon = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      couponId: couponId == freezed
          ? _value.couponId
          : couponId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      coupon: coupon == freezed
          ? _value.coupon
          : coupon // ignore: cast_nullable_to_non_nullable
              as Coupon?,
    ));
  }

  @override
  $CouponCopyWith<$Res>? get coupon {
    if (_value.coupon == null) {
      return null;
    }

    return $CouponCopyWith<$Res>(_value.coupon!, (value) {
      return _then(_value.copyWith(coupon: value));
    });
  }
}

/// @nodoc
abstract class _$$_LocalCouponHistoryCopyWith<$Res>
    implements $LocalCouponHistoryCopyWith<$Res> {
  factory _$$_LocalCouponHistoryCopyWith(_$_LocalCouponHistory value,
          $Res Function(_$_LocalCouponHistory) then) =
      __$$_LocalCouponHistoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      @JsonKey(name: 'coupon_id') int couponId,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(ignore: true) Coupon? coupon});

  @override
  $CouponCopyWith<$Res>? get coupon;
}

/// @nodoc
class __$$_LocalCouponHistoryCopyWithImpl<$Res>
    extends _$LocalCouponHistoryCopyWithImpl<$Res>
    implements _$$_LocalCouponHistoryCopyWith<$Res> {
  __$$_LocalCouponHistoryCopyWithImpl(
      _$_LocalCouponHistory _value, $Res Function(_$_LocalCouponHistory) _then)
      : super(_value, (v) => _then(v as _$_LocalCouponHistory));

  @override
  _$_LocalCouponHistory get _value => super._value as _$_LocalCouponHistory;

  @override
  $Res call({
    Object? id = freezed,
    Object? couponId = freezed,
    Object? createdAt = freezed,
    Object? coupon = freezed,
  }) {
    return _then(_$_LocalCouponHistory(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      couponId: couponId == freezed
          ? _value.couponId
          : couponId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      coupon: coupon == freezed
          ? _value.coupon
          : coupon // ignore: cast_nullable_to_non_nullable
              as Coupon?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LocalCouponHistory extends _LocalCouponHistory {
  _$_LocalCouponHistory(
      {this.id,
      @JsonKey(name: 'coupon_id') required this.couponId,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(ignore: true) this.coupon})
      : super._();

  factory _$_LocalCouponHistory.fromJson(Map<String, dynamic> json) =>
      _$$_LocalCouponHistoryFromJson(json);

  @override
  int? id;
  @override
  @JsonKey(name: 'coupon_id')
  int couponId;
  @override
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @override
  @JsonKey(ignore: true)
  Coupon? coupon;

  @override
  String toString() {
    return 'LocalCouponHistory(id: $id, couponId: $couponId, createdAt: $createdAt, coupon: $coupon)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_LocalCouponHistoryCopyWith<_$_LocalCouponHistory> get copyWith =>
      __$$_LocalCouponHistoryCopyWithImpl<_$_LocalCouponHistory>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocalCouponHistoryToJson(
      this,
    );
  }
}

abstract class _LocalCouponHistory extends LocalCouponHistory {
  factory _LocalCouponHistory(
      {int? id,
      @JsonKey(name: 'coupon_id') required int couponId,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(ignore: true) Coupon? coupon}) = _$_LocalCouponHistory;
  _LocalCouponHistory._() : super._();

  factory _LocalCouponHistory.fromJson(Map<String, dynamic> json) =
      _$_LocalCouponHistory.fromJson;

  @override
  int? get id;
  set id(int? value);
  @override
  @JsonKey(name: 'coupon_id')
  int get couponId;
  @JsonKey(name: 'coupon_id')
  set couponId(int value);
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @JsonKey(name: 'created_at')
  set createdAt(DateTime? value);
  @override
  @JsonKey(ignore: true)
  Coupon? get coupon;
  @JsonKey(ignore: true)
  set coupon(Coupon? value);
  @override
  @JsonKey(ignore: true)
  _$$_LocalCouponHistoryCopyWith<_$_LocalCouponHistory> get copyWith =>
      throw _privateConstructorUsedError;
}
