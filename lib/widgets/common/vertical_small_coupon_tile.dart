import 'package:blue/blocs/user_cubit/user_cubit.dart';
import 'package:blue/models/user_fav/user_fav.dart';
import 'package:blue/screens/details/ticket_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../blocs/theme_cubit/theme_cubit.dart';
import '../../consts/k_icons.dart';
import '../../models/coupon/coupon.dart';
import '../../screens/details/company_details.dart';

class VerticalSmallCouponTile extends StatelessWidget {
  final Coupon coupon;
  final bool withHeart;
  late final tag = 'vertical_small_coupon_${coupon.id}';
  VerticalSmallCouponTile({required this.coupon, this.withHeart = true,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(width: MediaQuery.of(context).size.width * 0.9, height: 135, decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.6), offset: Offset(-1,4), blurRadius: 5)], color: Theme.of(context).focusColor),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 12,),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => TicketDetails(coupon: coupon, tag: tag,)));
                      },
                      child: Container(width: MediaQuery.of(context).size.width * 0.33,
                        height: 120,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Hero(
                                tag: tag,
                                child: Image.network(coupon.posterUrls.first, fit: BoxFit.cover,))),))),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => TicketDetails(coupon: coupon, tag: tag,)));
                        },
                        child: Padding(
                            padding: EdgeInsets.only(right: 30),
                            child: Text(coupon.name, maxLines: 3, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14, fontFamily: 'Outfit', fontWeight: FontWeight.w400),)),
                      ),
                      Spacer(),
                      Row(
                        crossAxisAlignment: withHeart ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 3),
                            child: Row(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(bottom: withHeart ? 3 : 0, top: withHeart ? 3 : 0),
                                    child: SvgPicture.asset(KIcons.starFilled)),
                                SizedBox(width: 2,),
                                Text(coupon.avgRating.toString(), style: TextStyle(color: Color(0xFFFFE500), fontFamily: 'Outfit', fontWeight: FontWeight.w700),),
                                SizedBox(width: 2,),
                                Text("(${coupon.reviewsCount})", style: TextStyle(color: Color(0xFF898A8D), fontFamily: 'Outfit'),),
                              ],
                            ),
                          ),
                          Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                            coupon.discount == null ? Row(children: [
                              Text("\$${coupon.price}", style: TextStyle(fontFamily: 'Poppins', fontSize: 15, color: context.watch<ThemeCubit>().state.theme == ThemeMode.light ? Color(0xFF595CE6) : Colors.white, fontWeight: FontWeight.bold),),
                            ],) :
                            Row(
                              children: [
                                Text("\$${coupon.price}", style: TextStyle(fontFamily: 'Poppins', fontSize: 15, color: Colors.grey, decoration: TextDecoration.lineThrough, fontWeight: FontWeight.bold),),
                                SizedBox(width: 3,),
                                Text("\$${coupon.priceWithDiscount}", style: TextStyle(fontFamily: 'Poppins', fontSize: 15, color: context.watch<ThemeCubit>().state.theme == ThemeMode.light ? Color(0xFF595CE6) : Colors.white, fontWeight: FontWeight.bold),),
                              ],),
                            coupon.discount == null ? Container() : Align(
                                alignment: Alignment.centerRight,
                                child: Text('${coupon.discount}% descuento', style: TextStyle(fontFamily: 'Poppins', fontSize: 12, color: Color(0xFF41BF71)),)),
                          ],
                          ),
                          ],)
                        ],
                      )),
              ),
                  ],
                ),
          !withHeart ? Container() : Align(alignment: Alignment.topRight, child: GestureDetector(
            onTap: (){
              context.read<UserCubit>().toggleFav(coupon.id);
            },
            child: Container(
                margin: EdgeInsets.only(top: 15, right: 15),
                child: context.watch<UserCubit>().state.isLiked(coupon.id) ? SvgPicture.asset(KIcons.boldHeart, color: Colors.red,) : SvgPicture.asset(KIcons.heart)),
          ),)
        ],
      ),
          );
  }
}
