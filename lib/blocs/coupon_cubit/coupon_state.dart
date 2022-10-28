part of 'coupon_cubit.dart';

enum CouponStateStatus {
  initial,
  loaded
}

class CouponState extends Equatable {
  final List<Coupon> categoryCoupons;
  final List<Coupon> newCoupons;
  final List<Coupon> recommendedCoupons;
  final List<Coupon> popularCoupons;
  final List<Coupon> history;
  int? selectedCategory;
  final CouponStateStatus status;

  factory CouponState.initial(){
    return CouponState(newCoupons: const [],
        recommendedCoupons: const [],
        history: const [],
        popularCoupons: const [],
        categoryCoupons: const [],
        status: CouponStateStatus.initial);
  }

  CouponState({
    required this.categoryCoupons,
    required this.newCoupons,
    required this.recommendedCoupons,
    required this.popularCoupons,
    required this.history,
    this.selectedCategory,
    required this.status,
  });

  CouponState copyWith({
    List<Coupon>? categoryCoupons,
    List<Coupon>? newCoupons,
    List<Coupon>? recommendedCoupons,
    List<Coupon>? popularCoupons,
    List<Coupon>? history,
    int? selectedCategory,
    CouponStateStatus? status,
  }) {
    return CouponState(
      categoryCoupons: categoryCoupons ?? this.categoryCoupons,
      newCoupons: newCoupons ?? this.newCoupons,
      recommendedCoupons: recommendedCoupons ?? this.recommendedCoupons,
      popularCoupons: popularCoupons ?? this.popularCoupons,
      history: history ?? this.history,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props =>
      [
        categoryCoupons,
        newCoupons,
        recommendedCoupons,
        popularCoupons,
        history,
        status,
      ];
}
