part of 'branches_cubit.dart';

enum BranchesStateStatus {
  initial,
  loaded
}

class BranchesState extends Equatable {
  final BranchesStateStatus status;
  final List<Branch> branches;

  factory BranchesState.initial(){
    return BranchesState(status: BranchesStateStatus.initial, branches: []);
  }

  const BranchesState({
    required this.status,
    required this.branches,
  });

  BranchesState copyWith({
    BranchesStateStatus? status,
    List<Branch>? branches,
  }) {
    return BranchesState(
      status: status ?? this.status,
      branches: branches ?? this.branches,
    );
  }

  @override
  List<Object> get props => [status, branches];
}
