import 'package:blue/services/branch/branch_service_contract.dart';

import '../../models/branch/branch.dart';

class BranchRepository{
  final IBranchService _branchService;

  const BranchRepository({
    required IBranchService branchService,
  }) : _branchService = branchService;

  Future<List<Branch>> listAllBranches(){
    return _branchService.listAllBranches();
  }
}