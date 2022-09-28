import 'package:blue/screens/operation_screens/fail_screen.dart';
import 'package:blue/screens/operation_screens/success_screen.dart';
import 'package:blue/screens/post_auth/pre_categories_choose.dart';
import 'package:blue/widgets/common/arc_with_logo.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannersPreview extends StatefulWidget {
  const BannersPreview({Key? key}) : super(key: key);

  @override
  State<BannersPreview> createState() => _BannersPreviewState();
}

class _BannersPreviewState extends State<BannersPreview> {

  int _currentSlide = 0;
  final _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: [
          ArcWithLogo(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CarouselSlider(
                  carouselController: _controller,
                  options: CarouselOptions(viewportFraction: 1, aspectRatio: 1, onPageChanged: (page,_) => setState((){_currentSlide = page;})),
                  items: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: _tile('assets/images/Illustration.png','Cupones hasta del 90% de decuento','Las mejores ofertas en diversiòn, belleza, tècnologìa y màs'),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: _tile('assets/images/Illustration-1.png','Regala Cupones','A tus familiares y amigos desde nuestra app.'),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: _tile('assets/images/qr-code-abstract-concept-vector-33942346 1.png','Cupones QR','Compra y canjea los cupones solo con tu smartphone'),
                    ),
                  ],
                ),
                SizedBox(height: 15,),
                _dots()
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 40),
            width: MediaQuery.of(context).size.width * 0.9,
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.42,
                  height: 60,
                  child: OutlinedButton(
                      style: Theme.of(context).outlinedButtonTheme.style,
                      onPressed: (){
                        if(_currentSlide != 0){
                          setState((){
                            _controller.previousPage();
                          });
                        }
                      }, child: Text('Atrás')),
                ),
                Spacer(),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.42,
                  height: 60,
                  child: ElevatedButton(
                      style: Theme.of(context).elevatedButtonTheme.style,
                      onPressed: (){
                        if(_currentSlide < 2){
                          setState((){
                            _controller.nextPage();
                          });
                        }else{
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => PreCategoriesChoose()));
                        }
                      }, child: Text('Siguiente')),
                ),
              ],
            ),
          ),)
        ],
      ),
    );
  }
  Widget _dots(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(radius: 6,backgroundColor: _currentSlide != 0 ? Color(0xFFD9D9D9) : Color(0xFF3D5BF6)),
        SizedBox(width: 5,),
        CircleAvatar(radius: 6,backgroundColor: _currentSlide != 1 ? Color(0xFFD9D9D9) : Color(0xFF3D5BF6)),
        SizedBox(width: 5,),
        CircleAvatar(radius: 6,backgroundColor: _currentSlide != 2 ? Color(0xFFD9D9D9) : Color(0xFF3D5BF6)),
      ],
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
