import 'dart:math';

import 'package:blue/blocs/theme_cubit/theme_cubit.dart';
import 'package:blue/models/cart_coupon/cart_coupon.dart';
import 'package:blue/models/user_coupon/user_coupon.dart';
import 'package:blue/widgets/common/app_bar_with_arrow.dart';
import 'package:blue/widgets/common/cart_coupon_tile.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

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
                SizedBox(
                  width: 230,
                  height: 230,
                  child: Stack(
                    children: [
                      Transform.rotate(
                          angle: pi,
                          child: SvgPicture.asset('assets/images/rect.svg', color: Theme.of(context).highlightColor,)),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Transform.rotate(
                            angle: - pi / 2,
                            child: SvgPicture.asset('assets/images/rect.svg', color: Theme.of(context).highlightColor,)),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: SvgPicture.asset('assets/images/rect.svg', color: Theme.of(context).highlightColor,),
                      ),
                      Positioned(
                        left: 0,
                        bottom: 0,
                        child: Transform.rotate(
                            angle: pi / 2,
                            child: SvgPicture.asset('assets/images/rect.svg', color: Theme.of(context).highlightColor,)),
                      ),
                      Center(child: Image.network(context.watch<ThemeCubit>().state.theme == ThemeMode.light ? 'https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=${coupon.displayId}' : 'https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=${coupon.displayId}&color=FFFFFF&bgcolor=121725')),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('CÓDIGO:', style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w300, fontSize: 16,),),
                    Text(coupon.displayId.toString(), style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w600, fontSize: 16,),),
                  ],
                ),
              ],
            ),
          )),
          Expanded(flex: 3,child: Align(
              alignment: Alignment.topCenter,
              child: CartCouponTile(coupon: CartCoupon(quantity: 0, id: -1, couponId: coupon.id, coupon: coupon.coupon, buyerUid: ''), withCounter: false,)))
        ],
      ),
    );
  }
}
