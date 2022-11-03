import 'package:blue/consts/k_icons.dart';
import 'package:blue/models/branch/branch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

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
        Text(branch.location, style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w300, color: Colors.grey),),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: (){
                launchUrl(Uri.parse("https://www.google.com/maps/search/?api=1&query=${branch.lat},${branch.ln}"));
              },
              child: SizedBox(
                  width: 42,
                  height: 42,
                  child: SvgPicture.asset(KIcons.location, fit: BoxFit.none, color: Theme.of(context).highlightColor)),
            ),
            GestureDetector(
              onTap: (){
                launchUrl(Uri.parse("whatsapp://send?phone=${branch.whatsapp}&text="));
              },
                child: SizedBox(
                    width: 42,
                    height: 42,
                    child: SvgPicture.asset(KIcons.whatsapp, fit: BoxFit.none, color: Theme.of(context).highlightColor))),
            GestureDetector(
                onTap: (){
                  launchUrl(Uri.parse("tel://${branch.phone}"));
                },
                child: SizedBox(
                    width: 42,
                    height: 42,
                    child: SvgPicture.asset(KIcons.calling, fit: BoxFit.none, color: Theme.of(context).highlightColor))),
          ],
        ),
        SizedBox(height: 15,),
      ],
    );
  }
}
