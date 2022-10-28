import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:blue/data/data_sources/data_source_contract.dart';
import 'package:blue/models/coupon/coupon.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/coupon/coupon_repository.dart';

part 'coupon_state.dart';

class CouponCubit extends Cubit<CouponState> {
  final CouponRepository _couponRepository;

  Future<void> loadStartCoupons(List<int> tagsIds) async{
    List<Coupon> newCoupons = await _couponRepository.getCoupons(0, 8);
    List<Coupon> categoryCoupons = newCoupons;
    List<Coupon> recommendedCoupons = await _couponRepository.getRecommendedCoupons(0, 3, tagsIds);
    List<Coupon> history = await _couponRepository.getCouponHistory(0, 5);
    List<Coupon> popularCoupons = await _couponRepository.getPopularCoupons(0, 5);
    emit(state.copyWith(status: CouponStateStatus.loaded, categoryCoupons: categoryCoupons, popularCoupons: popularCoupons, newCoupons: newCoupons, history: history, recommendedCoupons: recommendedCoupons));
  }

  Future<void> initLocalDb(IDataSource data) async{
    return _couponRepository.setDataSource(data);
  }

  Future<void> addCouponToHistory(int id) async{
    final coupon = await _couponRepository.addCouponToHistory(id);
    emit(state.copyWith(history: [coupon,...state.history]));
  }

  Future<void> changeCategoryTo(int? category) async{
    log(category.toString());
    emit(state.copyWith(categoryCoupons: [], selectedCategory: category));
    loadNewCoupons();
  }

  Future<void> loadNewCoupons() async{
    int newCouponsCount = state.categoryCoupons.length;
    List<Coupon> newCoupons = await _couponRepository.getRecommendedCoupons(newCouponsCount, 8, state.selectedCategory == null ? [] : [state.selectedCategory!]);
    emit(state.copyWith(status: CouponStateStatus.loaded, categoryCoupons: [...state.categoryCoupons,...newCoupons]));
  }

  CouponCubit({
    required CouponRepository couponRepository,
  }) : _couponRepository = couponRepository, super(CouponState.initial());
}
