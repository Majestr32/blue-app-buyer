import 'package:flutter/material.dart';

import '../../widgets/common/arc_with_logo.dart';

class FailScreen extends StatelessWidget {
  const FailScreen({Key? key}) : super(key: key);

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
              child: _tile('assets/images/error.png','¡Mensaje de Errorl','Por favor revisa tu conexión a internet e inténtalo de nuevo'),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 40),
              width: MediaQuery.of(context).size.width * 0.8,
              height: 60,
              child: OutlinedButton(
                  style: Theme.of(context).outlinedButtonTheme.style,
                  onPressed: (){
                    Navigator.of(context).pop();
                  }, child: Text('Cerrar')),
            ),)
        ],
      ),
    );
  }
  Widget _tile(String assetImgPath, String title, String description){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(assetImgPath),
        SizedBox(height: 20,),
        Text(title, textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'Poppins'),),
        SizedBox(height: 30,),
        Text(description, textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'Poppins'),),
      ],);
  }
}
