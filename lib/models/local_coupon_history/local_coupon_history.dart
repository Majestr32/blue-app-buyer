import 'package:blue/models/coupon/coupon.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'local_coupon_history.g.dart';
part 'local_coupon_history.freezed.dart';

@unfreezed
class LocalCouponHistory with _$LocalCouponHistory{
  const LocalCouponHistory._();

  factory LocalCouponHistory.fromCouponId(int id){
    return LocalCouponHistory(couponId: id);
  }

  factory LocalCouponHistory({
    int? id,
    @JsonKey(name: 'coupon_id') required int couponId,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(ignore: true) Coupon? coupon
  }) = _LocalCouponHistory;

  factory LocalCouponHistory.fromJson(Map<String, Object?> json) => _$LocalCouponHistoryFromJson(json);
}