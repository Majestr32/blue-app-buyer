import 'package:blue/models/coupon/coupon.dart';
import 'package:blue/services/commerce/commerce_service_contract.dart';
import 'package:dio/dio.dart';

import '../../consts/api.dart';
import '../../models/branch/branch.dart';

class CommerceService implements ICommerceService{
  final Dio _dio;

  @override
  Future<List<Coupon>> getCommerceCoupons(int commerceId,int offset, int count) async{
    final response = await _dio.get("${hostApi}commerces/$commerceId/coupons", queryParameters: {
      'offset': offset,
      'count': count,
      'status': 'active'
    });
    final jsonArr = response.data as List<dynamic>;
    return jsonArr.map((e) => Coupon.fromJson(e)).toList();
  }

  @override
  Future<List<Branch>> listBranches({required int commerceId}) async{
    final response = await _dio.get("$hostApi/commerces/$commerceId/branches");
    final jsonArr = response.data as List;
    return jsonArr.map((e) => Branch.fromJson(e)).toList();
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