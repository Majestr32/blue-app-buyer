import 'package:blue/blocs/theme_cubit/theme_cubit.dart';
import 'package:blue/consts/k_icons.dart';
import 'package:blue/models/coupon/coupon.dart';
import 'package:blue/screens/details/company_details.dart';
import 'package:blue/screens/details/ticket_details.dart';
import 'package:blue/widgets/error/error_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

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
        BoxShadow(color: Colors.grey.withOpacity(0.4), offset: Offset(0,4), blurRadius: 5)
    ], color: Theme.of(context).focusColor),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15,),
          InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => TicketDetails(coupon: coupon, tag: tag,)));
              },
              child: Container(
                  width: 220,
                  height: 130,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Hero(
                    tag: tag,
                    child: Image.network(
                        fit: BoxFit.cover,
                        coupon.posterUrl, errorBuilder: (context,obj,stacktrace) => ErrorImage()),
                  ),
                )),),
          SizedBox(height: 10,),
          Row(
            children: [
              SvgPicture.asset(KIcons.starFilled),
              SizedBox(width: 2,),
              Text(coupon.avgRating.toString(), style: TextStyle(color: Color(0xFFFFE500), fontFamily: 'Outfit', fontWeight: FontWeight.w700),),
              SizedBox(width: 2,),
              Text("(${coupon.reviewsCount})", style: TextStyle(color: Color(0xFF898A8D), fontFamily: 'Outfit'),),
            ],
          ),
          SizedBox(height: 5,),
          Text(coupon.description, maxLines: 4, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14, fontFamily: 'Outfit', fontWeight: FontWeight.w300),),
          SizedBox(height: 5,),
          coupon.discount == null ? Row(children: [
            InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => CompanyDetails(commerce: coupon.commerce)));
                },
                child: CircleAvatar(radius: 16, backgroundImage: Image.network(coupon.commerce.logoUrl, errorBuilder: (context,obj,stacktrace) => ErrorImage(),).image, backgroundColor: Colors.grey,)),
            SizedBox(width: 2,),
            SizedBox(
                width: 70,
                child: Text(coupon.commerce.name.toString(), maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12, fontFamily: 'Poppins'),)),
            Spacer(),
            Text("\$${coupon.price}", style: TextStyle(fontFamily: 'Poppins', fontSize: 16, color: context.watch<ThemeCubit>().state.theme == ThemeMode.light ? Color(0xFF595CE6) : Colors.white, fontWeight: FontWeight.bold),),
          ],) :
          Row(
            children: [
            InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => CompanyDetails(commerce: coupon.commerce)));
                },
                child: CircleAvatar(radius: 16, backgroundImage: Image.network(coupon.commerce.logoUrl, errorBuilder: (context,obj,stacktrace) => ErrorImage(),).image, backgroundColor: Colors.grey,),),
            SizedBox(width: 2,),
            SizedBox(
                width: 70,
                child: Text(coupon.commerce.name.toString(), maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12, fontFamily: 'Poppins'),)),
            Spacer(),
            Text("\$${coupon.price}", style: TextStyle(fontFamily: 'Poppins', fontSize: 12, color: Colors.grey, decoration: TextDecoration.lineThrough, fontWeight: FontWeight.bold),),
            SizedBox(width: 3,),
            Text("\$${(coupon.price - coupon.price * coupon.discount! / 100).roundToDouble()}", style: TextStyle(fontFamily: 'Poppins', fontSize: 16, color: context.watch<ThemeCubit>().state.theme == ThemeMode.light ? Color(0xFF595CE6) : Colors.white, fontWeight: FontWeight.bold),),
          ],),
          coupon.discount == null ? Container() : Align(
              alignment: Alignment.centerRight,
              child: Text('${coupon.discount}% dicountos', style: TextStyle(fontFamily: 'Poppins', fontSize: 12, color: Color(0xFF41BF71)),))
        ],
      ),
    ),);
  }
}
