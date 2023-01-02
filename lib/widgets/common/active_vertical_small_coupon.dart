import 'dart:developer';

import 'package:blue/models/user_coupon/user_coupon.dart';
import 'package:blue/screens/details/active_coupon_details.dart';
import 'package:blue/screens/details/company_details.dart';
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
  final bool isDetailsScreen;
  final UserCoupon coupon;

  const ActiveVerticalSmallCouponTile({required this.coupon,Key? key, this.isDetailsScreen = false}) : super(key: key);

  @override
  State<ActiveVerticalSmallCouponTile> createState() => _ActiveVerticalSmallCouponTileState();
}

class _ActiveVerticalSmallCouponTileState extends State<ActiveVerticalSmallCouponTile> {
  late final String tag = 'active_vertical_small_${widget.coupon.createdAt.toString()}';
  late String _friend = context.watch<UserCubit>().state.friends.first.friend.username!;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(widget.isDetailsScreen){
          return;
        }
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ActiveCouponDetails(userCoupon: widget.coupon)));
      },
      child: Container(width: MediaQuery.of(context).size.width * 0.9, height: 180, margin: EdgeInsets.symmetric(horizontal: 15), decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.blueAccent.withOpacity(0.2), offset: Offset(-1,4), blurRadius: 18)], color: Theme.of(context).focusColor),
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
                            if(widget.isDetailsScreen){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => TicketDetails(coupon: widget.coupon.coupon, tag: tag)));
                            }else{
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ActiveCouponDetails(userCoupon: widget.coupon)));
                            }
                          },
                          child: Container(width: MediaQuery.of(context).size.width * 0.35,
                            height: 132,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Hero(
                                    tag: tag,
                                    child: Image.network(widget.coupon.coupon.posterUrls.first, fit: BoxFit.cover,))),))),
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.coupon.coupon.name, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14, fontFamily: 'Outfit', color: context.watch<ThemeCubit>().state.theme == ThemeMode.light ? Color(0xFF222222) : Colors.white, fontWeight: FontWeight.w400),),
                            SizedBox(height: 10,),
                            GestureDetector(
                              onTap: (){
                                if(widget.isDetailsScreen){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => CompanyDetails(commerce: widget.coupon.coupon.commerce)));
                                }else{
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ActiveCouponDetails(userCoupon: widget.coupon)));
                                }
                              },
                              child: Row(
                                children: [
                                  CircleAvatar(radius: 15, backgroundColor: Colors.grey, backgroundImage: Image.network(widget.coupon.coupon.commerce.logoUrl, errorBuilder: (context,obj,stacktrace) => ErrorImage(),).image),
                                  SizedBox(width: 5,),
                                  Flexible(child: Text(widget.coupon.coupon.commerce.name, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w500, fontSize: 10),)),
                                ],
                              ),
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Text("\$${widget.coupon.coupon.price}", style: TextStyle(fontFamily: 'Poppins', fontSize: 14, color: context.watch<ThemeCubit>().state.theme == ThemeMode.light ? Color(0xFF3E4462) : Colors.white, fontWeight: FontWeight.w500),),
                                Spacer(),
                                widget.coupon.sentToName == null ? Container() : Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            color: Color(0xFF5D5FEF).withOpacity(0.08)
                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 6,vertical: 5),
                                        child: Text("TRANSFERIDO POR:".toUpperCase(), style: TextStyle(fontFamily: 'Poppins', fontSize: 8, color: Color(0xFF5D5FEF), fontWeight: FontWeight.bold),)),
                                    SizedBox(
                                        width: 80,
                                        child: Text(widget.coupon.sentFromName!, textAlign: TextAlign.right, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 10, fontFamily: 'Poppins', fontWeight: FontWeight.w300,color: context.watch<ThemeCubit>().state.theme == ThemeMode.light ? Colors.grey.withOpacity(0.4) : Colors.white,),))
                                  ],
                                ),
                                SizedBox(width: 10,),
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
                          if(widget.coupon.fromFriend){
                            StandardSnackBar.instance.showInfoSnackBar(context, 'No puedes enviar el cupón que te regalaron');
                            return;
                          }
                          showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(16))
                              ),
                              context: context, builder: (context){
                            return ListTile(
                              leading: SvgPicture.asset(KIcons.user),
                              title: Text('Enviar a amigos', style: TextStyle(fontFamily: 'Outfit'),),
                              onTap: (){
                                _openTransferToFriendDialog();
                              },
                            );
                          });
                        },
                        child: SvgPicture.asset(KIcons.moreSquare, color: context.watch<ThemeCubit>().state.theme == ThemeMode.light ? Colors.grey.withOpacity(0.4) : Colors.white,))
                  ],
                )),
            SizedBox(height: 8,),
          ],
        ),
      ),
    );
  }

  void _showConfirmationScreen(VoidCallback onSuccess){
    showDialog(context: context, builder: (context){
      return AlertDialog(title: Text('¿Estás seguro de que quieres transferir el cupón?'),
      actions: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red
            ),
            onPressed: (){Navigator.of(context)..pop()..pop()..pop();}, child: Text('NO')),
        SizedBox(width: 10,),
        ElevatedButton(onPressed: (){
          onSuccess.call();
          Navigator.of(context)..pop()..pop()..pop();}, child: Text('SI')),
      ],);
    });
  }

  void _openTransferToFriendDialog(){
    showDialog(context: context, builder: (context){
      return StatefulBuilder(
        builder: (context,setState) => AlertDialog(
          actions: [
            Center(
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: 65,
                  child: ElevatedButton(onPressed: () async{
                    _showConfirmationScreen(
                        (){
                          String receiverUid = context.read<UserCubit>().state.friends.firstWhere((element) => element.friend.username == _friend).receiverUid;
                          context.read<UserCubit>().sendCouponToFriend(widget.coupon.id, receiverUid);
                          StandardSnackBar.instance.showInfoSnackBar(context, 'Enviado');
                        }
                    );
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
