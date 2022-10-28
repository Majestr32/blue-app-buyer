import 'package:blue/services/commerce/commerce_service_contract.dart';

import '../../models/branch/branch.dart';
import '../../models/coupon/coupon.dart';
import '../../models/coupon_review/coupon_review.dart';

class CommerceRepository{
  final ICommerceService _commerceService;

  Future<List<Coupon>> getCommerceCoupons(int commerceId,int offset, int count){
    return _commerceService.getCommerceCoupons(commerceId, offset, count);
  }
  Future<Coupon> getCommerceMostRatedCoupon(int commerceId){
    return _commerceService.getCommerceMostRatedCoupon(commerceId);
  }
  Future<List<Branch>> listBranches({required int commerceId}){
    return _commerceService.listBranches(commerceId: commerceId);
  }
  Future<List<CouponReview>> getCommerceReviews(int commerceId){
    return _commerceService.getCommerceReviews(commerceId);
  }

  const CommerceRepository({
    required ICommerceService commerceService,
  }) : _commerceService = commerceService;
}