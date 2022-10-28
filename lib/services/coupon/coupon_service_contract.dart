import 'package:blue/models/branch/branch.dart';
import 'package:blue/models/coupon/coupon.dart';
import 'package:blue/models/coupon_review/coupon_review.dart';

abstract class ICouponService{
  Future<List<Coupon>> getCoupons(int offset, int count);
  Future<List<Coupon>> getRecommendedCoupons(int offset, int count, List<int> tagsIds);
  Future<List<Coupon>> getPopularCoupons(int offset, int count);
  Future<List<Coupon>> getNewCoupons(int offset, int count);
  Future<List<Coupon>> getFilteredCoupons(int offset, int count, {List<int>? tagsIds, double? minPrice, double? maxPrice});
  Future<List<Coupon>> getSearchedCoupons(int offset,int count, String query);
  Future<List<CouponReview>> getCouponReviews(int couponId);
  Future<List<Coupon>> getCouponsByIds(List<int> ids);
  Future<List<Branch>> getCouponBranches(int id);
}