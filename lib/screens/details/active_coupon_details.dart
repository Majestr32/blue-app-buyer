import 'package:blue/models/user_coupon/user_coupon.dart';
import 'package:blue/widgets/common/active_vertical_small_coupon.dart';
import 'package:blue/widgets/common/app_bar_with_arrow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../blocs/coupon_reviews_cubit/coupon_reviews_cubit.dart';
import '../../blocs/theme_cubit/theme_cubit.dart';
import '../../consts/k_icons.dart';
import '../../models/branch/branch.dart';
import '../../widgets/common/branch_tile.dart';

class ActiveCouponDetails extends StatefulWidget {
  final UserCoupon userCoupon;
  const ActiveCouponDetails({Key? key, required this.userCoupon}) : super(key: key);

  @override
  State<ActiveCouponDetails> createState() => _ActiveCouponDetailsState();
}

class _ActiveCouponDetailsState extends State<ActiveCouponDetails> {
  bool _showBranches = true;

  @override
  void initState() {
    super.initState();
    context.read<CouponReviewsCubit>().loadComments(widget.userCoupon.couponId);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithArrow(title: 'Detalles',),
      body: Column(
        children: [
          SizedBox(height: 15,),
          ActiveVerticalSmallCouponTile(coupon: widget.userCoupon, isDetailsScreen: true,),
          Divider(color: Colors.white,),
          SizedBox(height: 20,),
          _dropdownBranches()
        ],
      ),
    );
  }

  Widget _dropdownBranches(){
    return context.watch<CouponReviewsCubit>().state.branches.isEmpty ? Container() : GestureDetector(
      onTap: (){
        setState((){
          _showBranches = !_showBranches;
        });
      },
      child: Container(
        width: double.infinity,
        color: Colors.transparent,
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Ubicación en Mapa', style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w500),),
                Spacer(),
                Text('(${context.watch<CouponReviewsCubit>().state.branches.length} Sucursales)', style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w300),),
                SizedBox(width: 10,),
                Container(
                  width: 16,
                  height: 16,
                  child: AnimatedRotation(
                      turns: _showBranches ? 0.25 : 0.75,
                      duration: Duration(milliseconds: 300),
                      child: SvgPicture.asset(KIcons.directionLeft, color: Theme.of(context).highlightColor,)),
                )
              ],
            ),
            SizedBox(height: 15,),
            Divider(),
            !_showBranches ? SizedBox() : Container(
              margin: EdgeInsets.only(top: 30),
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: context.watch<CouponReviewsCubit>().state.branches.length,
                  itemBuilder: (context,i) {
                    return Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: BranchTile(branch: context.watch<CouponReviewsCubit>().state.branches[i],));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
