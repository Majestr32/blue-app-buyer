import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/branch/branch.dart';
import '../../repositories/branch/branch_repository.dart';

part 'branches_state.dart';

class BranchesCubit extends Cubit<BranchesState> {
  final BranchRepository _branchRepository;

  Future<void> loadBranches() async{
    emit(BranchesState.initial());
    final branches = await _branchRepository.listAllBranches();
    emit(state.copyWith(status: BranchesStateStatus.loaded, branches: branches));
  }

  BranchesCubit({
    required BranchRepository branchRepository,
  }) : _branchRepository = branchRepository, super(BranchesState.initial());
}
