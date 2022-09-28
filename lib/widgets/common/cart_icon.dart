import 'package:blue/screens/cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../consts/k_icons.dart';

class CartIcon extends StatelessWidget {
  final int itemsCount;
  const CartIcon({required this.itemsCount,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return itemsCount == 0 ? InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartScreen()));
        },
        child: SvgPicture.asset(KIcons.buy, color: Colors.white, width: 32, height: 32,)) : Stack(
      children: [
        InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartScreen()));
            },
            child: SvgPicture.asset(KIcons.buy, color: Colors.white, width: 32, height: 32,)),
        itemsCount == 0 ? Container() : Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(radius: 6, backgroundColor: Color(0xFFF9A137), child: Center(child: Text(itemsCount.toString(), style: TextStyle(fontSize: 7, color: Colors.white, fontWeight: FontWeight.w600),)),))
      ],
    );
  }
}
