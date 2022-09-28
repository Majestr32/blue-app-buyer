import 'package:bloc/bloc.dart';
import 'package:blue/models/coupon/coupon.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/commerce/commerce_repository.dart';

part 'commerce_state.dart';

class CommerceCubit extends Cubit<CommerceState> {
  final CommerceRepository _commerceRepository;

  Future<void> loadCommerceDetails(int commerceId) async{
    emit(CommerceState.initial());
    final coupons = await _commerceRepository.getCommerceCoupons(commerceId, 0, 20);
    final mostRatedCoupon = await _commerceRepository.getCommerceMostRatedCoupon(commerceId);
    emit(state.copyWith(coupons: coupons, mostRatedCoupon: mostRatedCoupon, status: CommerceStateStatus.loaded));
  }

  CommerceCubit({
    required CommerceRepository commerceRepository,
  }) : _commerceRepository = commerceRepository, super(CommerceState.initial());
}
