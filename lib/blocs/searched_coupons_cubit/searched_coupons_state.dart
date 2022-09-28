part of 'searched_coupons_cubit.dart';

enum SearchedCouponsStateStatus {
  initial,
  loaded
}

class SearchedCouponsState extends Equatable {
  final SearchedCouponsStateStatus status;
  final List<Coupon> searchedCoupons;
  final String query;
  final double minPrice;
  final double maxPrice;
  final List<int> tags;

  factory SearchedCouponsState.initial(){
    return SearchedCouponsState(
      minPrice: 0,
        maxPrice: 0,
        tags: [],
        query: "",
        status: SearchedCouponsStateStatus.initial, searchedCoupons: []);
  }

  const SearchedCouponsState({
    required this.status,
    required this.searchedCoupons,
    required this.query,
    required this.minPrice,
    required this.maxPrice,
    required this.tags,
  });

  SearchedCouponsState copyWith({
    SearchedCouponsStateStatus? status,
    List<Coupon>? searchedCoupons,
    String? query,
    double? minPrice,
    double? maxPrice,
    List<int>? tags,
  }) {
    return SearchedCouponsState(
      status: status ?? this.status,
      searchedCoupons: searchedCoupons ?? this.searchedCoupons,
      query: query ?? this.query,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      tags: tags ?? this.tags,
    );
  }

  @override
  List<Object> get props =>
      [status, searchedCoupons, query, minPrice, maxPrice, tags,];
}
