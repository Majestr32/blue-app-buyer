import 'package:blue/consts/k_icons.dart';
import 'package:blue/models/branch/branch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BranchTile extends StatelessWidget {
  final Branch branch;
  const BranchTile({Key? key, required this.branch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(branch.username, style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w600),),
        SizedBox(height: 10,),
        Text(branch.location, style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w300),),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(KIcons.location),
            SizedBox(width: 5,),
            SvgPicture.asset(KIcons.whatsapp, color: Colors.black,),
            SizedBox(width: 5,),
            SvgPicture.asset(KIcons.calling),
            SizedBox(width: 5,),
          ],
        )
      ],
    );
  }
}
