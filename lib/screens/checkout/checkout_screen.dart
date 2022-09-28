import 'dart:math';

import 'package:blue/blocs/user_cubit/user_cubit.dart';
import 'package:blue/consts/k_icons.dart';
import 'package:blue/screens/operation_screens/order_completed.dart';
import 'package:blue/widgets/common/app_bar_with_arrow.dart';
import 'package:blue/widgets/common/cart_coupon_tile.dart';
import 'package:blue/widgets/common/payment_method_tile.dart';
import 'package:blue/widgets/common/select_payment_method_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

import '../../utils/utils.dart';
import '../profile_screens/add_payment_method_screen.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool _showItems = false;
  String _selectPaymentMethod = '';
  ProgressDialog? _loadingDialog;

  @override
  void initState() {
    super.initState();
    _loadingDialog = ProgressDialog(context: context);
    _selectPaymentMethod = context.read<UserCubit>().state.cards.isEmpty ? '' : context.read<UserCubit>().state.cards.first["id"];
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: (context,state){
        if(state.status == UserStateStatus.loading){
          _loadingDialog!.show(max: 2, hideValue: true, msg: 'Loading ...');
        } else{
          _loadingDialog!.close();
        }
        if(state.status == UserStateStatus.error){
          Navigator.of(context).pop();
          showErrorSnackBar(context, state.error!);
        }
        if(state.status == UserStateStatus.successOperation){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderCompleted()));
        }
      },
      child: Scaffold(
        appBar: AppBarWithArrow(title: 'CHECKOUT'),
        backgroundColor: Theme.of(context).backgroundColor,
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _dropdown(context),
                        SizedBox(height: 20,),
                        Center(
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text('Facturación', style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w500, fontSize: 18),)),
                        ),
                        SizedBox(height: 10,),
                        Center(
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Row(
                                children: [
                                  Text('Total:', style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w500, fontSize: 14),),
                                  Spacer(),
                                  Text('\$${context.watch<UserCubit>().state.cartSum}', style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w500, fontSize: 16),),
                                ],
                              )),
                        ),
                        SizedBox(height: 10,),
                        Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                                separatorBuilder: (context,i){
                                  return Divider();
                                },
                                shrinkWrap: true,
                                itemCount: context.watch<UserCubit>().state.cards.length,
                                itemBuilder: (context, i){
                                  return SelectPaymentMethodTile(
                                    onRadioChanged: (val){
                                      setState((){
                                        _selectPaymentMethod = val!;
                                      });
                                    },
                                    card: context.watch<UserCubit>().state.cards[i]["card"], paymentMethodId: context.watch<UserCubit>().state.cards[i]["id"], radioValue: _selectPaymentMethod,);
                                }),
                          ),
                        ),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddPaymentMethodScreen()));
                                },
                                child: Text('+Agregar método de pago', style: TextStyle(color: Colors.green, fontFamily: 'Outfit'),))),)
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 120,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(KIcons.shieldTick),
                            SizedBox(width: 5,),
                            Flexible(child: Text('  Todas las transacciones son rápidas y seguras, al continuar usted acepta nuestros terminos y condiciones ', maxLines: 3, style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w400, fontSize: 12, height: 1.5, color: Color(0xFF97999B)),))
                          ],
                        ),
                        SizedBox(height: 10,),
                        SlideAction(
                          sliderButtonYOffset: -8,
                          sliderButtonIcon: SvgPicture.asset(KIcons.arrowRight, color: Colors.white,),
                          borderRadius: 24,
                          sliderButtonIconPadding: 23,
                          height: 60,
                          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300, fontFamily: 'Outfit', color: Colors.black),
                          text: 'Deslizar para continuar',
                          innerColor: const Color(0xFF3D5BF6),
                          outerColor: const Color(0xFFDEDEDE),
                          onSubmit: (){
                            context.read<UserCubit>().checkout(_selectPaymentMethod);
                          },
                        )
                      ],
                    )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _dropdown(BuildContext context){
    return Container(
      width: double.infinity,
      color: Theme.of(context).splashColor,
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Mostrar resumen del pedido', style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w500),),
              InkWell(
                onTap: (){
                  setState((){
                    _showItems = !_showItems;
                  });
                },
                child: Container(
                  width: 16,
                  height: 16,
                  child: AnimatedRotation(
                      turns: _showItems ? 0.25 : 0.75,
                      duration: Duration(milliseconds: 300),
                      child: SvgPicture.asset(KIcons.directionLeft, color: Theme.of(context).highlightColor,)),
                ),
              )
            ],
          ),
          !_showItems ? Container() : ListView.builder(
            physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: context.watch<UserCubit>().state.cartCoupons.length,
              itemBuilder: (context,i) {
            return Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: CartCouponTile(coupon: context.watch<UserCubit>().state.cartCoupons[i], withCounter: false,));
          })
        ],
      ),
    );
  }
}
