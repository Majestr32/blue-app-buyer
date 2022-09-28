import 'package:blue/blocs/user_cubit/user_cubit.dart';
import 'package:blue/consts/card_brands.dart';
import 'package:blue/consts/k_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentMethodTile extends StatelessWidget {
  final String paymentMethodId;
  final dynamic card;
  const PaymentMethodTile({required this.card, required this.paymentMethodId,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Row(children: [
        SvgPicture.asset(KIcons.tick, color: Colors.green,),
        Spacer(),
        CardBrands.fromString(card["brand"]),
        Spacer(flex: 2,),
        Text('⚫⚫⚫⚫', style: TextStyle(fontSize: 4, color: Colors.black, letterSpacing: 2),),
        SizedBox(width: 4,),
        Text(card["last4"], style: TextStyle(fontFamily: 'Outfit', color: Color(0xFF5D5FEF)),),
        Spacer(),
        InkWell(
            onTap: (){
              context.read<UserCubit>().removeCard(paymentMethodId);
            },
            child: SvgPicture.asset(KIcons.close, color: Colors.grey,)),
      ],),
    );
  }
}
