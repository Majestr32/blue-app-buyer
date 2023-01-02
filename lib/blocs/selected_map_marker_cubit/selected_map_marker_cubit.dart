
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/coupon/coupon.dart';
import '../../repositories/branch/branch_repository.dart';
import 'package:geolocator/geolocator.dart';

part 'selected_map_marker_state.dart';

class SelectedMapMarkerCubit extends Cubit<SelectedMapMarkerState> {
  final BranchRepository _branchRepository;

  SelectedMapMarkerCubit({
    required BranchRepository branchRepository,
  }) : _branchRepository = branchRepository, super(SelectedMapMarkerState.initial());

  Future<void> loadBranchMarkers(int branchId,{String? query, List<int>? favs, double? minPrice, double? maxPrice}) async{
    final coupons = await _branchRepository.getBranchCoupons(branchId, query: query, favs: favs, maxPrice: maxPrice, minPrice: minPrice);
    final position = await _getUserCurrentLocation();
    emit(state.copyWith(status: SelectedMapMarkerStateStatus.loaded, currentPosition: position, markerCoupons: coupons));
  }

  Future<Position?> _getUserCurrentLocation() async {
    final perm = await Geolocator.requestPermission();
    return perm == LocationPermission.denied || perm == LocationPermission.deniedForever ?
      null : await Geolocator.getCurrentPosition();
  }

  void reset(){
    emit(SelectedMapMarkerState.initial());
  }
}
