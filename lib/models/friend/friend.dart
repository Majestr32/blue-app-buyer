import 'package:freezed_annotation/freezed_annotation.dart';

import '../user/user.dart';

part 'friend.g.dart';
part 'friend.freezed.dart';

@freezed
class Friend with _$Friend{
  const Friend._();
  factory Friend({
    @JsonKey(name: 'initiator_uid') required String initiatorUid,
    @JsonKey(name: 'receiver_uid') required String receiverUid,
    @JsonKey(name: 'friend') required User friend,
  }) = _Friend;

  factory Friend.fromJson(Map<String, Object?> json) => _$FriendFromJson(json);
}