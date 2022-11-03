import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class StandardLoadingIndicator extends StatelessWidget {
  const StandardLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 60,
        child: LoadingIndicator(
            indicatorType: Indicator.ballClipRotate,
            colors: const [Color(0xFF595CE6)],
            strokeWidth: 2,
            pathBackgroundColor: Colors.black
        ),
      ),
    );
  }
}
