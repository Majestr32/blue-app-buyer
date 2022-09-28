import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../blocs/user_cubit/user_cubit.dart';
import '../../consts/card_brands.dart';
import '../../consts/k_icons.dart';

class SelectPaymentMethodTile extends StatefulWidget {
  final String paymentMethodId;
  String radioValue;
  final dynamic card;
  final Function(String?) onRadioChanged;
  SelectPaymentMethodTile({required this.card, required this.paymentMethodId, required this.onRadioChanged, required this.radioValue,Key? key}) : super(key: key);

  @override
  State<SelectPaymentMethodTile> createState() => _SelectPaymentMethodTileState();
}

class _SelectPaymentMethodTileState extends State<SelectPaymentMethodTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Row(children: [
        Radio(value: widget.paymentMethodId, groupValue: widget.radioValue, onChanged: widget.onRadioChanged),
        Spacer(),
        CardBrands.fromString(widget.card["brand"]),
        Spacer(flex: 2,),
        Text('⚫⚫⚫⚫', style: TextStyle(fontSize: 4, color: Colors.black, letterSpacing: 2),),
        SizedBox(width: 4,),
        Text(widget.card["last4"], style: TextStyle(fontFamily: 'Outfit', color: Color(0xFF5D5FEF)),),
        Spacer(),
        InkWell(
            onTap: (){
              context.read<UserCubit>().removeCard(widget.paymentMethodId);
            },
            child: SvgPicture.asset(KIcons.close, color: Colors.grey,)),
      ],),
    );
  }
}
