import 'dart:developer';

import 'package:blue/models/user_coupon/user_coupon.dart';
import 'package:blue/screens/details/ticket_details.dart';
import 'package:blue/screens/qr/coupon_qr_details.dart';
import 'package:blue/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../blocs/theme_cubit/theme_cubit.dart';
import '../../blocs/user_cubit/user_cubit.dart';
import '../../consts/k_icons.dart';
import '../../models/coupon/coupon.dart';
import '../error/error_image.dart';

class ActiveVerticalSmallCouponTile extends StatefulWidget {
  final UserCoupon coupon;

  const ActiveVerticalSmallCouponTile({required this.coupon,Key? key}) : super(key: key);

  @override
  State<ActiveVerticalSmallCouponTile> createState() => _ActiveVerticalSmallCouponTileState();
}

class _ActiveVerticalSmallCouponTileState extends State<ActiveVerticalSmallCouponTile> {
  late final String tag = 'active_vertical_small_${widget.coupon.createdAt.toString()}';
  late String _friend = context.watch<UserCubit>().state.friends.first.friend.username!;
  bool _openOptions = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(width: MediaQuery.of(context).size.width * 0.9, height: 165, margin: EdgeInsets.symmetric(horizontal: 15), decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.blueAccent.withOpacity(0.2), offset: Offset(-1,4), blurRadius: 18)], color: Theme.of(context).focusColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 132,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 10,),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => TicketDetails(coupon: widget.coupon.coupon, tag: tag)));
                            },
                            child: Container(width: MediaQuery.of(context).size.width * 0.35,
                              height: 132,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Hero(
                                      tag: tag,
                                      child: Image.network(widget.coupon.coupon.posterUrl, fit: BoxFit.cover,))),))),
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.coupon.coupon.name, maxLines: 3, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14, fontFamily: 'Outfit', color: context.watch<ThemeCubit>().state.theme == ThemeMode.light ? Color(0xFF222222) : Colors.white, fontWeight: FontWeight.w500),),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  CircleAvatar(radius: 18, backgroundColor: Colors.grey, backgroundImage: Image.network(widget.coupon.coupon.commerce.logoUrl, errorBuilder: (context,obj,stacktrace) => ErrorImage(),).image),
                                  SizedBox(width: 5,),
                                  Flexible(child: Text(widget.coupon.coupon.commerce.name, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w600, fontSize: 12),)),
                                ],
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  Text("\$${widget.coupon.coupon.price}", style: TextStyle(fontFamily: 'Poppins', fontSize: 14, color: context.watch<ThemeCubit>().state.theme == ThemeMode.light ? Color(0xFF3E4462) : Colors.white, fontWeight: FontWeight.w500),),
                                  Spacer(),
                                  InkWell(
                                      onTap: (){
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CouponQrDetails(coupon: widget.coupon,)));
                                      },
                                      child: SvgPicture.asset(KIcons.qr, color: Theme.of(context).highlightColor,))
                                ],
                              ),
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
                      Text(formatDate(widget.coupon.coupon.expDate) ,style: TextStyle(fontSize: 11, fontFamily: 'Outfit', fontWeight: FontWeight.w600),),
                      Spacer(),
                      GestureDetector(
                          onTap: (){
                            setState((){
                              _openOptions = !_openOptions;
                            });
                          },
                          child: SvgPicture.asset(KIcons.moreSquare, color: context.watch<ThemeCubit>().state.theme == ThemeMode.light ? Colors.grey.withOpacity(0.4) : Colors.white,))
                    ],
                  )),
              SizedBox(height: 8,),
            ],
          ),
        ),
        SizedBox(height: 10,),
        !_openOptions ? Container() : Center(
          child: Container(
              margin: EdgeInsets.only(bottom: 10),
              width: MediaQuery.of(context).size.width * 0.85,
              height: 60,
              child: OutlinedButton(onPressed: () async{
                _openTransferToFriendDialog(context);
              }, child: Text('Enviar a amigos', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),))),
        ),
      ],
    );
  }

  void _openTransferToFriendDialog(BuildContext context){
    showDialog(context: context, builder: (context){
      return StatefulBuilder(
        builder: (context,setState) => AlertDialog(
          actions: [
            Center(
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: 65,
                  child: ElevatedButton(onPressed: () async{
                    log(context.read<UserCubit>().state.activeCoupons.toString());
                    String receiverUid = context.read<UserCubit>().state.friends.firstWhere((element) => element.friend.username == _friend).receiverUid;
                    context.read<UserCubit>().sendCouponToFriend(widget.coupon.id, receiverUid);
                    Navigator.of(context).pop();
                    showInfoSnackBar(context, 'Sent');
                  }, child: Text('Enviar cupón', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),))),
            ),
          ],
          title: Text('Elegir amigo', style: TextStyle(fontFamily: 'Outfit'),),
          content: DropdownButton<String>(
            value: _friend,
            onChanged: (val){
              setState((){
                _friend = val!;
              });
            },
            items: List.generate(context.watch<UserCubit>().state.friends.length, (index) => DropdownMenuItem<String>(
                value: context.watch<UserCubit>().state.friends[index].friend.username!,
                child: Text(context.watch<UserCubit>().state.friends[index].friend.username!, style: TextStyle(fontFamily: 'Poppins'),)))
          ),
        ),
      );
    });
  }
}
