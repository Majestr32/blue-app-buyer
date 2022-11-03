import 'package:blue/services/branch/branch_service_contract.dart';

import '../../models/branch/branch.dart';
import '../../models/coupon/coupon.dart';

class BranchRepository{
  final IBranchService _branchService;

  const BranchRepository({
    required IBranchService branchService,
  }) : _branchService = branchService;

  Future<List<Branch>> listAllBranches(){
    return _branchService.listAllBranches();
  }

  Future<List<Coupon>> getBranchCoupons(int branchId) async{
    return _branchService.getBranchCoupons(branchId);
  }
  Future<List<Branch>> getFilteredBranches({String? query, List<int>? favs, double? minPrice, double? maxPrice}){
    return _branchService.getFilteredBranches(query: query, favs: favs, minPrice: minPrice, maxPrice: maxPrice);
  }
}