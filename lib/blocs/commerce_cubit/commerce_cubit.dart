import 'package:bloc/bloc.dart';
import 'package:blue/models/coupon/coupon.dart';
import 'package:equatable/equatable.dart';

import '../../models/branch/branch.dart';
import '../../models/coupon_review/coupon_review.dart';
import '../../repositories/commerce/commerce_repository.dart';

part 'commerce_state.dart';

class CommerceCubit extends Cubit<CommerceState> {
  final CommerceRepository _commerceRepository;

  Future<void> loadCommerceDetails(int commerceId) async{
    emit(CommerceState.initial());
    final coupons = await _commerceRepository.getCommerceCoupons(commerceId, 0, 20);
    final mostRatedCoupon = await _commerceRepository.getCommerceMostRatedCoupon(commerceId);
    final branches = await _commerceRepository.listBranches(commerceId: commerceId);
    final reviews = await _commerceRepository.getCommerceReviews(commerceId);
    emit(state.copyWith(coupons: coupons, mostRatedCoupon: mostRatedCoupon, reviews: reviews, branches: branches, status: CommerceStateStatus.loaded));
  }

  CommerceCubit({
    required CommerceRepository commerceRepository,
  }) : _commerceRepository = commerceRepository, super(CommerceState.initial());
}
