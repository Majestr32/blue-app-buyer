import 'package:blue/models/friend/friend.dart';
import 'package:blue/models/user/user.dart';
import 'package:blue/models/user_coupon/user_coupon.dart';
import 'package:blue/models/user_fav/user_fav.dart';

import '../../models/cart_coupon/cart_coupon.dart';

abstract class IUserServiceContract{
  Future<List<User>> getUsers();
  Future<User> createUser({required String uid, required String username});
  Future<User> activateUser({required String uid,required String phone});
  Future<User> endTutorial({required String uid});
  Future<List<int>> getTagIds({required String uid});
  Future<void> setTags({required String uid, required List<int> tagsIds});
  Future<List<Friend>> getFriends({required String uid});
  Future<Friend?> addFriend({required String initiatorUid, required String receiverUid});
  Future<bool> removeFriend({required String initiatorUid, required String receiverUid});

  Future<List<UserCoupon>> getUserActiveCoupons({required String uid});
  Future<List<UserCoupon>> getUserExpiredCoupons({required String uid});
  Future<List<UserCoupon>> getUserUsedCoupons({required String uid});
  Future<List<UserCoupon>> getUserFriendsCoupons({required String uid});

  Future<void> sendCouponToFriend({required int couponId, required String receiverUid});

  Future<User> editUser({required String uid,String? fileUrl, String? newUsername});

  Future<List<CartCoupon>> getCartCoupons({required String uid});
  Future<CartCoupon> addItemToCart({required String uid, required int couponId});
  Future<bool> removeItemToCart({required String uid, required int couponId});

  Future<List<UserFav>> getFavs({required String uid});
  Future<bool> removeFav({required String uid, required int couponId});
  Future<UserFav> addCouponToFavs({required String uid, required int couponId});

  Future<List<UserCoupon>> getUserCoupons({required String uid, int? offset, int? count, String? type});
  Future<User?> getUserById({required String uid});
}