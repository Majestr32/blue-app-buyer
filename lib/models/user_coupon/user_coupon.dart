import 'package:blue/models/coupon/coupon.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_coupon.g.dart';
part 'user_coupon.freezed.dart';

@freezed
class UserCoupon with _$UserCoupon{
  const UserCoupon._();

  bool get isCommented => commented == 1;

  bool get fromFriend => sentTo != null;
  factory UserCoupon({
    required int id,
    @JsonKey(name: 'coupon_id') required int couponId,
    required String qr,
    @JsonKey(name: 'buyer_uid') required String buyerUid,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'transaction_id') required String transactionId,
    @JsonKey(name: 'sent_to') required String? sentTo,
    @JsonKey(name: 'commented') required int commented,
    @JsonKey(name: 'coupon') required Coupon coupon,
  }) = _UserCoupon;

  factory UserCoupon.fromJson(Map<String, Object?> json) => _$UserCouponFromJson(json);
}