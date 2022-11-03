part of 'user_cubit.dart';

enum UserStateStatus {
  initial,
  notAuthenticated,
  loading,
  successOperation,
  error,
  authenticated
}

class UserState extends Equatable {
  final User user;
  final Fee? fees;
  final List<UserFav> favs;
  final List<int> tagsIds;
  final List<Friend> friends;
  final List<UserCoupon> activeCoupons;
  final List<UserCoupon> expiredCoupons;
  final List<UserCoupon> usedCoupons;
  final List<UserCoupon> friendsCoupons;
  final List<CartCoupon> cartCoupons;
  final List<dynamic> cards;
  final String? error;
  final UserStateStatus status;

  double get cartSum =>
      cartCoupons.fold(0, (previousValue, element) =>
      element.coupon.discount == null
          ? previousValue + element.quantity * element.coupon.price
          : previousValue + element.quantity * (element.coupon.price -
          element.coupon.price * element.coupon.discount! / 100));

  String getFriendNameFromUid(String uid){
    final foundFriends = friends.where((friend) => friend.receiverUid == uid);
    if(foundFriends.isEmpty){
      return 'Eliminado de amigos';
    }else{
      return foundFriends.first.friend.username!;
    }
  }

  factory UserState.initial(){
    return UserState(
        cards: [],
        cartCoupons: [],
        activeCoupons: [],
        expiredCoupons: [],
        usedCoupons: [],
        friendsCoupons: [],
        user: User(),
        favs: [],
        friends: [],
        error: null,
        tagsIds: [],
        status: UserStateStatus.initial);
  }

  bool isLiked(int couponId) {
    try {
      favs.firstWhere((element) => element.couponId == couponId);
      return true;
    } on StateError catch (e) {
      return false;
    }
  }

  const UserState({
    required this.user,
    this.fees,
    required this.favs,
    required this.tagsIds,
    required this.friends,
    required this.activeCoupons,
    required this.expiredCoupons,
    required this.usedCoupons,
    required this.friendsCoupons,
    required this.cartCoupons,
    required this.cards,
    this.error,
    required this.status,
  });

  UserState copyWith({
    User? user,
    Fee? fees,
    List<UserFav>? favs,
    List<int>? tagsIds,
    List<Friend>? friends,
    List<UserCoupon>? activeCoupons,
    List<UserCoupon>? expiredCoupons,
    List<UserCoupon>? usedCoupons,
    List<UserCoupon>? friendsCoupons,
    List<CartCoupon>? cartCoupons,
    List<dynamic>? cards,
    String? error,
    UserStateStatus? status,
  }) {
    return UserState(
      user: user ?? this.user,
      fees: fees ?? this.fees,
      favs: favs ?? this.favs,
      tagsIds: tagsIds ?? this.tagsIds,
      friends: friends ?? this.friends,
      activeCoupons: activeCoupons ?? this.activeCoupons,
      expiredCoupons: expiredCoupons ?? this.expiredCoupons,
      usedCoupons: usedCoupons ?? this.usedCoupons,
      friendsCoupons: friendsCoupons ?? this.friendsCoupons,
      cartCoupons: cartCoupons ?? this.cartCoupons,
      cards: cards ?? this.cards,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props =>
      [
        user,
        fees,
        favs,
        tagsIds,
        friends,
        activeCoupons,
        expiredCoupons,
        usedCoupons,
        friendsCoupons,
        cartCoupons,
        cards,
        error,
        status,
      ];
}
