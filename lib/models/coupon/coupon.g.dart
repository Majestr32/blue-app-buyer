// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Coupon _$$_CouponFromJson(Map<String, dynamic> json) => _$_Coupon(
      id: json['id'] as int,
      commerceId: json['commerce_id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      posterUrl: json['poster_url'] as String,
      price: (json['price'] as num).toDouble(),
      expDate: DateTime.parse(json['exp_date'] as String),
      campaignEnding: DateTime.parse(json['campaign_ending'] as String),
      discount: json['discount'] as int?,
      commerce: Commerce.fromJson(json['commerce'] as Map<String, dynamic>),
      sold: json['sold'] as int,
      avgRating: (json['avg_rating'] as num).toDouble(),
      reviewsCount: json['reviews_count'] as int,
      faqs: (json['faqs'] as List<dynamic>?)
          ?.map((e) => Faq.fromJson(e as Map<String, dynamic>))
          .toList(),
      items:
          (json['items'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_CouponToJson(_$_Coupon instance) => <String, dynamic>{
      'id': instance.id,
      'commerce_id': instance.commerceId,
      'name': instance.name,
      'description': instance.description,
      'poster_url': instance.posterUrl,
      'price': instance.price,
      'exp_date': instance.expDate.toIso8601String(),
      'campaign_ending': instance.campaignEnding.toIso8601String(),
      'discount': instance.discount,
      'commerce': instance.commerce.toJson(),
      'sold': instance.sold,
      'avg_rating': instance.avgRating,
      'reviews_count': instance.reviewsCount,
      'faqs': instance.faqs?.map((e) => e.toJson()).toList(),
      'items': instance.items,
    };
