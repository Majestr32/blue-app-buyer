import 'package:blue/services/commerce/commerce_service_contract.dart';

import '../../models/coupon/coupon.dart';

class CommerceRepository{
  final ICommerceService _commerceService;

  Future<List<Coupon>> getCommerceCoupons(int commerceId,int offset, int count){
    return _commerceService.getCommerceCoupons(commerceId, offset, count);
  }
  Future<Coupon> getCommerceMostRatedCoupon(int commerceId){
    return _commerceService.getCommerceMostRatedCoupon(commerceId);
  }

  const CommerceRepository({
    required ICommerceService commerceService,
  }) : _commerceService = commerceService;
}