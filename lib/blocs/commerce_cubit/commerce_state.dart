part of 'commerce_cubit.dart';

enum CommerceStateStatus {
  initial,
  loaded
}

class CommerceState extends Equatable {
  final CommerceStateStatus status;
  final List<Coupon> coupons;
  final List<Branch> branches;
  final List<CouponReview> reviews;
  final Coupon? mostRatedCoupon;

  factory CommerceState.initial(){
    return CommerceState(status: CommerceStateStatus.initial,
        reviews: [],
        coupons: [],
        branches: [],
        mostRatedCoupon: null);
  }

  const CommerceState({
    required this.status,
    required this.coupons,
    required this.branches,
    required this.reviews,
    this.mostRatedCoupon,
  });

  CommerceState copyWith({
    CommerceStateStatus? status,
    List<Coupon>? coupons,
    List<Branch>? branches,
    List<CouponReview>? reviews,
    Coupon? mostRatedCoupon,
  }) {
    return CommerceState(
      status: status ?? this.status,
      coupons: coupons ?? this.coupons,
      branches: branches ?? this.branches,
      reviews: reviews ?? this.reviews,
      mostRatedCoupon: mostRatedCoupon ?? this.mostRatedCoupon,
    );
  }

  @override
  List<Object?> get props =>
      [status, coupons, branches, reviews, mostRatedCoupon,];
}
