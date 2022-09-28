// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Friend _$$_FriendFromJson(Map<String, dynamic> json) => _$_Friend(
      initiatorUid: json['initiator_uid'] as String,
      receiverUid: json['receiver_uid'] as String,
      friend: User.fromJson(json['friend'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_FriendToJson(_$_Friend instance) => <String, dynamic>{
      'initiator_uid': instance.initiatorUid,
      'receiver_uid': instance.receiverUid,
      'friend': instance.friend.toJson(),
    };
