import 'package:blue/blocs/user_cubit/user_cubit.dart';
import 'package:blue/widgets/common/active_vertical_small_coupon.dart';
import 'package:blue/widgets/common/app_bar_with_arrow.dart';
import 'package:blue/widgets/common/expired_vertical_small_coupon.dart';
import 'package:blue/widgets/common/friend_vertical_small_coupon.dart';
import 'package:blue/widgets/common/used_vertical_small_coupon.dart';
import 'package:blue/widgets/empty_result/no_data_coupons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IndexedCoupons extends StatefulWidget {
  const IndexedCoupons({Key? key}) : super(key: key);

  @override
  State<IndexedCoupons> createState() => _IndexedCouponsState();
}

class _IndexedCouponsState extends State<IndexedCoupons> with SingleTickerProviderStateMixin{
  final _tabs = [
    'Activos',
    'Canjeados',
    'Cancelados',
    'Amigos/Familia',
    'Vencidos'
  ];
  late final _tabController = TabController(length: _tabs.length, vsync: this);

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController.addListener(_updateTab);
  }

  void _updateTab(){
    setState((){
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 80, bottom: 70),
            child: TabBarView(
                controller: _tabController,
                children: [
                  context.watch<UserCubit>().state.activeCoupons.isEmpty ? NoDataCoupons() : ListView.builder(
                      shrinkWrap: true,
                      itemCount: context.watch<UserCubit>().state.activeCoupons.length,
                      itemBuilder: (context,i){
                        return Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: ActiveVerticalSmallCouponTile(coupon: context.watch<UserCubit>().state.activeCoupons[i]));
                      }),
                  context.watch<UserCubit>().state.usedCoupons.isEmpty ? NoDataCoupons() : ListView.builder(
                      shrinkWrap: true,
                      itemCount: context.watch<UserCubit>().state.usedCoupons.length,
                      itemBuilder: (context,i){
                        return Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: UsedVerticalSmallCouponTile(userCoupon: context.watch<UserCubit>().state.usedCoupons[i]));
                      }),
                  NoDataCoupons(),
                  context.watch<UserCubit>().state.friendsCoupons.isEmpty ? NoDataCoupons() : ListView.builder(
                      shrinkWrap: true,
                      itemCount: context.watch<UserCubit>().state.friendsCoupons.length,
                      itemBuilder: (context,i){
                        return Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: FriendVerticalSmallCouponTile(coupon: context.watch<UserCubit>().state.friendsCoupons[i]));
                      }),
                  context.watch<UserCubit>().state.expiredCoupons.isEmpty ? NoDataCoupons() : ListView.builder(
                      shrinkWrap: true,
                      itemCount: context.watch<UserCubit>().state.expiredCoupons.length,
                      itemBuilder: (context,i){
                        return Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: ExpiredVerticalSmallCouponTile(coupon: context.watch<UserCubit>().state.expiredCoupons[i]));
                      })
                ]),
          ),
          Column(
            children: [
              SizedBox(height: 10,),
              Text('CUPONES', style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w500, fontSize: 16),),
              SizedBox(height: 15,),
              Theme(
                data: ThemeData(
                    splashColor: Colors.grey.withOpacity(0.3)
                ),
                child: TabBar(
                  isScrollable: true,
                  controller: _tabController,
                  indicatorColor: const Color(0xFF3D5BF6),
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 5),
                  tabs: _tabs.asMap().entries.map((e) => Tab(
                    height: 23,
                    child: Text(e.value, style: TextStyle(fontFamily: 'Outfit', color: _tabController.index == e.key ? Color(0xFF3D5BF6) : Color(0xFFBCBCBC), fontWeight: FontWeight.w400, fontSize: 14),),
                  )).toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
