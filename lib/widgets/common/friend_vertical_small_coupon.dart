import 'package:blue/blocs/user_cubit/user_cubit.dart';
import 'package:blue/models/coupon/coupon.dart';
import 'package:blue/models/user_coupon/user_coupon.dart';
import 'package:blue/widgets/error/error_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../blocs/theme_cubit/theme_cubit.dart';
import '../../consts/k_icons.dart';
import '../../screens/details/company_details.dart';
import '../../screens/details/ticket_details.dart';
import '../../utils/utils.dart';

class FriendVerticalSmallCouponTile extends StatelessWidget {
  final UserCoupon coupon;
  late final String tag = 'friend_vertical_small_coupon_${coupon.id}';
  FriendVerticalSmallCouponTile({required this.coupon,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(width: MediaQuery.of(context).size.width * 0.9, height: 180, margin: EdgeInsets.symmetric(horizontal: 15), decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.blueAccent.withOpacity(0.2), offset: Offset(-1,4), blurRadius: 18)], color: Theme.of(context).focusColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 146,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 10,),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => TicketDetails(coupon: coupon.coupon, tag: tag)));
                        },
                        child: Container(width: MediaQuery.of(context).size.width * 0.35,
                          height: 132,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Hero(
                                  tag: tag,
                                  child: Image.network(coupon.coupon.posterUrls.first, fit: BoxFit.cover,))),))),
                Expanded(
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(coupon.coupon.name, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14, fontFamily: 'Outfit', color: context.watch<ThemeCubit>().state.theme == ThemeMode.light ? Color(0xFF222222) : Colors.white, fontWeight: FontWeight.w500),),
                          SizedBox(height: 10,),
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CompanyDetails(commerce: coupon.coupon.commerce)));
                            },
                            child: Row(
                              children: [
                                CircleAvatar(radius: 15, backgroundColor: Colors.grey, backgroundImage: Image.network(coupon.coupon.commerce.logoUrl, errorBuilder: (context,obj,stacktrace) => ErrorImage(),).image),
                                SizedBox(width: 5,),
                                Flexible(child: Text(coupon.coupon.commerce.name, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w500, fontSize: 10),)),
                              ],
                            ),
                          ),
                          Spacer(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("\$${coupon.coupon.price}", style: TextStyle(fontFamily: 'Poppins', fontSize: 14, color: context.watch<ThemeCubit>().state.theme == ThemeMode.light ? Color(0xFF3E4462) : Colors.white, fontWeight: FontWeight.w500),),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          color: Color(0xFF5D5FEF).withOpacity(0.08)
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 6,vertical: 5),
                                      child: Text("TRANSFERIDO A:".toUpperCase(), style: TextStyle(fontFamily: 'Poppins', fontSize: 7, color: Color(0xFF5D5FEF), fontWeight: FontWeight.bold),)),
                                  SizedBox(
                                      width: 120,
                                      child: Text(coupon.sentToName!, textAlign: TextAlign.right, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 10, fontFamily: 'Poppins', fontWeight: FontWeight.w300,color: context.watch<ThemeCubit>().state.theme == ThemeMode.light ? Colors.grey.withOpacity(0.4) : Colors.white,),))
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 3,),
                        ],
                      )),
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(formatDate(coupon.coupon.expDate) ,style: TextStyle(fontSize: 11, fontFamily: 'Outfit', fontWeight: FontWeight.w600),),
                  Spacer(),
                  SvgPicture.asset(KIcons.moreSquare, color: context.watch<ThemeCubit>().state.theme == ThemeMode.light ? Colors.grey.withOpacity(0.4) : Colors.white,)
                ],
              )),
          SizedBox(height: 8,)
        ],
      ),
    );
  }
}
