import 'package:blue/blocs/searched_coupons_cubit/searched_coupons_cubit.dart';
import 'package:blue/screens/filter/filters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../blocs/coupon_cubit/coupon_cubit.dart';
import '../../consts/k_icons.dart';
import '../../widgets/common/arc_with_logo.dart';
import '../../widgets/common/vertical_small_coupon_tile.dart';

class SearchResultsScreen extends StatefulWidget {
  const SearchResultsScreen({Key? key}) : super(key: key);

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {

  final ScrollController _allScrollController = ScrollController();
  double _heightExtend = 0;
  bool _allLoading = false;

  @override
  void initState() {
    super.initState();
    _allScrollController.addListener(_loadMoreAllCoupones);
  }

  void _loadMoreAllCoupones(){
    setState((){
      _heightExtend = _allScrollController.position.extentBefore;
    });
    if(_allLoading){
      return;
    }
    if(_allScrollController.position.extentAfter < 200 && context.read<SearchedCouponsCubit>().state.status != CouponStateStatus.initial){
      _allLoading = true;
      context.read<SearchedCouponsCubit>().loadMoreCoupons().then((value) => _allLoading = false);
    }
  }

  @override
  void dispose() {
    _allScrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ArcWithLogo(withArrow: true, heightExtend: _heightExtend,),
          SingleChildScrollView(
            controller: _allScrollController,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 220,),
                _all(context)
              ],
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                SizedBox(height: _heightExtend > 100 ? 0 : 100 - _heightExtend),
                Center(
                  child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Row(
                      children: [
                        Flexible(child: TextField(
                          onSubmitted: (val){
                            context.read<SearchedCouponsCubit>().findCoupons(val);
                          },
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              isDense: true,
                              hintText: 'Busqueda de cupones', suffixIcon: Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: SvgPicture.asset(KIcons.search, color: Color(0xFF595CE6),)), suffixIconConstraints: BoxConstraints(maxWidth: 32,maxHeight: 32)),)),
                        SizedBox(width: 10,),
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => FiltersScreen(inSearchResultsScreen: true)));
                          },
                          child: CircleAvatar(
                              radius: 24,
                              backgroundColor: Colors.white, child: SvgPicture.asset(KIcons.filter,color: Color(0xFF595CE6),)),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _all(BuildContext context){
    return BlocBuilder<SearchedCouponsCubit,SearchedCouponsState>(
          builder: (context,state) => Column(
            children: [
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                  itemCount: state.searchedCoupons.length,
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    return Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: VerticalSmallCouponTile(coupon: state.searchedCoupons[i]));
                  }),
              SizedBox(height: 60,),
            ],
          ),
    );
  }
}
