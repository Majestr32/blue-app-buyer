// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Branch _$$_BranchFromJson(Map<String, dynamic> json) => _$_Branch(
      id: json['id'] as int?,
      name: json['name'] as String?,
      username: json['username'] as String,
      phone: json['phone'] as String,
      whatsapp: json['whatsapp'] as String,
      location: json['location'] as String,
      lat: (json['lat'] as num).toDouble(),
      ln: (json['ln'] as num).toDouble(),
      commerceId: json['commerce_id'] as int,
      logoUrl: json['logo_url'] as String?,
      commerce: json['commerce'] == null
          ? null
          : Commerce.fromJson(json['commerce'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_BranchToJson(_$_Branch instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'phone': instance.phone,
      'whatsapp': instance.whatsapp,
      'location': instance.location,
      'lat': instance.lat,
      'ln': instance.ln,
      'commerce_id': instance.commerceId,
      'logo_url': instance.logoUrl,
      'commerce': instance.commerce?.toJson(),
    };
