import 'dart:developer';

import 'package:blue/blocs/coupon_cubit/coupon_cubit.dart';
import 'package:blue/blocs/user_cubit/user_cubit.dart';
import 'package:blue/models/user/user.dart';
import 'package:blue/screens/filter/filters_screen.dart';
import 'package:blue/widgets/common/cart_icon.dart';
import 'package:blue/widgets/common/featured_tile.dart';
import 'package:blue/widgets/common/horizontal_coupon_tile.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../blocs/searched_coupons_cubit/searched_coupons_cubit.dart';
import '../../consts/k_icons.dart';
import '../../widgets/common/arc_with_logo.dart';
import '../search/search_results_screen.dart';

class IndexedHome extends StatefulWidget {
  const IndexedHome({Key? key}) : super(key: key);

  @override
  State<IndexedHome> createState() => _IndexedHomeState();
}

class _IndexedHomeState extends State<IndexedHome> {

  final _scrollController = ScrollController();
  double _heightExtend = 0;
  int _recommendedIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scroll);
  }
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void _scroll(){
    setState((){
      _heightExtend = _scrollController.position.extentBefore;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ArcWithLogo(heightExtend: _heightExtend,),
        Center(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                const SizedBox(height: 200,),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Destacados', style: TextStyle(fontSize: 16, fontFamily: 'Outfit', fontWeight: FontWeight.w600),)),
                ),
                const SizedBox(height: 20,),
                context.watch<CouponCubit>().state.status == CouponStateStatus.initial? CarouselSlider(items: const [FakeFeaturedTile(),FakeFeaturedTile(),FakeFeaturedTile()], options: CarouselOptions(viewportFraction: 1, enableInfiniteScroll: false, clipBehavior: Clip.none, onPageChanged: (i,cause) => setState((){_recommendedIndex = i;})),)
                : CarouselSlider.builder(
                  itemCount: context.watch<CouponCubit>().state.recommendedCoupons.length,
                  itemBuilder:  (context, i, j) => FeaturedTile(coupon: context.watch<CouponCubit>().state.recommendedCoupons[i]), options: CarouselOptions(
                    clipBehavior: Clip.none,
                    enableInfiniteScroll: false,
                    viewportFraction: 1, onPageChanged: (i,cause) => setState((){_recommendedIndex = i;})),),
                const SizedBox(height: 20,),
                _dots(context.watch<CouponCubit>().state.status == CouponStateStatus.initial ? 3 : context.watch<CouponCubit>().state.recommendedCoupons.length),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Nuevos cupones', style: TextStyle(fontSize: 16, fontFamily: 'Outfit', fontWeight: FontWeight.w600),)),
                ),
                const SizedBox(height: 15,),
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    clipBehavior: Clip.none,
                      itemCount: context.watch<CouponCubit>().state.status == CouponStateStatus.initial ? 3 : context.watch<CouponCubit>().state.newCoupons.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, i) => context.watch<CouponCubit>().state.status == CouponStateStatus.initial ? const FakeHorizontalCouponTile() : HorizontalCouponTile(coupon: context.watch<CouponCubit>().state.newCoupons[i],)),
                ),
                const SizedBox(height: 90,)
              ],
            ),
          ),
        ),
        SafeArea(
          child: Align(
              alignment: Alignment.topRight,
              child: Container(
                  margin: const EdgeInsets.only(top: 20, right: 40),
                  child: CartIcon(itemsCount: context.watch<UserCubit>().state.cartCoupons.length))),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(margin: const EdgeInsets.only(top: 120), child: SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Row(
              children: [
                Flexible(child: TextField(
                  onSubmitted: (val){
                    context.read<SearchedCouponsCubit>().findCoupons(val);
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchResultsScreen()));
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                      isDense: true,
                      hintText: 'Busqueda de cupones', suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: SvgPicture.asset(KIcons.search, color: const Color(0xFF595CE6),)), suffixIconConstraints: const BoxConstraints(maxWidth: 32,maxHeight: 32)),)),
                const SizedBox(width: 10,),
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => FiltersScreen(inSearchResultsScreen: false,)));
                  },
                  child: CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.white, child: SvgPicture.asset(KIcons.filter, color: const Color(0xFF595CE6),),),
                )
              ],
            ),
          ),),
        ),
      ],
    );
  }
  Widget _dots(int elementsCount){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(elementsCount, (index) => Row(children: [
        CircleAvatar(radius: 6,backgroundColor: _recommendedIndex != index ? const Color(0xFFD9D9D9) : const Color(0xFF3D5BF6)),
        const SizedBox(width: 5,),
      ],))
    );
  }
}
