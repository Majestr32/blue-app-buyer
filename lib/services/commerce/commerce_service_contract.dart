import 'package:blue/models/coupon/coupon.dart';

import '../../models/branch/branch.dart';
import '../../models/coupon_review/coupon_review.dart';

abstract class ICommerceService{
  Future<List<Coupon>> getCommerceCoupons(int commerceId,int offset, int count);
  Future<List<Coupon>> getCommerceMostRatedCoupon(int commerceId);
  Future<List<Branch>> listBranches({required int commerceId});
  Future<List<CouponReview>> getCommerceReviews(int commerceId);
}