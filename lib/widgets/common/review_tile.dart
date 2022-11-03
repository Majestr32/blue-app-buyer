import 'package:blue/consts/k_icons.dart';
import 'package:blue/models/coupon_review/coupon_review.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ReviewTile extends StatelessWidget {
  final CouponReview review;
  const ReviewTile({Key? key, required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          review.user.profileImgUrl == null ? SvgPicture.asset(KIcons.user) : CircleAvatar(radius: 18, backgroundImage: Image.network(review.user.profileImgUrl!).image,),
          SizedBox(width: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(review.user.username!, style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w500),),
              SizedBox(height: 5,),
              _stars(review.rating.toInt())
            ],
          )
        ],),
        SizedBox(height: 10,),
        review.comment == null ? SizedBox.shrink() : Text(review.comment!, style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w200),)
      ],
    );
  }

  Widget _stars(int count){
    return Row(
        children: List.generate(5, (index) => SvgPicture.asset(count > index ? KIcons.starFilled2 : KIcons.star, width: 13, height: 13, color: Colors.yellow,)).toList()
      );
  }
}
