import 'package:blue/services/coupon/coupon_service.dart';

import '../../models/coupon/coupon.dart';
import '../../models/coupon_review/coupon_review.dart';

class CouponRepository{
  final CouponService _couponService;
  Future<List<Coupon>> getCoupons(int offset, int count) async{
    return _couponService.getCoupons(offset, count);
  }
  Future<List<Coupon>> getSearchedCoupons(int offset,int count, String query) async{
    return _couponService.getSearchedCoupons(offset, count, query);
  }
  Future<List<Coupon>> getFilteredCoupons(int offset, int count, {List<int>? tagsIds, double? minPrice, double? maxPrice}){
    return _couponService.getFilteredCoupons(offset, count, tagsIds: tagsIds, minPrice: minPrice, maxPrice: maxPrice);
  }
  Future<List<CouponReview>> getCouponReviews(int couponId){
    return _couponService.getCouponReviews(couponId);
  }
  Future<List<Coupon>> getRecommendedCoupons(int offset, int count, List<int> tagsIds){
    return _couponService.getRecommendedCoupons(offset, count, tagsIds);
  }
  const CouponRepository({
    required CouponService couponService,
  }) : _couponService = couponService;
}