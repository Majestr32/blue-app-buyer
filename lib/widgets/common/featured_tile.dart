import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../blocs/theme_cubit/theme_cubit.dart';
import '../../blocs/user_cubit/user_cubit.dart';
import '../../consts/k_icons.dart';
import '../../models/coupon/coupon.dart';
import '../../screens/details/company_details.dart';
import '../../screens/details/ticket_details.dart';
import '../error/error_image.dart';



class FakeFeaturedTile extends StatelessWidget {
  const FakeFeaturedTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(width: MediaQuery.of(context).size.width * 0.9, height: 140, decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: Colors.grey,
    ));
  }
}

class FeaturedTile extends StatelessWidget {
  final Coupon coupon;
  late final tag = 'featured_tile_${coupon.id}';
  FeaturedTile({required this.coupon,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(width: MediaQuery.of(context).size.width * 0.9, margin: EdgeInsets.symmetric(horizontal: 15), decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.6), offset: Offset(-1,4), blurRadius: 5)], color: Theme.of(context).focusColor),
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 140,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 10,),
                    Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 5),
                        child: InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => TicketDetails(coupon: coupon, tag: tag,)));
                            },
                            child: Container(width: MediaQuery.of(context).size.width * 0.45,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Hero(
                                      tag: tag,
                                      child: Image.network(coupon.posterUrls.first, fit: BoxFit.cover,))),))),
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.only(top: 15, left: 10, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                SvgPicture.asset(KIcons.starFilled),
                                SizedBox(width: 2,),
                                Text(coupon.avgRating.toString(), style: TextStyle(color: Color(0xFFFFE500), fontFamily: 'Outfit', fontWeight: FontWeight.w700),),
                                SizedBox(width: 2,),
                                Text("(${coupon.reviewsCount})", style: TextStyle(color: Color(0xFF898A8D), fontFamily: 'Outfit'),),
                              ],),
                              SizedBox(height: 15,),
                              GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => TicketDetails(coupon: coupon, tag: tag,)));
                                },
                                child: Padding(
                                    padding: EdgeInsets.only(right: 30),
                                    child: Text(coupon.name, maxLines: 4, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14, fontFamily: 'Outfit', fontWeight: FontWeight.w600),)),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => CompanyDetails(commerce: coupon.commerce)));
                          },
                          child: CircleAvatar(radius: 16, backgroundColor: Colors.grey, backgroundImage: Image.network(coupon.commerce.logoUrl, errorBuilder: (context,obj,stacktrace) => ErrorImage(),).image)),
                      SizedBox(width: 5,),
                      Expanded(child: GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => CompanyDetails(commerce: coupon.commerce)));
                          },
                          child: Text(coupon.commerce.name, overflow: TextOverflow.ellipsis, maxLines: 2, style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w400, fontSize: 12),))),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          coupon.discount == null ? Row(
                            children: [
                            Text("\$${coupon.price}", style: TextStyle(fontFamily: 'Poppins', fontSize: 14, color: context.watch<ThemeCubit>().state.theme == ThemeMode.light ? Color(0xFF595CE6) : Colors.white, fontWeight: FontWeight.bold),),
                          ],) :
                          Row(
                            children: [
                              Text("\$${coupon.price}", style: TextStyle(fontFamily: 'Poppins', fontSize: 14, color: Colors.grey, decoration: TextDecoration.lineThrough, fontWeight: FontWeight.bold),),
                              SizedBox(width: 3,),
                              Text("\$${coupon.priceWithDiscount}", style: TextStyle(fontFamily: 'Poppins', fontSize: 14, color: context.watch<ThemeCubit>().state.theme == ThemeMode.light ? Color(0xFF595CE6) : Colors.white, fontWeight: FontWeight.bold),),
                            ],),
                          coupon.discount == null ? Container() : Align(
                              alignment: Alignment.centerRight,
                              child: Text('${coupon.discount}% descuento', style: TextStyle(fontFamily: 'Poppins', fontSize: 12, color: Color(0xFF41BF71)),)),
                        ],
                      ),
                      SizedBox(width: 10,)
                    ],),
                ),
              ),
              SizedBox(height: 10,)
            ],
          ),
          Align(alignment: Alignment.topRight, child: GestureDetector(
            onTap: (){
              context.read<UserCubit>().toggleFav(coupon.id);
            },
            child: Container(
                margin: EdgeInsets.only(top: 15, right: 15),
                child: context.watch<UserCubit>().state.isLiked(coupon.id) ? SvgPicture.asset(KIcons.boldHeart, color: Colors.red,) : SvgPicture.asset(KIcons.heart, color: Colors.grey,)),
          ),)
        ],
      ),
    );
  }
}
