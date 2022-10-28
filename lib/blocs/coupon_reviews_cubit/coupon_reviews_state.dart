part of 'coupon_reviews_cubit.dart';

enum CouponReviewsStateStatus {
  initial,
  loaded
}

class CouponReviewsState extends Equatable {
  final CouponReviewsStateStatus status;
  final List<CouponReview> reviews;
  final List<Branch> branches;

  factory CouponReviewsState.initial(){
    return CouponReviewsState(
      branches: [],
        status: CouponReviewsStateStatus.initial, reviews: []);
  }

  const CouponReviewsState({
    required this.status,
    required this.reviews,
    required this.branches,
  });

  CouponReviewsState copyWith({
    CouponReviewsStateStatus? status,
    List<CouponReview>? reviews,
    List<Branch>? branches,
  }) {
    return CouponReviewsState(
      status: status ?? this.status,
      reviews: reviews ?? this.reviews,
      branches: branches ?? this.branches,
    );
  }

  @override
  List<Object> get props => [status, reviews, branches];
}