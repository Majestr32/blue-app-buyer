import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/coupon/coupon.dart';
import '../../repositories/branch/branch_repository.dart';

part 'selected_map_marker_state.dart';

class SelectedMapMarkerCubit extends Cubit<SelectedMapMarkerState> {
  final BranchRepository _branchRepository;

  SelectedMapMarkerCubit({
    required BranchRepository branchRepository,
  }) : _branchRepository = branchRepository, super(SelectedMapMarkerState.initial());

  Future<void> loadBranchMarkers(int branchId) async{
    reset();
    final coupons = await _branchRepository.getBranchCoupons(branchId);
    emit(state.copyWith(status: SelectedMapMarkerStateStatus.loaded, markerCoupons: coupons));
  }

  void reset(){
    emit(SelectedMapMarkerState.initial());
  }
}
