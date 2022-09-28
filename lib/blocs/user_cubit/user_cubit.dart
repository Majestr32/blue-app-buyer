import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:blue/custom_error.dart';
import 'package:blue/models/cart_coupon/cart_coupon.dart';
import 'package:blue/models/user/user.dart';
import 'package:blue/models/user_fav/user_fav.dart';
import 'package:blue/repositories/payment/payment_repository.dart';
import 'package:blue/repositories/user/user_repository.dart';
import 'package:equatable/equatable.dart';

import '../../models/coupon/coupon.dart';
import '../../models/friend/friend.dart';
import '../../models/user_coupon/user_coupon.dart';
import '../auth_bloc/auth_bloc.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository _userRepository;
  final PaymentRepository _paymentRepository;

  UserCubit({
    required UserRepository userRepository,
    required PaymentRepository paymentRepository
  })  :  _userRepository = userRepository,
         _paymentRepository = paymentRepository,
        super(UserState.initial());

  void setNotAuthenticated(){
    emit(state.copyWith(status: UserStateStatus.notAuthenticated));
  }
  Future<void> setTags(List<int> tagsIds) async{
    await _userRepository.setTags(uid: state.user.uid!, tagsIds: tagsIds);
    if(state.user.endedTutorial!){
      emit(state.copyWith(tagsIds: tagsIds));
    }else{
      await _userRepository.endTutorial(uid: state.user.uid!);
      emit(state.copyWith(tagsIds: tagsIds, user: state.user.copyWith.call(endedTutorial: true)));
    }
  }
  Future<void> sendCouponToFriend(int couponId, String receiverUid) async{
    await _userRepository.sendCouponToFriend(couponId: couponId, receiverUid: receiverUid);
    List<UserCoupon> activeCoupons = await _userRepository.getUserActiveCoupons(uid: state.user.uid!);
    List<UserCoupon> expiredCoupons = await _userRepository.getUserExpiredCoupons(uid: state.user.uid!);
    List<UserCoupon> usedCoupons = await _userRepository.getUserUsedCoupons(uid: state.user.uid!);
    List<UserCoupon> friendsCoupons = await _userRepository.getUserFriendsCoupons(uid: state.user.uid!);
    emit(state.copyWith(activeCoupons: activeCoupons, expiredCoupons: expiredCoupons, friendsCoupons: friendsCoupons, usedCoupons: usedCoupons));
  }
  Future<void> editUser(String? fileUrl, String? newUsername) async{
    String uid = state.user.uid!;
    final fbUser = state.user.user;
    final user = await _userRepository.editUser(uid: uid, fileUrl: fileUrl, newUsername: newUsername);
    user.user = fbUser;
    emit(state.copyWith(user: user));
  }
  Future<void> toggleFav(int couponId) async{
    if(state.status != UserStateStatus.authenticated){
      return;
    }
    final likes = state.favs.where((element) => element.couponId == couponId && element.buyerUid == state.user.uid);
    if(likes.isEmpty){
      UserFav fav = await _userRepository.addCouponToFavs(uid: state.user.uid!, couponId: couponId);
      emit(state.copyWith(favs: [fav,...state.favs]));
    }else{
      for(var like in likes){
        _userRepository.removeFav(uid: state.user.uid!, couponId: couponId);
      }
      emit(state.copyWith(favs: state.favs.where((element) => element.couponId != couponId).toList()));
    }
  }
  Future<void> addFriend(String friendUid) async{
    Friend? friend = await _userRepository.addFriend(initiatorUid: state.user.uid!, receiverUid: friendUid);
    if(friend == null){
      UserStateStatus previousStatus = state.status;
      emit(state.copyWith(status: UserStateStatus.error, error: 'User not found'));
      emit(state.copyWith(status: previousStatus, error: null));
      return;
    }
    emit(state.copyWith(friends: [friend,...state.friends]));
  }
  Future<void> removeFriend(String friendUid) async{
    _userRepository.removeFriend(initiatorUid: state.user.uid!, receiverUid: friendUid);
    List<Friend> friends = state.friends.where((e) => e.receiverUid != friendUid).toList();
    emit(state.copyWith(friends: friends));
  }
  Future<void> addCouponToCart(int couponId) async{
    if(state.cartCoupons.where((element) => element.couponId == couponId).isNotEmpty){
      emit(state.copyWith(cartCoupons: state.cartCoupons.map((e) => e.couponId == couponId ? e.copyWith.call(quantity: e.quantity + 1) : e).toList()));
      return;
    }
    final cartCoupon = await _userRepository.addItemToCart(uid: state.user.uid!, couponId: couponId);
    emit(state.copyWith(cartCoupons: [cartCoupon,...state.cartCoupons]));
  }
  Future<void> removeCouponFromCart(int couponId) async{
    _userRepository.removeItemToCart(uid: state.user.uid!, couponId: couponId);
    int couponQuantity = state.cartCoupons.where((element) => element.couponId == couponId).first.quantity;
    if(couponQuantity == 1){
      emit(state.copyWith(cartCoupons: state.cartCoupons.where((element) => element.couponId != couponId).toList()));
      return;
    }
    emit(state.copyWith(cartCoupons: state.cartCoupons.map((e) => e.couponId == couponId ? e.copyWith.call(quantity: e.quantity - 1) : e).toList()));
  }
  Future<void> init(AuthState event) async{
    User? user = await _userRepository.getUserById(uid: event.user!.uid);
    if(user == null){
      await _userRepository.createUser(uid: event.user!.uid, username: event.user!.displayName!);
      user = await _userRepository.getUserById(uid: event.user!.uid);
    }
    user!.user = event.user;
    List<UserFav> favs = await _userRepository.getFavs(uid: event.user!.uid);
    List<int> tags = await _userRepository.getTagIds(uid: event.user!.uid);
    List<Friend> friends = await _userRepository.getFriends(uid: event.user!.uid);
    List<CartCoupon> cartCoupons = await _userRepository.getCartCoupons(uid: event.user!.uid);
    List<UserCoupon> activeCoupons = await _userRepository.getUserActiveCoupons(uid: event.user!.uid);
    List<UserCoupon> expiredCoupons = await _userRepository.getUserExpiredCoupons(uid: event.user!.uid);
    List<UserCoupon> usedCoupons = await _userRepository.getUserUsedCoupons(uid: event.user!.uid);
    List<UserCoupon> friendsCoupons = await _userRepository.getUserFriendsCoupons(uid: event.user!.uid);
    emit(state.copyWith(
        cartCoupons: cartCoupons,
        user: user, favs: favs, tagsIds: tags, friends: friends, status: UserStateStatus.authenticated,
    friendsCoupons: friendsCoupons, expiredCoupons: expiredCoupons, usedCoupons: usedCoupons, activeCoupons: activeCoupons));
    final customerId = (await _paymentRepository.getOrCreateCustomerByEmail(event.user!.email!))["id"];
    List<dynamic> cards = await _paymentRepository.listCustomerPaymentMethods(customerId);
    emit(state.copyWith(cards: cards));
  }
  Future<void> addCard(String cardNumber, int expMonth, int expYear, String cvc) async{
    UserStateStatus previousStatus = state.status;
    try{
      emit(state.copyWith(status: UserStateStatus.loading));
      log(cardNumber + " " + expMonth.toString() + " " + expYear.toString() + " " + cvc);
      final paymentMethod = await _paymentRepository.createPaymentMethod(cardNumber, expMonth, expYear, cvc);
      final customerId = (await _paymentRepository.getOrCreateCustomerByEmail(state.user.user!.email!))["id"];
      await _paymentRepository.attachPaymentMethod(paymentMethod["id"], customerId);
      emit(state.copyWith(cards: [paymentMethod,...state.cards], status: previousStatus));
    } on CustomError catch(e){
      emit(state.copyWith(status: UserStateStatus.error, error: e.error));
      emit(state.copyWith(status: previousStatus));
    }
  }
  Future<void> checkout(String paymentMethodId) async{
    UserStateStatus previousStatus = state.status;
    try{
      emit(state.copyWith(status: UserStateStatus.loading));
      final customerId = (await _paymentRepository.getOrCreateCustomerByEmail(state.user.user!.email!))["id"];
      await _paymentRepository.checkout(state.user.user!.uid, state.cartSum, paymentMethodId, customerId);
      List<UserCoupon> activeCoupons = await _userRepository.getUserActiveCoupons(uid: state.user.uid!);
      List<UserCoupon> expiredCoupons = await _userRepository.getUserExpiredCoupons(uid: state.user.uid!);
      List<UserCoupon> usedCoupons = await _userRepository.getUserUsedCoupons(uid: state.user.uid!);
      List<UserCoupon> friendsCoupons = await _userRepository.getUserFriendsCoupons(uid: state.user.uid!);
      emit(state.copyWith(status: UserStateStatus.successOperation, cartCoupons: [], activeCoupons: activeCoupons, expiredCoupons: expiredCoupons, usedCoupons: usedCoupons, friendsCoupons: friendsCoupons));
    }on CustomError catch(e){
      emit(state.copyWith(status: UserStateStatus.error, error: e.error));
    }finally{
      emit(state.copyWith(status: previousStatus));
    }
  }
  Future<void> removeCard(String paymentMethodId) async{
    UserStateStatus previousStatus = state.status;
    emit(state.copyWith(status: UserStateStatus.loading));
    await _paymentRepository.detachPaymentMethod(paymentMethodId);
    emit(state.copyWith(cards: state.cards.where((element) => element["id"] != paymentMethodId).toList(), status: previousStatus));
  }
}
