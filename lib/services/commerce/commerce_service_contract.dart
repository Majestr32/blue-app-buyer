import 'package:blue/models/coupon/coupon.dart';

abstract class ICommerceService{
  Future<List<Coupon>> getCommerceCoupons(int commerceId,int offset, int count);
  Future<Coupon> getCommerceMostRatedCoupon(int commerceId);
}