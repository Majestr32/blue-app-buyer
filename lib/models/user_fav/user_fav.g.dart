// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_fav.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserFav _$$_UserFavFromJson(Map<String, dynamic> json) => _$_UserFav(
      couponId: json['coupon_id'] as int,
      buyerUid: json['buyer_uid'] as String,
      coupon: Coupon.fromJson(json['coupon'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserFavToJson(_$_UserFav instance) =>
    <String, dynamic>{
      'coupon_id': instance.couponId,
      'buyer_uid': instance.buyerUid,
      'coupon': instance.coupon.toJson(),
    };
