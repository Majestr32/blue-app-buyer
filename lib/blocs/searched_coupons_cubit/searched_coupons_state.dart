part of 'searched_coupons_cubit.dart';

enum SearchedCouponsStateStatus {
  initial,
  loaded
}

class SearchedCouponsState extends Equatable {
  final SearchedCouponsStateStatus status;
  final List<Coupon> searchedCoupons;
  final String? category;
  final String query;
  final double? minPrice;
  final double? maxPrice;
  final List<int> tags;

  factory SearchedCouponsState.initial(){
    return const SearchedCouponsState(
        minPrice: null,
        maxPrice: null,
        tags: [],
        query: "",
        status: SearchedCouponsStateStatus.initial,
        searchedCoupons: []);
  }

  const SearchedCouponsState({
    required this.status,
    required this.searchedCoupons,
    this.category,
    required this.query,
    this.minPrice,
    this.maxPrice,
    required this.tags,
  });

  SearchedCouponsState copyWith({
    SearchedCouponsStateStatus? status,
    List<Coupon>? searchedCoupons,
    String? category,
    String? query,
    double? minPrice,
    double? maxPrice,
    List<int>? tags,
  }) {
    return SearchedCouponsState(
      status: status ?? this.status,
      searchedCoupons: searchedCoupons ?? this.searchedCoupons,
      category: category ?? this.category,
      query: query ?? this.query,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      tags: tags ?? this.tags,
    );
  }

  @override
  List<Object?> get props =>
      [status, searchedCoupons, category, query, minPrice, maxPrice, tags,];
}
