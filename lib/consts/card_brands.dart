import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardBrands{
  static Widget fromString(String val){
    switch(val){
      case 'mastercard':
        return Container(height: 32, child: SvgPicture.asset('assets/payment_logos/mastercard.svg'),);
      case 'visa':
        return Container(height: 16, child: Image.asset("assets/payment_logos/visa.png"));
      case 'unionpay':
        return Container(height: 32, child: Image.asset("assets/payment_logos/unionpay.png"));
      case 'amex':
        return Container(height: 64, child: Image.asset("assets/payment_logos/express.png"));
      case 'jcb':
        return Container(height: 32, width: 36, child: SvgPicture.asset("assets/payment_logos/dinners.svg"));
      case 'discover':
        return Container(height: 9, child: Image.asset("assets/payment_logos/discover.png"));
      default:
        return Container();
    }
  }
}