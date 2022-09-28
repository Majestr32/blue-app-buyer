part of 'coupon_cubit.dart';

enum CouponStateStatus {
  initial,
  loaded
}

class CouponState extends Equatable {
  final List<Coupon> newCoupons;
  final List<Coupon> recommendedCoupons;
  final CouponStateStatus status;

  factory CouponState.initial(){
    return CouponState(newCoupons: [], recommendedCoupons: [], status: CouponStateStatus.initial);
  }

  const CouponState({
    required this.newCoupons,
    required this.recommendedCoupons,
    required this.status,
  });

  CouponState copyWith({
    List<Coupon>? newCoupons,
    List<Coupon>? recommendedCoupons,
    CouponStateStatus? status,
  }) {
    return CouponState(
      newCoupons: newCoupons ?? this.newCoupons,
      recommendedCoupons: recommendedCoupons ?? this.recommendedCoupons,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [newCoupons, recommendedCoupons, status];
}
