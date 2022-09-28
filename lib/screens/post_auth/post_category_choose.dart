import 'package:blue/screens/splash/splash_screen.dart';
import 'package:blue/widgets/common/arc_with_logo.dart';
import 'package:flutter/material.dart';

class PostCategoryChoose extends StatelessWidget {
  const PostCategoryChoose({Key? key}) : super(key: key);

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
              child: _tile('assets/images/post_category.png', 'Listo', 'Felicidades, pronto tendrás descuentos especiales a tu gusto'),
            ),
          ),
          Align(alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(bottom: 60),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 60,
              child: ElevatedButton(
                  style: Theme.of(context).elevatedButtonTheme.style,
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SplashScreen()));
                  }, child: Text('Terminar')),
            ),
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
        SizedBox(height: 10,),
        Text(title, textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'Poppins'),),
        SizedBox(height: 20,),
        Text(description, textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'Poppins'),),
      ],);
  }
}
