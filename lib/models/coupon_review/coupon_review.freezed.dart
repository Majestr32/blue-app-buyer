// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'coupon_review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CouponReview _$CouponReviewFromJson(Map<String, dynamic> json) {
  return _CouponReview.fromJson(json);
}

/// @nodoc
mixin _$CouponReview {
  @JsonKey(name: 'coupon_id')
  int get couponId => throw _privateConstructorUsedError;
  @JsonKey(name: 'buyer_uid')
  String get buyerUid => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'buyer')
  User get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CouponReviewCopyWith<CouponReview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CouponReviewCopyWith<$Res> {
  factory $CouponReviewCopyWith(
          CouponReview value, $Res Function(CouponReview) then) =
      _$CouponReviewCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'coupon_id') int couponId,
      @JsonKey(name: 'buyer_uid') String buyerUid,
      String? comment,
      double rating,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'buyer') User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$CouponReviewCopyWithImpl<$Res> implements $CouponReviewCopyWith<$Res> {
  _$CouponReviewCopyWithImpl(this._value, this._then);

  final CouponReview _value;
  // ignore: unused_field
  final $Res Function(CouponReview) _then;

  @override
  $Res call({
    Object? couponId = freezed,
    Object? buyerUid = freezed,
    Object? comment = freezed,
    Object? rating = freezed,
    Object? createdAt = freezed,
    Object? user = freezed,
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
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$$_CouponReviewCopyWith<$Res>
    implements $CouponReviewCopyWith<$Res> {
  factory _$$_CouponReviewCopyWith(
          _$_CouponReview value, $Res Function(_$_CouponReview) then) =
      __$$_CouponReviewCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'coupon_id') int couponId,
      @JsonKey(name: 'buyer_uid') String buyerUid,
      String? comment,
      double rating,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'buyer') User user});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_CouponReviewCopyWithImpl<$Res>
    extends _$CouponReviewCopyWithImpl<$Res>
    implements _$$_CouponReviewCopyWith<$Res> {
  __$$_CouponReviewCopyWithImpl(
      _$_CouponReview _value, $Res Function(_$_CouponReview) _then)
      : super(_value, (v) => _then(v as _$_CouponReview));

  @override
  _$_CouponReview get _value => super._value as _$_CouponReview;

  @override
  $Res call({
    Object? couponId = freezed,
    Object? buyerUid = freezed,
    Object? comment = freezed,
    Object? rating = freezed,
    Object? createdAt = freezed,
    Object? user = freezed,
  }) {
    return _then(_$_CouponReview(
      couponId: couponId == freezed
          ? _value.couponId
          : couponId // ignore: cast_nullable_to_non_nullable
              as int,
      buyerUid: buyerUid == freezed
          ? _value.buyerUid
          : buyerUid // ignore: cast_nullable_to_non_nullable
              as String,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CouponReview extends _CouponReview {
  _$_CouponReview(
      {@JsonKey(name: 'coupon_id') required this.couponId,
      @JsonKey(name: 'buyer_uid') required this.buyerUid,
      required this.comment,
      required this.rating,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'buyer') required this.user})
      : super._();

  factory _$_CouponReview.fromJson(Map<String, dynamic> json) =>
      _$$_CouponReviewFromJson(json);

  @override
  @JsonKey(name: 'coupon_id')
  final int couponId;
  @override
  @JsonKey(name: 'buyer_uid')
  final String buyerUid;
  @override
  final String? comment;
  @override
  final double rating;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'buyer')
  final User user;

  @override
  String toString() {
    return 'CouponReview(couponId: $couponId, buyerUid: $buyerUid, comment: $comment, rating: $rating, createdAt: $createdAt, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CouponReview &&
            const DeepCollectionEquality().equals(other.couponId, couponId) &&
            const DeepCollectionEquality().equals(other.buyerUid, buyerUid) &&
            const DeepCollectionEquality().equals(other.comment, comment) &&
            const DeepCollectionEquality().equals(other.rating, rating) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(couponId),
      const DeepCollectionEquality().hash(buyerUid),
      const DeepCollectionEquality().hash(comment),
      const DeepCollectionEquality().hash(rating),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$$_CouponReviewCopyWith<_$_CouponReview> get copyWith =>
      __$$_CouponReviewCopyWithImpl<_$_CouponReview>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CouponReviewToJson(
      this,
    );
  }
}

abstract class _CouponReview extends CouponReview {
  factory _CouponReview(
      {@JsonKey(name: 'coupon_id') required final int couponId,
      @JsonKey(name: 'buyer_uid') required final String buyerUid,
      required final String? comment,
      required final double rating,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'buyer') required final User user}) = _$_CouponReview;
  _CouponReview._() : super._();

  factory _CouponReview.fromJson(Map<String, dynamic> json) =
      _$_CouponReview.fromJson;

  @override
  @JsonKey(name: 'coupon_id')
  int get couponId;
  @override
  @JsonKey(name: 'buyer_uid')
  String get buyerUid;
  @override
  String? get comment;
  @override
  double get rating;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'buyer')
  User get user;
  @override
  @JsonKey(ignore: true)
  _$$_CouponReviewCopyWith<_$_CouponReview> get copyWith =>
      throw _privateConstructorUsedError;
}
