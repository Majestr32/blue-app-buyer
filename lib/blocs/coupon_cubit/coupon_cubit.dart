import 'package:bloc/bloc.dart';
import 'package:blue/models/coupon/coupon.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/coupon/coupon_repository.dart';

part 'coupon_state.dart';

class CouponCubit extends Cubit<CouponState> {
  final CouponRepository _couponRepository;

  Future<void> loadStartCoupons(List<int> tagsIds) async{
    List<Coupon> newCoupons = await _couponRepository.getCoupons(0, 8);
    List<Coupon> recommendedCoupons = await _couponRepository.getRecommendedCoupons(0, 3, tagsIds);
    emit(state.copyWith(status: CouponStateStatus.loaded, newCoupons: newCoupons, recommendedCoupons: recommendedCoupons));
  }
  Future<void> loadNewCoupons() async{
    int newCouponsCount = state.newCoupons.length;
    List<Coupon> newCoupons = await _couponRepository.getCoupons(newCouponsCount, 8);
    emit(state.copyWith(status: CouponStateStatus.loaded, newCoupons: [...state.newCoupons,...newCoupons]));
  }

  CouponCubit({
    required CouponRepository couponRepository,
  }) : _couponRepository = couponRepository, super(CouponState.initial());
}
