import 'package:freezed_annotation/freezed_annotation.dart';

import '../user/user.dart';

part 'coupon_review.g.dart';
part 'coupon_review.freezed.dart';

@freezed
class CouponReview with _$CouponReview{
  const CouponReview._();
  factory CouponReview({
    @JsonKey(name: 'coupon_id') required int couponId,
    @JsonKey(name: 'buyer_uid') required String buyerUid,
    required String? comment,
    required double rating,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'buyer') required User user,
  }) = _CouponReview;

  factory CouponReview.fromJson(Map<String, Object?> json) => _$CouponReviewFromJson(json);
}