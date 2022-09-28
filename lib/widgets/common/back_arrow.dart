
import 'package:blue/consts/k_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BackArrow extends StatelessWidget {
  final VoidCallback? onWillPopScope;
  final Color? color;
  const BackArrow({this.onWillPopScope, this.color, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: SvgPicture.asset(KIcons.directionLeft, color: color ?? Theme.of(context).highlightColor, fit: BoxFit.none, width: 16, height: 16,), onTap: (){
      if(onWillPopScope != null){
        onWillPopScope!.call();
      }else{
        Navigator.of(context).pop();
      }
    },);
  }
}
