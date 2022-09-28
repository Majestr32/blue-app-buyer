import 'package:blue/services/user/user_service_contract.dart';

import '../../models/cart_coupon/cart_coupon.dart';
import '../../models/coupon/coupon.dart';
import '../../models/friend/friend.dart';
import '../../models/user/user.dart';
import '../../models/user_coupon/user_coupon.dart';
import '../../models/user_fav/user_fav.dart';

class UserRepository{
  final IUserServiceContract _userService;

  Future<List<User>> getUsers(){
    return _userService.getUsers();
  }
  Future<User> editUser({required String uid, String? fileUrl, String? newUsername}) async{
    return _userService.editUser(uid: uid, fileUrl: fileUrl, newUsername: newUsername);
  }
  Future<void> sendCouponToFriend({required int couponId, required String receiverUid}) async{
    return _userService.sendCouponToFriend(couponId: couponId, receiverUid: receiverUid);
  }
  Future<User> createUser({required String uid, required String username}){
    return _userService.createUser(uid: uid, username: username);
  }
  Future<User> activateUser({required String uid,required String phone}){
    return _userService.activateUser(uid: uid, phone: phone);
  }
  Future<User> endTutorial({required String uid}){
    return _userService.endTutorial(uid: uid);
  }
  Future<List<int>> getTagIds({required String uid}){
    return _userService.getTagIds(uid: uid);
  }
  Future<void> setTags({required String uid, required List<int> tagsIds}){
    return _userService.setTags(uid: uid, tagsIds: tagsIds);
  }

  Future<List<UserFav>> getFavs({required String uid}){
    return _userService.getFavs(uid: uid);
  }

  Future<List<UserCoupon>> getUserActiveCoupons({required String uid}) async{
    return _userService.getUserActiveCoupons(uid: uid);
  }
  Future<List<UserCoupon>> getUserExpiredCoupons({required String uid}) async{
    return _userService.getUserExpiredCoupons(uid: uid);
  }
  Future<List<UserCoupon>> getUserUsedCoupons({required String uid}) async{
    return _userService.getUserUsedCoupons(uid: uid);
  }
  Future<List<UserCoupon>> getUserFriendsCoupons({required String uid}) async{
    return _userService.getUserFriendsCoupons(uid: uid);
  }
  Future<List<CartCoupon>> getCartCoupons({required String uid}){
    return _userService.getCartCoupons(uid: uid);
  }
  Future<CartCoupon> addItemToCart({required String uid, required int couponId}){
    return _userService.addItemToCart(uid: uid, couponId: couponId);
  }
  Future<bool> removeItemToCart({required String uid, required int couponId}){
    return _userService.removeItemToCart(uid: uid, couponId: couponId);
  }

  Future<bool> removeFav({required String uid, required int couponId}){
    return _userService.removeFav(uid: uid, couponId: couponId);
  }
  Future<List<Friend>> getFriends({required String uid}) async{
    return _userService.getFriends(uid: uid);
  }
  Future<Friend?> addFriend({required String initiatorUid, required String receiverUid}) async{
    return _userService.addFriend(initiatorUid: initiatorUid, receiverUid: receiverUid);
  }
  Future<bool> removeFriend({required String initiatorUid, required String receiverUid}) async{
    return _userService.removeFriend(initiatorUid: initiatorUid, receiverUid: receiverUid);
  }
  Future<UserFav> addCouponToFavs({required String uid, required int couponId}){
    return _userService.addCouponToFavs(uid: uid, couponId: couponId);
  }

  Future<List<UserCoupon>> getUserCoupons({required String uid, int? offset, int? count, String? type}){
    return _userService.getUserCoupons(uid: uid);
  }
  Future<User?> getUserById({required String uid}){
    return _userService.getUserById(uid: uid);
  }

  const UserRepository({
    required IUserServiceContract userService,
  }) : _userService = userService;
}