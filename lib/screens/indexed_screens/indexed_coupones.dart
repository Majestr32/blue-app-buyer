import 'package:blue/blocs/user_cubit/user_cubit.dart';
import 'package:blue/widgets/common/active_vertical_small_coupon.dart';
import 'package:blue/widgets/common/app_bar_with_arrow.dart';
import 'package:blue/widgets/common/expired_vertical_small_coupon.dart';
import 'package:blue/widgets/common/friend_vertical_small_coupon.dart';
import 'package:blue/widgets/common/used_vertical_small_coupon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IndexedCoupons extends StatefulWidget {
  const IndexedCoupons({Key? key}) : super(key: key);

  @override
  State<IndexedCoupons> createState() => _IndexedCouponsState();
}

class _IndexedCouponsState extends State<IndexedCoupons> {
  int _currentTag = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: 20,),
          Text('CUPONES', style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w500, fontSize: 16),),
          SizedBox(height: 20,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                'Activos',
                'Canjeados',
                'Cancelados',
                'Amigos/Familia',
                'Vencidos'
              ].asMap().entries.map((e) => GestureDetector(
                  onTap: (){
                    setState((){
                      _currentTag = e.key;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        Text(e.value, style: TextStyle(fontFamily: 'Outfit', color: _currentTag == e.key ? Color(0xFF3D5BF6) : Color(0xFFBCBCBC), fontWeight: FontWeight.w400, fontSize: 14),),
                        _currentTag == e.key ? Container(height: 3, width: 80, color: Color(0xFF3D5BF6)) : Container(),
                      ],
                    ),
                  ))).toList(),
            ),
          ),
          SizedBox(height: 10,),
          ((){
            switch(_currentTag){
              case 0:
                return Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: context.watch<UserCubit>().state.activeCoupons.length,
                      itemBuilder: (context,i){
                        return Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: ActiveVerticalSmallCouponTile(coupon: context.watch<UserCubit>().state.activeCoupons[i]));
                      }),
                );
              case 1:
                return Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: context.watch<UserCubit>().state.usedCoupons.length,
                      itemBuilder: (context,i){
                        return Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: UsedVerticalSmallCouponTile(coupon: context.watch<UserCubit>().state.usedCoupons[i].coupon));
                      }),
                );
              case 2:
                return Container();
              case 3:
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: context.watch<UserCubit>().state.friendsCoupons.length,
                    itemBuilder: (context,i){
                      return Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: FriendVerticalSmallCouponTile(coupon: context.watch<UserCubit>().state.friendsCoupons[i]));
                    }),
                );
              case 4:
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: context.watch<UserCubit>().state.expiredCoupons.length,
                    itemBuilder: (context,i){
                      return Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: ExpiredVerticalSmallCouponTile(coupon: context.watch<UserCubit>().state.expiredCoupons[i].coupon));
                    }),
                );
              default:
                return Container();
            }
          }()),
          SizedBox(height: 90,)
        ],
      ),
    );
  }
}
