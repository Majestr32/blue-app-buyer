import 'dart:developer';

import 'package:blue/consts/api.dart';
import 'package:blue/models/branch/branch.dart';
import 'package:blue/models/coupon/coupon.dart';
import 'package:blue/models/coupon_review/coupon_review.dart';
import 'package:blue/services/coupon/coupon_service_contract.dart';
import 'package:dio/dio.dart';

class CouponService implements ICouponService{
  final Dio _dio;

  @override
  Future<List<Coupon>> getCoupons(int offset, int count) async{
     final response = await _dio.get("$hostApi/coupons", queryParameters: {
       'offset': offset,
       'count': count,
       'status': 'active'
     });
     final jsonArr = response.data as List<dynamic>;
     return jsonArr.map((e) => Coupon.fromJson(e)).toList();
  }


  const CouponService({
    required Dio dio,
  }) : _dio = dio;


  @override
  Future<List<Coupon>> getRecommendedCoupons(int offset, int count, List<int> tagsIds) async{
    final response = await _dio.get("$hostApi/coupons", queryParameters: {
      'offset': offset,
      'count': count,
      'favs[]': tagsIds,
      'status': 'active'
    });
    final jsonArr = response.data as List<dynamic>;
    return jsonArr.map((e) => Coupon.fromJson(e)).toList();
  }

  @override
  Future<List<Coupon>> getFilteredCoupons(int offset, int count, {List<int>? tagsIds, double? minPrice, double? maxPrice, String? searchQuery}) async{
    var queryParams = {
      'offset': offset,
      'count': count,
      'status': 'active',
      'favs[]': tagsIds,
      'min_price': minPrice,
      'max_price': maxPrice,
      'query': searchQuery
    };
    queryParams.removeWhere((key, value) => value == null);
    final response = await _dio.get("$hostApi/coupons", queryParameters: queryParams);
    final jsonArr = response.data as List<dynamic>;
    return jsonArr.map((e) => Coupon.fromJson(e)).toList();
  }

  @override
  Future<List<CouponReview>> getCouponReviews(int couponId) async{
    final response = await _dio.get("$hostApi/reviews", queryParameters: {
      'coupon_id': couponId,
    });
    final jsonArr = response.data as List<dynamic>;
    return jsonArr.map((e) => CouponReview.fromJson(e)).toList();
  }

  @override
  Future<List<Coupon>> getCouponsByIds(List<int> ids) async {
    final response = await _dio.get("$hostApi/coupons", queryParameters: {
      'ids[]': ids
    });
    return (response.data as List).map((e) => Coupon.fromJson(e)).toList();
  }

  @override
  Future<List<Coupon>> getNewCoupons(int offset, int count) async{
    final response = await _dio.get("$hostApi/coupons", queryParameters: {
      'order_by': 'created_at',
      'offset': offset,
      'status': 'active',
      'count': count,
    });
    return (response.data as List).map((e) => Coupon.fromJson(e)).toList();
  }

  @override
  Future<List<Coupon>> getPopularCoupons(int offset, int count) async{
    final response = await _dio.get("$hostApi/coupons", queryParameters: {
      'order_by': 'avg_rating',
      'status': 'active',
      'offset': offset,
      'count': count,
    });
    return (response.data as List).map((e) => Coupon.fromJson(e)).toList();
  }

  @override
  Future<List<Branch>> getCouponBranches(int id) async{
    final response = await _dio.get("$hostApi/coupons/$id/branches");
    return (response.data as List).map((e) => Branch.fromJson(e)).toList();
  }
}