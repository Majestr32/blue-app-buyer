import 'dart:async';

import 'package:blue/blocs/theme_cubit/theme_cubit.dart';
import 'package:blue/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(Duration(seconds: 2),(){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
    });
  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Stack(
          children: [
            context.watch<ThemeCubit>().state.theme == ThemeMode.light ? Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset('assets/degradado-back.png').image
                  )
              ),
            ) : Container(),
            Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo_images/BlueBwhite-02.png', scale: 1.2,),
                SizedBox(height: 15,),
                Text('Cargando', style: TextStyle(fontSize: 24, color: Colors.white, fontStyle: FontStyle.italic, fontFamily: 'Poppins'),)
              ],
            )),
          ],
        )
    );
  }
}
