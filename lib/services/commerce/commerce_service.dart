import 'package:blue/models/coupon/coupon.dart';
import 'package:blue/services/commerce/commerce_service_contract.dart';
import 'package:dio/dio.dart';

import '../../consts/api.dart';

class CommerceService implements ICommerceService{
  final Dio _dio;

  @override
  Future<List<Coupon>> getCommerceCoupons(int commerceId,int offset, int count) async{
    final response = await _dio.get("${hostApi}commerces/$commerceId/coupons", queryParameters: {
      'offset': offset,
      'count': count,
    });
    final jsonArr = response.data as List<dynamic>;
    return jsonArr.map((e) => Coupon.fromJson(e)).toList();
  }

  @override
  Future<Coupon> getCommerceMostRatedCoupon(int commerceId) async{
    final response = await _dio.get("${hostApi}commerces/$commerceId/coupons/top");
    final json = response.data;
    return Coupon.fromJson(json);
  }

  const CommerceService({
    required Dio dio,
  }) : _dio = dio;
}