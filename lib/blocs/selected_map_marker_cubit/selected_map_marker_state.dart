part of 'selected_map_marker_cubit.dart';

enum SelectedMapMarkerStateStatus {
  initial,
  loaded
}

class SelectedMapMarkerState extends Equatable {
  final SelectedMapMarkerStateStatus status;
  final List<Coupon> markerCoupons;

  factory SelectedMapMarkerState.initial(){
    return const SelectedMapMarkerState(
        status: SelectedMapMarkerStateStatus.initial, markerCoupons: []);
  }

  const SelectedMapMarkerState({
    required this.status,
    required this.markerCoupons,
  });

  SelectedMapMarkerState copyWith({
    SelectedMapMarkerStateStatus? status,
    List<Coupon>? markerCoupons,
  }) {
    return SelectedMapMarkerState(
      status: status ?? this.status,
      markerCoupons: markerCoupons ?? this.markerCoupons,
    );
  }

  @override
  List<Object> get props => [status, markerCoupons];
}
