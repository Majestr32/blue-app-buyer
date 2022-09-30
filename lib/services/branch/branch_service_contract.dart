import '../../models/branch/branch.dart';

abstract class IBranchService{
  Future<List<Branch>> listAllBranches();
}