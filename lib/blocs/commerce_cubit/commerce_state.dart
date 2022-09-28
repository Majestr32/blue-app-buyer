part of 'commerce_cubit.dart';

enum CommerceStateStatus {
  initial,
  loaded
}

class CommerceState extends Equatable {
  final CommerceStateStatus status;
  final List<Coupon> coupons;
  final Coupon? mostRatedCoupon;

  factory CommerceState.initial(){
    return CommerceState(status: CommerceStateStatus.initial, coupons: [], mostRatedCoupon: null);
  }

  const CommerceState({
    required this.status,
    required this.coupons,
    required this.mostRatedCoupon,
  });

  CommerceState copyWith({
    CommerceStateStatus? status,
    List<Coupon>? coupons,
    Coupon? mostRatedCoupon,
  }) {
    return CommerceState(
      status: status ?? this.status,
      coupons: coupons ?? this.coupons,
      mostRatedCoupon: mostRatedCoupon ?? this.mostRatedCoupon,
    );
  }

  @override
  List<Object?> get props => [status, coupons, mostRatedCoupon];
}
