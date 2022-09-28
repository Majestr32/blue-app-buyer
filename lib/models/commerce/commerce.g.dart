// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commerce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Commerce _$$_CommerceFromJson(Map<String, dynamic> json) => _$_Commerce(
      id: json['id'] as int,
      name: json['name'] as String,
      avgRating: (json['avg_rating'] as num).toDouble(),
      couponsSold: json['coupons_sold'] as int,
      location: json['location'] as String,
      description: json['description'] as String,
      lat: (json['lat'] as num).toDouble(),
      ln: (json['ln'] as num).toDouble(),
      createdAt: DateTime.parse(json['created_at'] as String),
      logoUrl: json['logo_url'] as String,
      reviewsCount: json['reviews_count'] as int,
    );

Map<String, dynamic> _$$_CommerceToJson(_$_Commerce instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avg_rating': instance.avgRating,
      'coupons_sold': instance.couponsSold,
      'location': instance.location,
      'description': instance.description,
      'lat': instance.lat,
      'ln': instance.ln,
      'created_at': instance.createdAt.toIso8601String(),
      'logo_url': instance.logoUrl,
      'reviews_count': instance.reviewsCount,
    };
