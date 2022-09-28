import 'package:blue/models/coupon/coupon.dart';
import 'package:blue/models/user_coupon/user_coupon.dart';
import 'package:blue/widgets/error/error_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../consts/k_icons.dart';
import '../../screens/details/ticket_details.dart';

class FriendVerticalSmallCouponTile extends StatelessWidget {
  final UserCoupon coupon;
  late final String tag = 'friend_vertical_small_coupon_${coupon.id}';
  FriendVerticalSmallCouponTile({required this.coupon,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(width: MediaQuery.of(context).size.width * 0.9, height: 200, margin: EdgeInsets.symmetric(horizontal: 15), decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), offset: Offset(-1,4), blurRadius: 5)], color: Theme.of(context).focusColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 160,
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
                        child: Container(width: MediaQuery.of(context).size.width * 0.3,
                          height: 160,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Hero(
                                  tag: tag,
                                  child: Image.network(coupon.coupon.posterUrl, fit: BoxFit.cover,))),))),
                Expanded(
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(coupon.coupon.name, maxLines: 3, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14, fontFamily: 'Outfit', fontWeight: FontWeight.w600),),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              CircleAvatar(radius: 18, backgroundColor: Colors.grey, backgroundImage: Image.network(coupon.coupon.commerce.logoUrl, errorBuilder: (context,obj,stacktrace) => ErrorImage(),).image),
                              SizedBox(width: 5,),
                              Flexible(child: Text(coupon.coupon.commerce.name, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w700, fontSize: 12),)),
                            ],
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Text("\$${coupon.coupon.price}", style: TextStyle(fontFamily: 'Poppins', fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold),),
                              Spacer(),
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Color(0xFFCAFFD9)
                                  ),
                                  padding: EdgeInsets.all(8),
                                  child: Text("TRANSFERIDO A:", style: TextStyle(fontFamily: 'Poppins', fontSize: 10, color: Color(0xFF25B700), fontWeight: FontWeight.bold),)),
                            ],
                          ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Text("${coupon.sentTo}", style: TextStyle(fontFamily: 'Poppins', fontSize: 12, color: Color(0xFFB5B5B5), fontWeight: FontWeight.w400),)),
                        ],
                      )),
                ),
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(coupon.coupon.expDate.toString() ,style: TextStyle(fontSize: 10, fontFamily: 'Outfit', fontWeight: FontWeight.w700),),
                  Spacer(),
                  SvgPicture.asset(KIcons.moreSquare)
                ],
              )),
        ],
      ),
    );
  }
}
