import 'package:blue/screens/post_auth/category_choose.dart';
import 'package:blue/widgets/common/arc_with_logo.dart';
import 'package:flutter/material.dart';

class PreCategoriesChoose extends StatelessWidget {
  const PreCategoriesChoose({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: [
          ArcWithLogo(),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('¡Bienvenido!', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'Poppins'),),
                  SizedBox(height: 30,),
                  Text('Encuentra descuentos para tí', style: TextStyle(fontSize: 48, fontWeight: FontWeight.w100, fontFamily: 'Poppins'),),
                  SizedBox(height: 30,),
                  Text('Personalizando tu cuenta, te ayudaremos a encontrar lo que te gusta', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'Poppins'),),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 60,
                  child: ElevatedButton(
                      style: Theme.of(context).elevatedButtonTheme.style,
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CategoryChoose()));
                      }, child: Text('Personalizar')),
                ),
                SizedBox(height: 20,),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 60,
                  child: OutlinedButton(
                      style: Theme.of(context).outlinedButtonTheme.style,
                      onPressed: (){
                        Navigator.of(context).pop();
                      }, child: Text('Saltar')),
                ),
                SizedBox(height: 20,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
