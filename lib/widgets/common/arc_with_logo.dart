import 'package:blue/blocs/theme_cubit/theme_cubit.dart';
import 'package:blue/widgets/common/back_arrow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArcWithLogo extends StatelessWidget {
  final double? heightExtend;
  final bool withArrow;
  const ArcWithLogo({this.heightExtend, this.withArrow = false,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        context.watch<ThemeCubit>().state.theme == ThemeMode.light ? Container(
          child: ClipPath(
            clipper: ArcClipper(extendFactor: heightExtend == null ? 0 : heightExtend !/ 100 > 1 ? 1 : heightExtend !/ 100),
            child: Container(
              height: 230,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  end: Alignment.topRight,
                  colors: [
                    Color(0xFF7068E7),
                    Color(0xFF0EDAFB)
                  ]
                )
              ),
            ),
          ),
        ) : Container(),
        heightExtend == null || heightExtend! < 50 ? Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: const EdgeInsets.only(left: 40,top: 50),
            child: Image.asset('assets/logo_images/bluwhite3-02.png', scale: 2,),
          ),
        ) : Container(),
        withArrow ? Container(
            margin: const EdgeInsets.only(top: 60, left: 10),
            child: const BackArrow(color: Colors.white,)) : Container(),
      ],
    );
  }
}

class ArcClipper extends CustomClipper<Path>{
  final double extendFactor;

  final double startX1 = .1;
  final double startX2 = .8;
  final double startX3 = 1;
  final double startY1 = .6;
  final double startY2 = .8;
  final double startY3 = .25;

  final double endX1 = .5;
  final double endX2 = .5;
  final double endX3 = 1;
  final double endY1 = .1;
  final double endY2 = .3;
  final double endY3 = .45;

  @override
  Path getClip(Size size) {
    final w = size.width;
    final h = size.height;
    final path = Path();
    double x1 = interpolate(startX1, endX1, extendFactor);
    double x2 = interpolate(startX2, endX2, extendFactor);
    double x3 = interpolate(startX3, endX3, extendFactor);
    double y1 = interpolate(startY1, endY1, extendFactor);
    double y2 = interpolate(startY2, endY2, extendFactor);
    double y3 = interpolate(startY3, endY3, extendFactor);
    double initialH = interpolate(h, h/3, extendFactor);
    path.lineTo(0, initialH);
    path.cubicTo(w*x1, h*y1, w*x2, h*y2, w*x3, h*y3);
    path.lineTo(w, 0);
    path.close();
    return path;
  }

  double interpolate(double a1,double a2, double k){
    return a1 + (a2 - a1) * k;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

  const ArcClipper({
    required this.extendFactor,
  });
}
