part of 'coupon_cubit.dart';

enum CouponStateStatus {
  initial,
  loading,
  loaded
}

class CouponState extends Equatable {
  final List<Coupon> categoryCoupons;
  final List<Coupon> newCoupons;
  final List<Coupon> recommendedCoupons;
  final List<Coupon> popularCoupons;
  final List<Coupon> history;
  final int selectedCategory;
  final String searchQuery;
  final double? minPrice;
  final double? maxPrice;
  final CouponStateStatus status;
  final List<Branch> markerBranches;

  factory CouponState.initial(){
    return const CouponState(newCoupons: [],
        recommendedCoupons: [],
        history: [],
        searchQuery: "",
        selectedCategory: 0,
        popularCoupons: [],
        markerBranches: [],
        categoryCoupons: [],
        status: CouponStateStatus.initial);
  }

  const CouponState({
    required this.categoryCoupons,
    required this.newCoupons,
    required this.recommendedCoupons,
    required this.popularCoupons,
    required this.history,
    required this.selectedCategory,
    required this.searchQuery,
    this.minPrice,
    this.maxPrice,
    required this.status,
    required this.markerBranches,
  });

  CouponState copyWith({
    List<Coupon>? categoryCoupons,
    List<Coupon>? newCoupons,
    List<Coupon>? recommendedCoupons,
    List<Coupon>? popularCoupons,
    List<Coupon>? history,
    int? selectedCategory,
    String? searchQuery,
    double? minPrice,
    double? maxPrice,
    CouponStateStatus? status,
    List<Branch>? markerBranches,
  }) {
    return CouponState(
      categoryCoupons: categoryCoupons ?? this.categoryCoupons,
      newCoupons: newCoupons ?? this.newCoupons,
      recommendedCoupons: recommendedCoupons ?? this.recommendedCoupons,
      popularCoupons: popularCoupons ?? this.popularCoupons,
      history: history ?? this.history,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      searchQuery: searchQuery ?? this.searchQuery,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      status: status ?? this.status,
      markerBranches: markerBranches ?? this.markerBranches,
    );
  }

  @override
  List<Object?> get props =>
      [
        categoryCoupons,
        newCoupons,
        recommendedCoupons,
        popularCoupons,
        history,
        selectedCategory,
        searchQuery,
        minPrice,
        maxPrice,
        status,
        markerBranches,
      ];
}
