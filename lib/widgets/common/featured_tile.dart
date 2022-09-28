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
    return Container(width: MediaQuery.of(context).size.width * 0.9, height: 160, decoration: BoxDecoration(
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
    return Container(width: MediaQuery.of(context).size.width * 0.9, height: 160, margin: EdgeInsets.symmetric(horizontal: 15), decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), offset: Offset(-1,4), blurRadius: 5)], color: Theme.of(context).focusColor),
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
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
                            child: Container(width: MediaQuery.of(context).size.width * 0.4,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Hero(
                                      tag: tag,
                                      child: Image.network(coupon.posterUrl, fit: BoxFit.cover,))),))),
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                          child: Column(
                            children: [
                              Row(children: [
                                SvgPicture.asset(KIcons.starFilled),
                                SizedBox(width: 2,),
                                Text(coupon.commerce.avgRating.toString(), style: TextStyle(color: Color(0xFFFFE500), fontFamily: 'Outfit', fontWeight: FontWeight.w700),),
                                SizedBox(width: 2,),
                                Text("(${coupon.commerce.reviewsCount})", style: TextStyle(color: Color(0xFF898A8D), fontFamily: 'Outfit'),),
                              ],),
                              Padding(
                                  padding: EdgeInsets.only(right: 30),
                                  child: Text(coupon.description, maxLines: 4, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14, fontFamily: 'Outfit', fontWeight: FontWeight.w300),)),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CompanyDetails(commerce: coupon.commerce)));
                        },
                        child: CircleAvatar(radius: 18, backgroundColor: Colors.grey, backgroundImage: Image.network(coupon.commerce.logoUrl, errorBuilder: (context,obj,stacktrace) => ErrorImage(),).image)),
                    SizedBox(width: 5,),
                    Expanded(child: Text(coupon.commerce.name, overflow: TextOverflow.ellipsis, maxLines: 2, style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w700, fontSize: 12),)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        coupon.discount == null ? Row(children: [
                          Text("\$${coupon.price.toStringAsFixed(2)}", style: TextStyle(fontFamily: 'Poppins', fontSize: 16, color: context.watch<ThemeCubit>().state.theme == ThemeMode.light ? Color(0xFF595CE6) : Colors.white, fontWeight: FontWeight.bold),),
                        ],) :
                        Row(
                          children: [
                            Text("\$${coupon.price.toStringAsFixed(2)}", style: TextStyle(fontFamily: 'Poppins', fontSize: 12, color: Colors.grey, decoration: TextDecoration.lineThrough, fontWeight: FontWeight.bold),),
                            SizedBox(width: 3,),
                            Text("\$${(coupon.price - coupon.price * coupon.discount! / 100).toStringAsFixed(2)}", style: TextStyle(fontFamily: 'Poppins', fontSize: 16, color: context.watch<ThemeCubit>().state.theme == ThemeMode.light ? Color(0xFF595CE6) : Colors.white, fontWeight: FontWeight.bold),),
                          ],),
                        coupon.discount == null ? Container() : Align(
                            alignment: Alignment.centerRight,
                            child: Text('${coupon.discount}% dicountos', style: TextStyle(fontFamily: 'Poppins', fontSize: 12, color: Color(0xFF41BF71)),)),
                      ],
                    ),
                    SizedBox(width: 10,)
                  ],),
              ),
              SizedBox(height: 5,)
            ],
          ),
          Align(alignment: Alignment.topRight, child: GestureDetector(
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
