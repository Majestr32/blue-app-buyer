// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      uid: json['uid'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      activated: json['activated'] as bool?,
      endedTutorial: json['ended_tutorial'] as bool?,
      username: json['username'] as String?,
      phone: json['phone'] as String?,
      profileImgUrl: json['profile_img_url'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'uid': instance.uid,
      'created_at': instance.createdAt?.toIso8601String(),
      'activated': instance.activated,
      'ended_tutorial': instance.endedTutorial,
      'username': instance.username,
      'phone': instance.phone,
      'profile_img_url': instance.profileImgUrl,
    };
