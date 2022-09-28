// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CouponReview _$$_CouponReviewFromJson(Map<String, dynamic> json) =>
    _$_CouponReview(
      couponId: json['coupon_id'] as int,
      buyerUid: json['buyer_uid'] as String,
      comment: json['comment'] as String?,
      rating: (json['rating'] as num).toDouble(),
      createdAt: DateTime.parse(json['created_at'] as String),
      user: User.fromJson(json['buyer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CouponReviewToJson(_$_CouponReview instance) =>
    <String, dynamic>{
      'coupon_id': instance.couponId,
      'buyer_uid': instance.buyerUid,
      'comment': instance.comment,
      'rating': instance.rating,
      'created_at': instance.createdAt.toIso8601String(),
      'buyer': instance.user.toJson(),
    };
