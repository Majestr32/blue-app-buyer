import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;

part 'user.g.dart';
part 'user.freezed.dart';

@unfreezed
class User with _$User{
  const User._();
  factory User({
    String? uid,
    @JsonKey(ignore: true) fb.User? user,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    bool? activated,
    @JsonKey(name: 'ended_tutorial') bool? endedTutorial,
    String? username,
    String? phone,
    @JsonKey(name: 'profile_img_url') String? profileImgUrl
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);

  bool get isPhoneVerified => phone != null;
}

/*
{
"uid": "f234f234f24",
"username": "Laiders1231",
"phone": null,
"created_at": "2022-09-16 18:02:41",
"ended_tutorial": "0",
"activated": false
},*/