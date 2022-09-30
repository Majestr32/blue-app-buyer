part of 'commerce_cubit.dart';

enum CommerceStateStatus {
  initial,
  loaded
}

class CommerceState extends Equatable {
  final CommerceStateStatus status;
  final List<Coupon> coupons;
  final List<Branch> branches;
  final Coupon? mostRatedCoupon;

  factory CommerceState.initial(){
    return CommerceState(status: CommerceStateStatus.initial,
        coupons: [],
        branches: [],
        mostRatedCoupon: null);
  }

  const CommerceState({
    required this.status,
    required this.coupons,
    required this.branches,
    this.mostRatedCoupon,
  });

  CommerceState copyWith({
    CommerceStateStatus? status,
    List<Coupon>? coupons,
    List<Branch>? branches,
    Coupon? mostRatedCoupon,
  }) {
    return CommerceState(
      status: status ?? this.status,
      coupons: coupons ?? this.coupons,
      branches: branches ?? this.branches,
      mostRatedCoupon: mostRatedCoupon ?? this.mostRatedCoupon,
    );
  }

  @override
  List<Object?> get props => [status, coupons, branches, mostRatedCoupon];
}
