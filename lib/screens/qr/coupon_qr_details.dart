import 'package:blue/models/cart_coupon/cart_coupon.dart';
import 'package:blue/models/user_coupon/user_coupon.dart';
import 'package:blue/widgets/common/app_bar_with_arrow.dart';
import 'package:blue/widgets/common/cart_coupon_tile.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CouponQrDetails extends StatelessWidget {
  final UserCoupon coupon;
  const CouponQrDetails({required this.coupon,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBarWithArrow(title: 'CUPÓN',),
      body: Column(
        children: [
          Expanded(flex: 4,child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network('https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=${coupon.qr}'),
                SizedBox(height: 10,),
                Text('CÓDIGO', style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w400, fontSize: 16,),),
              ],
            ),
          )),
          Expanded(flex: 3,child: Align(
              alignment: Alignment.topCenter,
              child: CartCouponTile(coupon: CartCoupon(quantity: 1, id: -1, couponId: coupon.id, coupon: coupon.coupon, buyerUid: ''), withCounter: false,)))
        ],
      ),
    );
  }
}
