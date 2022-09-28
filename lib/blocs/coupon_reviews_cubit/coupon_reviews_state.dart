part of 'coupon_reviews_cubit.dart';

enum CouponReviewsStateStatus {
  initial,
  loaded
}

class CouponReviewsState extends Equatable {
  final CouponReviewsStateStatus status;
  final List<CouponReview> reviews;

  factory CouponReviewsState.initial(){
    return CouponReviewsState(status: CouponReviewsStateStatus.initial, reviews: []);
  }
  const CouponReviewsState({
    required this.status,
    required this.reviews,
  });

  CouponReviewsState copyWith({
    CouponReviewsStateStatus? status,
    List<CouponReview>? reviews,
  }) {
    return CouponReviewsState(
      status: status ?? this.status,
      reviews: reviews ?? this.reviews,
    );
  }

  @override
  List<Object> get props => [status, reviews];
}