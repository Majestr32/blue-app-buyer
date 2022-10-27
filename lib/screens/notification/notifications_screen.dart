import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/user_cubit/user_cubit.dart';
import '../../widgets/common/arc_with_logo.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: [
          ArcWithLogo(withArrow: true),
          SingleChildScrollView(
            child: Column(children: [
              SizedBox(height: 220,),
              Center(child: Text('Notificaciones', style: TextStyle(fontFamily: 'Outfit', fontSize: 24, fontWeight: FontWeight.w500),),),
            ],),
          )
        ],
      ),
    );
  }
}