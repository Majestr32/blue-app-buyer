import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:blue/models/cart_coupon/cart_coupon.dart';
import 'package:blue/models/coupon/coupon.dart';
import 'package:blue/models/friend/friend.dart';
import 'package:blue/models/user/user.dart';
import 'package:blue/models/user_coupon/user_coupon.dart';
import 'package:blue/models/user_fav/user_fav.dart';
import 'package:blue/services/user/user_service_contract.dart';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../consts/api.dart';
import '../../models/cart_coupon/cart_coupon.dart';

class UserService implements IUserServiceContract{
  final Dio _dio;

  @override
  Future<User> activateUser({required String uid, required String phone}) async{
    final body = {
      'phone': phone
    };
    final response = await _dio.put("${hostApi}buyers/$uid/activate", data: body);
    final json = response.data;
    return User.fromJson(json);
  }

  @override
  Future<UserFav> addCouponToFavs({required String uid, required int couponId}) async{
    final body = {
      'coupon_id': couponId,
    };
    final response = await _dio.post("${hostApi}buyers/$uid/favs", data: body);
    final json = response.data;
    return UserFav.fromJson(json);
  }

  @override
  Future<User> createUser({required String uid, required String username}) async{
    final body = {
      'uid': uid,
      'username': username
    };
    final response = await _dio.post("${hostApi}buyers", data: body);
    final json = response.data;
    return User.fromJson(json);
  }

  @override
  Future<User> endTutorial({required String uid}) async{
    final response = await _dio.put("${hostApi}buyers/$uid/end_tutorial");
    final json = response.data;
    return User.fromJson(json);
  }

  @override
  Future<List<UserFav>> getFavs({required String uid}) async{
    final response = await _dio.get("${hostApi}buyers/$uid/favs");
    final jsonArr = response.data as List<dynamic>;
    return jsonArr.map((e) => UserFav.fromJson(e)).toList();
  }

  @override
  Future<List<int>> getTagIds({required String uid}) async{
    final response = await _dio.get("${hostApi}buyers/$uid/tags");
    final jsonArr = response.data as List<dynamic>;
    return jsonArr.map((e) => e["tag_id"] as int).toList();
  }

  @override
  Future<User?> getUserById({required String uid}) async{
    final response = await _dio.get("${hostApi}buyers/$uid");
    final json = response.data;
    if(json.toString().isEmpty){
      return null;
    }
    return User.fromJson(json);
  }

  @override
  Future<List<UserCoupon>> getUserCoupons({required String uid, int? offset, int? count, String? type}) async{
    final body = {
      'offset': offset,
      'count': count,
      'type': type
    };
    body.removeWhere((key, value) => value == null);
    final response = await _dio.post("${hostApi}buyers/$uid/coupons", data: body);
    final jsonArr = response.data as List<dynamic>;
    return jsonArr.map((e) => UserCoupon.fromJson(e)).toList();
  }

  @override
  Future<List<User>> getUsers() async{
    final response = await _dio.get("${hostApi}buyers");
    final jsonArr = response.data as List<dynamic>;
    return jsonArr.map((e) => User.fromJson(e)).toList();
  }

  @override
  Future<bool> removeFav({required String uid, required int couponId}) async{
    return (await _dio.delete("${hostApi}buyers/$uid/favs/$couponId")).data == "1";
  }

  @override
  Future<void> setTags({required String uid, required List<int> tagsIds}) async{
    await _dio.put("${hostApi}buyers/$uid/tags", data: {'tag_ids': tagsIds});
  }

  UserService({
    required Dio dio,
  }) : _dio = dio;

  @override
  Future<Friend?> addFriend({required String initiatorUid, required String receiverUid}) async{
    final response = await _dio.post("${hostApi}buyers/$initiatorUid/friends", data: {'receiver_uid': receiverUid});
    final json = response.data;
    if(json.toString().isEmpty){
      return null;
    }
    return Friend.fromJson(json);
  }

  @override
  Future<List<Friend>> getFriends({required String uid}) async{
    final response = await _dio.get("${hostApi}buyers/$uid/friends");
    final jsonArr = response.data as List<dynamic>;
    return jsonArr.map((e) => Friend.fromJson(e)).toList();
  }

  @override
  Future<bool> removeFriend({required String initiatorUid, required String receiverUid}) async{
    return ((await _dio.delete("${hostApi}buyers/$initiatorUid/friends/$receiverUid")).data as int) == 1;
  }

  @override
  Future<List<UserCoupon>> getUserActiveCoupons({required String uid}) async{
    final response = await _dio.get("${hostApi}buyers/$uid/coupons", queryParameters: {
      'type': 'active'
    });
    final jsonArr = response.data as List<dynamic>;
    return jsonArr.map((e) => UserCoupon.fromJson(e)).toList();
  }

  @override
  Future<List<UserCoupon>> getUserExpiredCoupons({required String uid}) async{
    final response = await _dio.get("${hostApi}buyers/$uid/coupons", queryParameters: {
      'type': 'expired'
    });
    final jsonArr = response.data as List<dynamic>;
    return jsonArr.map((e) => UserCoupon.fromJson(e)).toList();
  }

  @override
  Future<List<UserCoupon>> getUserFriendsCoupons({required String uid}) async{
    final response = await _dio.get("${hostApi}buyers/$uid/coupons", queryParameters: {
      'type': 'friends'
    });
    final jsonArr = response.data as List<dynamic>;
    return jsonArr.map((e) => UserCoupon.fromJson(e)).toList();
  }

  @override
  Future<List<UserCoupon>> getUserUsedCoupons({required String uid}) async{
    final response = await _dio.get("${hostApi}buyers/$uid/coupons", queryParameters: {
      'type': 'used'
    });
    final jsonArr = response.data as List<dynamic>;
    return jsonArr.map((e) => UserCoupon.fromJson(e)).toList();
  }



  @override
  Future<List<CartCoupon>> getCartCoupons({required String uid}) async{
    final response = await _dio.get("${hostApi}carts/$uid/coupons");
    final jsonArr = response.data as List<dynamic>;
    return jsonArr.map((e) => CartCoupon.fromJson(e)).toList();
  }

  @override
  Future<bool> removeItemToCart({required String uid, required int couponId}) async{
    return (await _dio.delete("${hostApi}carts/$uid/coupons/$couponId")).data == "1";
  }

  @override
  Future<CartCoupon> addItemToCart({required String uid, required int couponId}) async{
    final response = await _dio.post("${hostApi}carts/$uid/coupons", data: {
      'coupon_id': couponId
    });
    final json = response.data;
    return CartCoupon.fromJson(json);
  }

  @override
  Future<User> editUser({required String uid, String? fileUrl, String? newUsername}) async{
    if(fileUrl != null){
      final task = await FirebaseStorage.instance.ref().child('user_profile_images').child("$uid.jpg").putFile(File(fileUrl));
      final remoteUrl = await task.ref.getDownloadURL();
      final response = await _dio.put("${hostApi}buyers/$uid/edit", data: {
        'username': newUsername,
        'profile_img_url': remoteUrl
      });
      return User.fromJson(response.data);
    }else{
      final response = await _dio.put("${hostApi}buyers/$uid/edit", data: {
        'username': newUsername,
      });
      return User.fromJson(response.data);
    }
  }

  @override
  Future<void> sendCouponToFriend({required int couponId, required String receiverUid}) async{
    log(couponId.toString() + " " + receiverUid);
    await _dio.put("${hostApi}coupons/sent_to", data: {
      'coupon_id': couponId,
      'sent_to': receiverUid
    });
  }
}