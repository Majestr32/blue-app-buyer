// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_coupon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserCoupon _$$_UserCouponFromJson(Map<String, dynamic> json) =>
    _$_UserCoupon(
      id: json['id'] as int,
      couponId: json['coupon_id'] as int,
      qr: json['qr'] as String,
      buyerUid: json['buyer_uid'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      transactionId: json['transaction_id'] as String,
      sentTo: json['sent_to'] as String?,
      sentToName: json['sent_to_name'] as String?,
      sentFromName: json['sent_from_name'] as String?,
      commented: json['commented'] as int,
      coupon: Coupon.fromJson(json['coupon'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserCouponToJson(_$_UserCoupon instance) =>
    <String, dynamic>{
      'id': instance.id,
      'coupon_id': instance.couponId,
      'qr': instance.qr,
      'buyer_uid': instance.buyerUid,
      'created_at': instance.createdAt.toIso8601String(),
      'transaction_id': instance.transactionId,
      'sent_to': instance.sentTo,
      'sent_to_name': instance.sentToName,
      'sent_from_name': instance.sentFromName,
      'commented': instance.commented,
      'coupon': instance.coupon.toJson(),
    };
