import 'package:blue/models/coupon/coupon.dart';

import '../../models/branch/branch.dart';

abstract class ICommerceService{
  Future<List<Coupon>> getCommerceCoupons(int commerceId,int offset, int count);
  Future<Coupon> getCommerceMostRatedCoupon(int commerceId);
  Future<List<Branch>> listBranches({required int commerceId});
}