import 'dart:developer';

import 'package:blue/models/cart_coupon/cart_coupon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../blocs/theme_cubit/theme_cubit.dart';
import '../../blocs/user_cubit/user_cubit.dart';
import '../../consts/k_icons.dart';
import '../../models/coupon/coupon.dart';
import '../../screens/details/ticket_details.dart';

class CartCouponTile extends StatelessWidget {
  final CartCoupon coupon;
  final bool withCounter;
  const CartCouponTile({required this.coupon, this.withCounter = true,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(width: MediaQuery.of(context).size.width * 0.9, height: 120,
      child: Stack(
        children: [
          Row(children: [
            InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => TicketDetails(coupon: coupon.coupon, tag: 'active_vertical_small_${coupon.id}')));
                },
                child: CircleAvatar(radius: 32, backgroundImage: Image.network(coupon.coupon.posterUrl).image, backgroundColor: Colors.grey, child: withCounter || coupon.quantity == 0 ? null : Align(alignment: Alignment.topRight, child: CircleAvatar(radius: 9, backgroundColor: Color(0xFFF9A137), child: Text(coupon.quantity.toString(), style: TextStyle(fontFamily: 'Outfit', fontSize: 8, color: Colors.white, fontWeight: FontWeight.w500),),),),)),
            SizedBox(width: 10,),
            Expanded(flex: 2,child: Text(coupon.coupon.name, maxLines: 2, style: TextStyle(fontFamily: 'Outfit', fontSize: 12, fontWeight: FontWeight.w500), overflow: TextOverflow.ellipsis,)),
            SizedBox(width: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                coupon.coupon.discount == null ? Row(children: [
                  SizedBox(width: 4,),
                  Text("\$${coupon.coupon.price}", style: TextStyle(fontFamily: 'Poppins', fontSize: 15, color: context.watch<ThemeCubit>().state.theme == ThemeMode.light ? Color(0xFF595CE6) : Colors.white, fontWeight: FontWeight.bold),),
                ],) :
                Row(
                  children: [
                    SizedBox(width: 4,),
                    Text("\$${coupon.coupon.price}", style: TextStyle(fontFamily: 'Poppins', fontSize: 15, color: Color(0xFF8F8F8F), decoration: TextDecoration.lineThrough, fontWeight: FontWeight.bold),),
                    SizedBox(width: 3,),
                    Text("\$${coupon.coupon.priceWithDiscount}", style: TextStyle(fontFamily: 'Poppins', fontSize: 15, color: context.watch<ThemeCubit>().state.theme == ThemeMode.light ? Color(0xFF595CE6) : Colors.white, fontWeight: FontWeight.bold),),
                  ],),
                coupon.coupon.discount == null ? Container() : Align(
                    alignment: Alignment.centerRight,
                    child: Text('${coupon.coupon.discount}% descuento', style: TextStyle(fontFamily: 'Poppins', fontSize: 12, color: Color(0xFF41BF71)),)),
              ],
            )
          ],),
          !withCounter ? Container() : Positioned(right: 0, bottom: 0,child: _controllers(context, coupon.quantity, coupon.couponId),)
        ],
      ),
    );
  }

  Widget _controllers(BuildContext context, int quantity, int couponId){
    return Row(
      children: [
        InkWell(
          onTap: (){
            context.read<UserCubit>().removeCouponFromCart(couponId);
          },
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).splashColor
            ),
            child: Center(child: Text('-', style: TextStyle(color: Color(0xFF3D5BF6)),)),
          ),
        ),
        SizedBox(width: 5,),
        Text(quantity.toString(), style: TextStyle(color: Color(0xFF3D5BF6)),),
        SizedBox(width: 5,),
        InkWell(
          onTap: (){
            context.read<UserCubit>().addCouponToCart(couponId);
          },
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).splashColor
            ),
            child: Center(child: Text('+', style: TextStyle(color: Color(0xFF3D5BF6)),)),
          ),
        )
      ],
    );
  }
}