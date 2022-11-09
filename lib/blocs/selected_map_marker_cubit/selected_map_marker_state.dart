part of 'selected_map_marker_cubit.dart';

enum SelectedMapMarkerStateStatus {
  initial,
  loaded
}

class SelectedMapMarkerState extends Equatable {
  final SelectedMapMarkerStateStatus status;
  final List<Coupon> markerCoupons;
  final Position? currentPosition;

  factory SelectedMapMarkerState.initial(){
    return const SelectedMapMarkerState(
        status: SelectedMapMarkerStateStatus.initial, markerCoupons: []);
  }

  const SelectedMapMarkerState({
    required this.status,
    required this.markerCoupons,
    this.currentPosition,
  });

  SelectedMapMarkerState copyWith({
    SelectedMapMarkerStateStatus? status,
    List<Coupon>? markerCoupons,
    Position? currentPosition,
  }) {
    return SelectedMapMarkerState(
      status: status ?? this.status,
      markerCoupons: markerCoupons ?? this.markerCoupons,
      currentPosition: currentPosition ?? this.currentPosition,
    );
  }

  @override
  List<Object?> get props => [status, markerCoupons, currentPosition];
}
