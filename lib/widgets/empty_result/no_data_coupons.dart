import 'package:blue/consts/k_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoDataCoupons extends StatelessWidget {
  const NoDataCoupons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(KIcons.search, width: 36, height: 36,),
        SizedBox(height: 10,),
        Text('Sin Datos Encontrados', style: TextStyle(color: Colors.grey),)
      ],
    );
  }
}
