part of 'searched_coupons_cubit.dart';

enum SearchedCouponsStateStatus {
  initial,
  loading,
  loaded
}

class SearchedCouponsState extends Equatable {
  final SearchedCouponsStateStatus status;
  final List<Coupon> categoryCoupons;
  final List<int>? tagsIds;
  final String? category;
  final String searchQuery;
  final double? minPrice;
  final double? maxPrice;
  final int selectedCategory;

  factory SearchedCouponsState.initial(){
    return const SearchedCouponsState(
        status: SearchedCouponsStateStatus.initial,
        categoryCoupons: [],
        searchQuery: "",
        selectedCategory: 0
    );
  }

  const SearchedCouponsState({
    required this.status,
    required this.categoryCoupons,
    this.tagsIds,
    this.category,
    required this.searchQuery,
    this.minPrice,
    this.maxPrice,
    required this.selectedCategory,
  });

  SearchedCouponsState copyWith({
    SearchedCouponsStateStatus? status,
    List<Coupon>? categoryCoupons,
    List<int>? tagsIds,
    String? category,
    String? searchQuery,
    double? minPrice,
    double? maxPrice,
    int? selectedCategory,
  }) {
    return SearchedCouponsState(
      status: status ?? this.status,
      categoryCoupons: categoryCoupons ?? this.categoryCoupons,
      tagsIds: tagsIds ?? this.tagsIds,
      category: category ?? this.category,
      searchQuery: searchQuery ?? this.searchQuery,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }

  @override
  List<Object?> get props =>
      [
        status,
        categoryCoupons,
        tagsIds,
        category,
        searchQuery,
        minPrice,
        maxPrice,
        selectedCategory,
      ];
}
