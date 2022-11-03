import '../../models/branch/branch.dart';
import '../../models/coupon/coupon.dart';

abstract class IBranchService{
  Future<List<Branch>> listAllBranches();
  Future<List<Coupon>> getBranchCoupons(int branchId);
  Future<List<Branch>> getFilteredBranches({String? query, List<int>? favs, double? minPrice, double? maxPrice});
}