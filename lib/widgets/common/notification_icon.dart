import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../consts/k_icons.dart';
import '../../screens/notification/notifications_screen.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotificationsScreen()));
        },
        child: SvgPicture.asset(KIcons.notification, color: Colors.white, width: 32, height: 32,));
  }
}