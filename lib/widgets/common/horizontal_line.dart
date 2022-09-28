import 'package:flutter/material.dart';

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(width: double.infinity, height: 1, color: Colors.grey.withOpacity(0.1),);
  }
}
