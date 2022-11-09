import 'package:blue/blocs/theme_cubit/theme_cubit.dart';
import 'package:blue/consts/k_icons.dart';
import 'package:blue/models/coupon/coupon.dart';
import 'package:blue/screens/details/company_details.dart';
import 'package:blue/screens/details/ticket_details.dart';
import 'package:blue/widgets/error/error_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../blocs/user_cubit/user_cubit.dart';

class FakeHorizontalCouponTile extends StatelessWidget {
  const FakeHorizontalCouponTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(width: 220, margin: EdgeInsets.symmetric(horizontal: 15), decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(24)),);
  }
}

class HorizontalCouponTile extends StatelessWidget {
  final Coupon coupon;
  late var tag = 'horizontal_coupon_${coupon.id}';
  HorizontalCouponTile({required this.coupon,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220, margin: EdgeInsets.symmetric(horizontal: 10), decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), boxShadow: [
        BoxShadow(color: Colors.grey.withOpacity(0.6), offset: Offset(0,4), blurRadius: 5)
    ], color: Theme.of(context).focusColor),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => TicketDetails(coupon: coupon, tag: tag,)));
            },
            child: Container(
                width: 220,
                height: 130,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                child: Hero(
                  tag: tag,
                  child: Image.network(
                      fit: BoxFit.cover,
                      coupon.posterUrl, errorBuilder: (context,obj,stacktrace) => ErrorImage()),
                ),
              )),),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CompanyDetails(commerce: coupon.commerce)));
                      },
                      child: CircleAvatar(radius: 12, backgroundImage: Image.network(coupon.commerce.logoUrl, errorBuilder: (context,obj,stacktrace) => ErrorImage(),).image, backgroundColor: Colors.grey,),),
                    SizedBox(width: 4,),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CompanyDetails(commerce: coupon.commerce)));
                      },
                      child: SizedBox(
                          width: 130,
                          child: Text(coupon.commerce.name, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 10, fontFamily: 'Poppins'),)),
                    ),
                    Spacer(),
                    GestureDetector(
                        onTap: (){
                          context.read<UserCubit>().toggleFav(coupon.id);
                        },
                        child: context.watch<UserCubit>().state.isLiked(coupon.id) ? SvgPicture.asset(KIcons.boldHeart, color: Colors.red,) : SvgPicture.asset(KIcons.heart, color: Colors.grey,))
                  ],
                ),
                SizedBox(height: 15,),
                GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => TicketDetails(coupon: coupon, tag: tag,)));
                    },
                    child: Text(coupon.name, maxLines: 3, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14, fontFamily: 'Outfit', fontWeight: FontWeight.w400),)),
                Spacer(),
                SizedBox(height: 5,),
                if (coupon.discount == null) Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 3),
                      child: SvgPicture.asset(KIcons.starFilled),
                    ),
                    SizedBox(width: 2,),
                    Text(coupon.avgRating.toString(), style: TextStyle(color: Color(0xFFFFE500), fontFamily: 'Outfit', fontWeight: FontWeight.w700),),
                    SizedBox(width: 2,),
                    Text("(${coupon.reviewsCount})", style: TextStyle(color: Color(0xFF898A8D), fontFamily: 'Outfit'),),
                    Spacer(),
                    Text("\$${coupon.price}", style: TextStyle(fontFamily: 'Poppins', fontSize: 14, color: context.watch<ThemeCubit>().state.theme == ThemeMode.light ? Color(0xFF595CE6) : Colors.white, fontWeight: FontWeight.bold),),
                  ],) else
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 3),
                        child: SvgPicture.asset(KIcons.starFilled),
                      ),
                      SizedBox(width: 2,),
                      Text(coupon.avgRating.toString(), style: TextStyle(color: Color(0xFFFFE500), fontFamily: 'Outfit', fontWeight: FontWeight.w700),),
                      SizedBox(width: 2,),
                      Text("(${coupon.reviewsCount})", style: TextStyle(color: Color(0xFF898A8D), fontFamily: 'Outfit'),),
                      Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                            Text("\$${coupon.price}", style: TextStyle(fontFamily: 'Poppins', fontSize: 14, color: Colors.grey, decoration: TextDecoration.lineThrough, fontWeight: FontWeight.bold),),
                            SizedBox(width: 3,),
                            Text("\$${coupon.priceWithDiscount}", style: TextStyle(fontFamily: 'Poppins', fontSize: 14, color: context.watch<ThemeCubit>().state.theme == ThemeMode.light ? Color(0xFF595CE6) : Colors.white, fontWeight: FontWeight.bold),),
                          ],),
                          coupon.discount == null ? Container() : Text('${coupon.discount}% descuento', style: TextStyle(fontFamily: 'Poppins', fontSize: 12, color: Color(0xFF41BF71)),),
                        ],
                      ),
                    ],),
                SizedBox(height: 20,)
              ],
            ),
          ),
        ),
      ],
    ),);
  }
}
