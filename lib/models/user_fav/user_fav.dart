import 'package:freezed_annotation/freezed_annotation.dart';

import '../coupon/coupon.dart';

part 'user_fav.g.dart';
part 'user_fav.freezed.dart';

@freezed
class UserFav with _$UserFav{
  const UserFav._();
  factory UserFav({
    @JsonKey(name: 'coupon_id') required int couponId,
    @JsonKey(name: 'buyer_uid') required String buyerUid,
    @JsonKey(name: 'coupon') required Coupon coupon,
  }) = _UserFav;

  factory UserFav.fromJson(Map<String, Object?> json) => _$UserFavFromJson(json);
}