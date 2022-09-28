import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/coupon/coupon.dart';
import '../../repositories/coupon/coupon_repository.dart';

part 'searched_coupons_state.dart';

class SearchedCouponsCubit extends Cubit<SearchedCouponsState> {
  final CouponRepository _couponRepository;

  SearchedCouponsCubit({
    required CouponRepository couponRepository,
  }) : _couponRepository = couponRepository, super(SearchedCouponsState.initial());

  Future<void> findCoupons(String query) async{
    emit(state.copyWith(status: SearchedCouponsStateStatus.initial));
    final searchedCoupons = await _couponRepository.getSearchedCoupons(0, 10, query);
    emit(state.copyWith(searchedCoupons: searchedCoupons, status: SearchedCouponsStateStatus.loaded, query: query));
  }

  Future<void> filterCoupons(double? minPrice, double? maxPrice, List<int>? tagsIds) async{
    emit(state.copyWith(status: SearchedCouponsStateStatus.initial));
    final filteredCoupons = await _couponRepository.getFilteredCoupons(0, 10, tagsIds: tagsIds, minPrice: minPrice, maxPrice: maxPrice);
    emit(state.copyWith(searchedCoupons: filteredCoupons, status: SearchedCouponsStateStatus.loaded, minPrice: minPrice, maxPrice: maxPrice, tags: tagsIds));
  }

  Future<void> loadMoreCoupons() async{
    if(state.query.isNotEmpty){
      final newSearchedCoupons = await _couponRepository.getSearchedCoupons(state.searchedCoupons.length, 10, state.query);
      emit(state.copyWith(searchedCoupons: [...state.searchedCoupons,...newSearchedCoupons]));
    }else{
      final newFilteredCoupons = await _couponRepository.getFilteredCoupons(state.searchedCoupons.length, 10, tagsIds: state.tags, minPrice: state.minPrice, maxPrice: state.maxPrice);
      emit(state.copyWith(searchedCoupons: [...state.searchedCoupons,...newFilteredCoupons]));
    }
  }
}
