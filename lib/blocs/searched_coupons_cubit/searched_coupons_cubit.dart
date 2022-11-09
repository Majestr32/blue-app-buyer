import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/coupon/coupon.dart';
import '../../repositories/coupon/coupon_repository.dart';
import 'package:async/async.dart';

part 'searched_coupons_state.dart';

class SearchedCouponsCubit extends Cubit<SearchedCouponsState> {
  final CouponRepository _couponRepository;
  CancelableOperation? searchOperation;

  SearchedCouponsCubit({
    required CouponRepository couponRepository,
  }) : _couponRepository = couponRepository, super(SearchedCouponsState.initial());

  Future<void> changeCategoryTo(int category) async{
    searchOperation?.cancel();
    emit(state.copyWith(categoryCoupons: [], selectedCategory: category, status: SearchedCouponsStateStatus.loading));
    searchOperation = CancelableOperation.fromFuture(loadCoupons(),);
  }

  Future<void> loadCoupons() async{
    int newCouponsCount = state.categoryCoupons.length;
    List<Coupon> newCoupons = await _couponRepository.getFilteredCoupons(newCouponsCount, 8, tagsIds: state.selectedCategory == 0 ? [] : [state.selectedCategory], searchQuery: state.searchQuery.isEmpty ? null : state.searchQuery, minPrice: state.minPrice, maxPrice: state.maxPrice);
    emit(state.copyWith(status: SearchedCouponsStateStatus.loaded, categoryCoupons: newCoupons));
  }

  Future<void> setSearchQuery(String searchQuery) async{
    searchOperation?.cancel();
    emit(state.copyWith(searchQuery: searchQuery, categoryCoupons: [], status: SearchedCouponsStateStatus.loading));
    searchOperation = CancelableOperation.fromFuture(loadCoupons(),);
  }

  Future<void> setPriceRange(double minPrice, double maxPrice) async{
    searchOperation?.cancel();
    emit(state.copyWith(minPrice: minPrice, maxPrice: maxPrice, categoryCoupons: [], status: SearchedCouponsStateStatus.loading));
    searchOperation = CancelableOperation.fromFuture(loadCoupons(),);
  }

  Future<void> setCategory(String category,{List<int>? tagsIds}) async{
    emit(SearchedCouponsState.initial());
    emit(state.copyWith(category: category, tagsIds: tagsIds));
    loadMoreCoupons();
  }

  Future<void> loadMoreCoupons() async{
    if(state.category != null){
      final List<Coupon> coupons;
      switch(state.category){
        case 'recommended':
          assert(state.tagsIds != null,'Tag`s id can`t be null');
          coupons = await _couponRepository.getRecommendedCoupons(state.categoryCoupons.length, 10, state.tagsIds!);
          break;
        case 'new':
          coupons = await _couponRepository.getNewCoupons(state.categoryCoupons.length, 10);
          break;
        case 'history':
          coupons = await _couponRepository.getCouponHistory(state.categoryCoupons.length, 10);
          break;
        default:
          return;
      }
      emit(state.copyWith(categoryCoupons: [...state.categoryCoupons,...coupons], status: SearchedCouponsStateStatus.loaded));
      return;
    }

    final newFilteredCoupons = await _couponRepository.getFilteredCoupons(state.categoryCoupons.length, 10, tagsIds: [state.selectedCategory], minPrice: state.minPrice, maxPrice: state.maxPrice, searchQuery: state.searchQuery.isEmpty ? null : state.searchQuery);
    emit(state.copyWith(categoryCoupons: [...state.categoryCoupons,...newFilteredCoupons], status: SearchedCouponsStateStatus.loaded));
  }
}
