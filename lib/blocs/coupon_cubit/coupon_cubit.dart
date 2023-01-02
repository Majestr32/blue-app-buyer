import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:blue/data/data_sources/data_source_contract.dart';
import 'package:blue/models/branch/branch.dart';
import 'package:blue/models/coupon/coupon.dart';
import 'package:blue/repositories/branch/branch_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:async/async.dart';

import '../../repositories/coupon/coupon_repository.dart';

part 'coupon_state.dart';

class CouponCubit extends Cubit<CouponState> {
  final CouponRepository _couponRepository;
  final BranchRepository _branchRepository;
  CancelableOperation? searchOperation;
  CancelableOperation? mapSearchOperation;


  Future<void> loadStartCoupons(List<int> tagsIds) async{
    List<Coupon> newCoupons = await _couponRepository.getNewCoupons(0, 8);
    List<Coupon> categoryCoupons = newCoupons;
    List<Coupon> recommendedCoupons = await _couponRepository.getRecommendedCoupons(0, 3, tagsIds);
    List<Coupon> history = await _couponRepository.getCouponHistory(0, 5);
    List<Coupon> popularCoupons = await _couponRepository.getPopularCoupons(0, 5);
    List<Branch> branches = await _branchRepository.listAllBranches();
    emit(state.copyWith(status: CouponStateStatus.loaded, markerBranches: branches, categoryCoupons: categoryCoupons, popularCoupons: popularCoupons, newCoupons: newCoupons, history: history, recommendedCoupons: recommendedCoupons));
  }

  Future<void> loadBranches() async{
    List<Branch> newBranches = await _branchRepository.getFilteredBranches(favs: state.selectedCategory == 0 ? [] : [state.selectedCategory], query: state.searchQuery.isEmpty ? null : state.searchQuery, minPrice: state.minPrice, maxPrice: state.maxPrice);
    emit(state.copyWith(status: CouponStateStatus.loaded, markerBranches: newBranches));
  }

  Future<void> initLocalDb(IDataSource data) async{
    return _couponRepository.setDataSource(data);
  }

  Future<void> setSearchQuery(String searchQuery) async{
    searchOperation?.cancel();
    mapSearchOperation?.cancel();
    emit(state.copyWith(searchQuery: searchQuery, categoryCoupons: [], status: CouponStateStatus.loading));
    searchOperation = CancelableOperation.fromFuture(Future.delayed(Duration(seconds: 1)).then((_) => loadCoupons()));
    mapSearchOperation = CancelableOperation.fromFuture(Future.delayed(Duration(seconds: 1)).then((_) => loadBranches()));
  }

  Future<void> addCouponToHistory(int id) async{
    final lastInsertedCouponId = state.history.isEmpty ? -1 : state.history.first.id;
    if(id == lastInsertedCouponId){
      return;
    }
    final coupon = await _couponRepository.addCouponToHistory(id);
    emit(state.copyWith(history: [coupon,...state.history]));
  }

  Future<void> setPriceRange(double minPrice, double maxPrice) async{
    searchOperation?.cancel();
    mapSearchOperation?.cancel();
    emit(state.copyWith(minPrice: minPrice, maxPrice: maxPrice, status: CouponStateStatus.loading));
    searchOperation = CancelableOperation.fromFuture(Future.delayed(Duration(seconds: 1)).then((_) => loadCoupons()));
    mapSearchOperation = CancelableOperation.fromFuture(Future.delayed(Duration(seconds: 1)).then((_) => loadBranches()));
  }

  Future<void> changeCategoryTo(int category) async{
    searchOperation?.cancel();
    mapSearchOperation?.cancel();
    emit(state.copyWith(categoryCoupons: [], selectedCategory: category, status: CouponStateStatus.loading));
    searchOperation = CancelableOperation.fromFuture(Future.delayed(Duration(seconds: 1)).then((_) => loadCoupons()));
    mapSearchOperation = CancelableOperation.fromFuture(Future.delayed(Duration(seconds: 1)).then((_) => loadBranches()));
  }

  Future<void> loadNewCoupons() async{
    int newCouponsCount = state.categoryCoupons.length;
    List<Coupon> newCoupons = await _couponRepository.getFilteredCoupons(newCouponsCount, 8, tagsIds: state.selectedCategory == 0 ? [] : [state.selectedCategory], searchQuery: state.searchQuery.isEmpty ? null : state.searchQuery, minPrice: state.minPrice, maxPrice: state.maxPrice);
    emit(state.copyWith(status: CouponStateStatus.loaded, categoryCoupons: [...state.categoryCoupons,...newCoupons]));
  }

  Future<void> loadCoupons() async{
    List<Coupon> newCoupons = await _couponRepository.getFilteredCoupons(0, 8, tagsIds: state.selectedCategory == 0 ? [] : [state.selectedCategory], searchQuery: state.searchQuery.isEmpty ? null : state.searchQuery, minPrice: state.minPrice, maxPrice: state.maxPrice);
    emit(state.copyWith(status: CouponStateStatus.loaded, categoryCoupons: newCoupons));
  }

  CouponCubit({
    required CouponRepository couponRepository,
    required BranchRepository branchRepository,
  })  : _couponRepository = couponRepository,
        _branchRepository = branchRepository, super(CouponState.initial());
}
