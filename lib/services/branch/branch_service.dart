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
  Future<List<Coupon>> getBranchCoupons(int branchId) async{
    final response = await _dio.get("$hostApi/branches/$branchId/coupons");
    final jsonArr = response.data as List;
    return jsonArr.map((e) => Coupon.fromJson(e["coupon"])).toList();
  }

  const BranchService({
    required Dio dio,
  }) : _dio = dio;
}