import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../consts/k_icons.dart';
import '../../models/coupon/coupon.dart';
import '../../screens/details/ticket_details.dart';
import '../error/error_image.dart';

class UsedVerticalSmallCouponTile extends StatelessWidget {
  final Coupon coupon;
  late final String tag = 'used_vertical_small_coupon_${coupon.id}';
  UsedVerticalSmallCouponTile({required this.coupon,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(width: MediaQuery.of(context).size.width * 0.9, height: 180, margin: EdgeInsets.symmetric(horizontal: 15), decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), offset: Offset(-1,4), blurRadius: 5)], color: Theme.of(context).focusColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 140,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 10,),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => TicketDetails(coupon: coupon, tag: tag)));
                        },
                        child: Container(width: MediaQuery.of(context).size.width * 0.3,
                          height: 160,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Hero(
                                  tag: tag,
                                  child: Image.network(coupon.posterUrl, fit: BoxFit.cover,))),))),
                Expanded(
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(coupon.name, maxLines: 3, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14, fontFamily: 'Outfit', fontWeight: FontWeight.w600),),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              CircleAvatar(radius: 18, backgroundColor: Colors.grey, backgroundImage: Image.network(coupon.commerce.logoUrl, errorBuilder: (context,obj,stacktrace) => ErrorImage(),).image),
                              SizedBox(width: 5,),
                              Flexible(child: Text(coupon.commerce.name, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w700, fontSize: 12),)),
                            ],
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Text("\$${coupon.price}", style: TextStyle(fontFamily: 'Poppins', fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold),),
                              Spacer(),
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Color(0xFFCAFFD9)
                                  ),
                                  padding: EdgeInsets.all(16),
                                  child: Text("Usó", style: TextStyle(fontFamily: 'Poppins', fontSize: 14, color: Color(0xFF25B700), fontWeight: FontWeight.bold),)),
                            ],
                          ),
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
                  Text(coupon.expDate.toString() ,style: TextStyle(fontSize: 10, fontFamily: 'Outfit', fontWeight: FontWeight.w700),),
                  Spacer(),
                  SvgPicture.asset(KIcons.moreSquare)
                ],
              )),
        ],
      ),
    );
  }
}
