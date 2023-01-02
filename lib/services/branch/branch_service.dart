import 'dart:developer';

import 'package:blue/models/branch/branch.dart';
import 'package:blue/models/coupon/coupon.dart';
import 'package:blue/services/branch/branch_service_contract.dart';
import 'package:dio/dio.dart';

import '../../consts/api.dart';

class BranchService implements IBranchService{
  final Dio _dio;

  @override
  Future<List<Branch>> listAllBranches() async{
    final response = await _dio.get("$hostApi/branches");
    final jsonArr = response.data as List;
    return jsonArr.map((e) => Branch.fromJson(e)).toList();
  }

  @override
  Future<List<Coupon>> getBranchCoupons(int branchId,{String? query, List<int>? favs, double? minPrice, double? maxPrice}) async{
    final queryParams = {
      'query': query,
      'favs[]': favs,
      'min_price': minPrice,
      'max_price': maxPrice
    }..removeWhere((key, value) => value == null);
    final response = await _dio.get("$hostApi/branches/$branchId/coupons", queryParameters: queryParams);
    final jsonArr = response.data as List;
    return jsonArr.map((e) => Coupon.fromJson(e["coupon"])).toList();
  }

  const BranchService({
    required Dio dio,
  }) : _dio = dio;

  @override
  Future<List<Branch>> getFilteredBranches({String? query, List<int>? favs, double? minPrice, double? maxPrice}) async{
    final queryParams = {
      'favs[]': favs,
      'query': query,
      'min_price': minPrice,
      'max_price': maxPrice
    };
    queryParams.removeWhere((key, value) => value == null);
    final response = await _dio.get("$hostApi/branches", queryParameters: queryParams);
    final jsonArr = response.data as List;
    return jsonArr.map((e) => Branch.fromJson(e)).toList();
  }
}