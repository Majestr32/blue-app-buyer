import 'package:blue/consts/k_icons.dart';
import 'package:blue/widgets/common/arc_with_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({Key? key}) : super(key: key);

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  int _stars = 0;
  final _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: [
          ArcWithLogo(withArrow: true,),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 450,
                  child: Stack(
                    children: [
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(height: 400, decoration: BoxDecoration(color: Theme.of(context).focusColor, boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.4), blurRadius: 6, offset: Offset(0,2))]),)),
                      Align(alignment: Alignment.topCenter, child: Column(
                        children: [
                          Image.asset('assets/images/trophy.png', scale: 1.1,),
                          SizedBox(height: 10,),
                          Center(child: Text('¡Escribe tu reseña!', style: TextStyle(fontFamily: 'Outfit', fontSize: 24, fontWeight: FontWeight.w500),),),
                          SizedBox(height: 10,),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: TextField(
                              controller: _commentController,
                              style: TextStyle(
                                fontFamily: 'Outfit'
                              ),
                              maxLines: null,
                              minLines: 7,
                              decoration: InputDecoration(
                                hintText: 'Comentario',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none
                                ),
                                filled: true,
                                fillColor: Theme.of(context).splashColor,
                              ),),
                          ),
                          SizedBox(height: 20,)
                        ],
                      ),),
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                  SvgPicture.asset(_stars > 0 ? KIcons.starFilled2 : KIcons.star, color: Colors.yellow, width: 36, height: 36,),
                  SvgPicture.asset(_stars > 1 ? KIcons.starFilled2 : KIcons.star, color: Colors.yellow,width: 36, height: 36,),
                  SvgPicture.asset(_stars > 2 ? KIcons.starFilled2 : KIcons.star, color: Colors.yellow,width: 36, height: 36,),
                  SvgPicture.asset(_stars > 3 ? KIcons.starFilled2 : KIcons.star, color: Colors.yellow,width: 36, height: 36,),
                  SvgPicture.asset(_stars > 4 ? KIcons.starFilled2 : KIcons.star, color: Colors.yellow,width: 36, height: 36,),
                ].asMap().entries.map((e) => GestureDetector(
                  onTap: (){
                    setState((){
                      _stars = e.key + 1;
                    });
                  },
                  child: e.value,)).toList(),),
                SizedBox(height: 15,),
                Center(
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: 65,
                      child: ElevatedButton(onPressed: () async{
                        String comment = _commentController.text;
                        Navigator.of(context).pop();
                      }, child: Text('Enviar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),))),
                ),
                SizedBox(height: 25,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
