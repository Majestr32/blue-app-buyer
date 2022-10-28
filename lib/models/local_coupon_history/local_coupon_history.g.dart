// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_coupon_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LocalCouponHistory _$$_LocalCouponHistoryFromJson(
        Map<String, dynamic> json) =>
    _$_LocalCouponHistory(
      id: json['id'] as int?,
      couponId: json['coupon_id'] as int,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$_LocalCouponHistoryToJson(
        _$_LocalCouponHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'coupon_id': instance.couponId,
      'created_at': instance.createdAt?.toIso8601String(),
    };
