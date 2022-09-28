import 'package:flutter/material.dart';

class SmallCouponTile extends StatelessWidget {
  const SmallCouponTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(16)
      ),
    );
  }
}
