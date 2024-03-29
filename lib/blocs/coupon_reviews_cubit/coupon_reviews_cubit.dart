import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/branch/branch.dart';
import '../../models/coupon_review/coupon_review.dart';
import '../../repositories/coupon/coupon_repository.dart';

part 'coupon_reviews_state.dart';

class CouponReviewsCubit extends Cubit<CouponReviewsState> {
  final CouponRepository _couponRepository;

  Future<void> loadComments(int couponId) async{
    emit(CouponReviewsState.initial());
    final reviews = await _couponRepository.getCouponReviews(couponId);
    final branches = await _couponRepository.getCouponBranches(couponId);
    emit(state.copyWith(status: CouponReviewsStateStatus.loaded, branches: branches, reviews: reviews));
  }

  CouponReviewsCubit({
    required CouponRepository couponRepository,
  }) : _couponRepository = couponRepository, super(CouponReviewsState.initial());
}
