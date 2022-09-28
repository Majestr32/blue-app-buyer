import 'package:blue/models/coupon/coupon.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_coupon.g.dart';
part 'cart_coupon.freezed.dart';

@freezed
class CartCoupon with _$CartCoupon{
  const CartCoupon._();
  factory CartCoupon({
    required int? id,
    @JsonKey(name: 'buyer_uid') required String buyerUid,
    @JsonKey(name: 'coupon_id') required int couponId,
    required int quantity,
    required Coupon coupon
  }) = _CartCoupon;

  factory CartCoupon.fromJson(Map<String, Object?> json) => _$CartCouponFromJson(json);
}