
import 'package:flutter/material.dart';

import 'back_arrow.dart';

class AppBarWithArrow extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final Widget? suffixWidget;
  final VoidCallback? onWillPopScope;
  const AppBarWithArrow({required this.title, this.onWillPopScope, this.suffixWidget, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: BackArrow(onWillPopScope: onWillPopScope,),
      actions: suffixWidget == null ? null : [
        suffixWidget!
      ],
      title: Text(title),
      centerTitle: true,
      titleTextStyle: TextStyle(fontSize: 18, color: Theme.of(context).highlightColor, fontFamily: 'Outfit', fontWeight: FontWeight.w400),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 50);
}
