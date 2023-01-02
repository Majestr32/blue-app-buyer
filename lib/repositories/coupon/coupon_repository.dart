import 'dart:developer';

import 'package:blue/data/data_sources/data_source_contract.dart';
import 'package:blue/models/local_coupon_history/local_coupon_history.dart';
import 'package:blue/services/coupon/coupon_service.dart';

import '../../models/branch/branch.dart';
import '../../models/coupon/coupon.dart';
import '../../models/coupon_review/coupon_review.dart';

class CouponRepository{
  final CouponService _couponService;
  IDataSource? _data;

  void setDataSource(IDataSource data){
    _data = data;
  }

  Future<List<Coupon>> getCoupons(int offset, int count) async{
    return _couponService.getCoupons(offset, count);
  }
  Future<List<Coupon>> getCouponHistory(int offset, int count) async{
    assert(_data != null);

    log("taking from history");
    final history = await _data!.getCouponsHistory(offset, count);
    if(history.isEmpty){
      return [];
    }
    final coupons = await _couponService.getCouponsByIds(history.map((e) => e.couponId).toList());

    for (var h in history) {
      h.coupon = coupons.firstWhere((element) => h.couponId == element.id);
    }

    return history.map((e) => e.coupon!).toList();
  }

  Future<List<Coupon>> getPopularCoupons(int offset, int count){
    return _couponService.getPopularCoupons(offset, count);
  }

  Future<List<Branch>> getCouponBranches(int id){
    return _couponService.getCouponBranches(id);
  }

  Future<List<Coupon>> getNewCoupons(int offset, int count){
    return _couponService.getNewCoupons(offset, count);
  }

  Future<Coupon> addCouponToHistory(int id) async{
    assert(_data != null);

    final historyToPush = LocalCouponHistory.fromCouponId(id);
    _data!.addCouponToHistory(historyToPush);

    final coupon = await _couponService.getCouponsByIds([id]);
    return coupon.first;
  }
  Future<List<Coupon>> getFilteredCoupons(int offset, int count, {List<int>? tagsIds, double? minPrice, double? maxPrice, String? searchQuery}){
    return _couponService.getFilteredCoupons(offset, count, tagsIds: tagsIds, minPrice: minPrice, maxPrice: maxPrice, searchQuery: searchQuery);
  }
  Future<List<CouponReview>> getCouponReviews(int couponId){
    return _couponService.getCouponReviews(couponId);
  }
  Future<List<Coupon>> getRecommendedCoupons(int offset, int count, List<int> tagsIds){
    return _couponService.getRecommendedCoupons(offset, count, tagsIds);
  }

  CouponRepository({
    required CouponService couponService,
  })  : _couponService = couponService;
}