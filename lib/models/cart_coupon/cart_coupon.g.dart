// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_coupon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CartCoupon _$$_CartCouponFromJson(Map<String, dynamic> json) =>
    _$_CartCoupon(
      id: json['id'] as int?,
      buyerUid: json['buyer_uid'] as String,
      couponId: json['coupon_id'] as int,
      quantity: json['quantity'] as int,
      coupon: Coupon.fromJson(json['coupon'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CartCouponToJson(_$_CartCoupon instance) =>
    <String, dynamic>{
      'id': instance.id,
      'buyer_uid': instance.buyerUid,
      'coupon_id': instance.couponId,
      'quantity': instance.quantity,
      'coupon': instance.coupon.toJson(),
    };
