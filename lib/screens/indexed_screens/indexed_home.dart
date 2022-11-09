
import 'package:blue/blocs/coupon_cubit/coupon_cubit.dart';
import 'package:blue/blocs/user_cubit/user_cubit.dart';
import 'package:blue/screens/filter/filters_screen.dart';
import 'package:blue/widgets/common/cart_icon.dart';
import 'package:blue/widgets/common/featured_tile.dart';
import 'package:blue/widgets/common/horizontal_coupon_tile.dart';
import 'package:blue/widgets/common/notification_icon.dart';
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
        Center(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                const SizedBox(height: 210,),
                context.watch<CouponCubit>().state.status != CouponStateStatus.initial && context.watch<CouponCubit>().state.popularCoupons.isNotEmpty ? SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text('Destacados', style: TextStyle(fontSize: 16, fontFamily: 'Outfit', fontWeight: FontWeight.w600),),
                ) : Container(),
                const SizedBox(height: 23,),
                context.watch<CouponCubit>().state.status == CouponStateStatus.initial? CarouselSlider(items: const [FakeFeaturedTile(),FakeFeaturedTile(),FakeFeaturedTile()], options: CarouselOptions(viewportFraction: 1, enableInfiniteScroll: false, clipBehavior: Clip.none, onPageChanged: (i,cause) => setState((){_recommendedIndex = i;})),)
                : context.watch<CouponCubit>().state.popularCoupons.isEmpty ? Container() : CarouselSlider.builder(
                  itemCount: context.watch<CouponCubit>().state.popularCoupons.length,
                  itemBuilder:  (context, i, j) => FeaturedTile(coupon: context.watch<CouponCubit>().state.popularCoupons[i]), options: CarouselOptions(
                  aspectRatio: 16/8,
                    clipBehavior: Clip.none,
                    enableInfiniteScroll: false,
                    viewportFraction: 1, onPageChanged: (i,cause) => setState((){_recommendedIndex = i;})),),
                const SizedBox(height: 20,),
                _dots(context.watch<CouponCubit>().state.status == CouponStateStatus.initial ? 3 : context.watch<CouponCubit>().state.popularCoupons.length),
                const SizedBox(height: 25,),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    children: [
                      Text('Nuevos cupones', style: TextStyle(fontSize: 16, fontFamily: 'Outfit', fontWeight: FontWeight.w600),),
                      Spacer(),
                      GestureDetector(
                          onTap: (){
                            context.read<SearchedCouponsCubit>().setCategory('new');
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchResultsScreen(categorySearch: true,)));
                          },
                          child: Text('Mostrar Todo', style: TextStyle(fontSize: 14, fontFamily: 'Outfit', color: Color(0xFF595CE6), fontWeight: FontWeight.w500),)),
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                SizedBox(
                  height: 310,
                  child: ListView.builder(
                      clipBehavior: Clip.none,
                      itemCount: context.watch<CouponCubit>().state.status == CouponStateStatus.initial ? 3 : context.watch<CouponCubit>().state.newCoupons.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, i) => context.watch<CouponCubit>().state.status == CouponStateStatus.initial ? const FakeHorizontalCouponTile() : HorizontalCouponTile(coupon: context.watch<CouponCubit>().state.newCoupons[i],)),
                ),
                SizedBox(height: 35,),
                /*context.watch<CouponCubit>().state.history.isEmpty ? Container() : Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  margin: EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [
                      Text('Vistos Recientemente', style: TextStyle(fontSize: 16, fontFamily: 'Outfit', fontWeight: FontWeight.w600),),
                      Spacer(),
                      GestureDetector(
                          onTap: (){
                            context.read<SearchedCouponsCubit>().setCategory('history');
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchResultsScreen(categorySearch: true,)));
                          },
                          child: Text('Mostrar Todo', style: TextStyle(fontSize: 14, fontFamily: 'Outfit', color: Color(0xFF595CE6), fontWeight: FontWeight.w500),)),
                    ],
                  ),
                ),
                context.watch<CouponCubit>().state.history.isEmpty ? Container() : SizedBox(
                  height: 310,
                  child: ListView.builder(
                      clipBehavior: Clip.none,
                      itemCount: context.watch<CouponCubit>().state.history.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, i) => HorizontalCouponTile(coupon: context.watch<CouponCubit>().state.history[i],)),
                ),*/
                SizedBox(height: 35,),
                context.watch<CouponCubit>().state.recommendedCoupons.isEmpty ? Container() : Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  margin: EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [
                      Text('Recomendados', style: TextStyle(fontSize: 16, fontFamily: 'Outfit', fontWeight: FontWeight.w600),),
                      Spacer(),
                      GestureDetector(
                          onTap: (){
                            context.read<SearchedCouponsCubit>().setCategory('recommended', tagsIds: context.read<UserCubit>().state.tagsIds);
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchResultsScreen(categorySearch: true,)));
                          },
                          child: Text('Mostrar Todo', style: TextStyle(fontSize: 14, fontFamily: 'Outfit', color: Color(0xFF595CE6), fontWeight: FontWeight.w500),)),
                    ],
                  ),
                ),
                context.watch<CouponCubit>().state.recommendedCoupons.isEmpty ? Container() : SizedBox(
                  height: 310,
                  child: ListView.builder(
                      clipBehavior: Clip.none,
                      itemCount: context.watch<CouponCubit>().state.recommendedCoupons.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, i) => HorizontalCouponTile(coupon: context.watch<CouponCubit>().state.recommendedCoupons[i],)),
                ),
                const SizedBox(height: 90,)
              ],
            ),
          ),
        ),
        ArcWithLogo(heightExtend: _heightExtend,),
        SafeArea(
          child: Align(
              alignment: Alignment.topRight,
              child: Container(
                  margin: const EdgeInsets.only(top: 20, right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      NotificationIcon(),
                      SizedBox(width: 4,),
                      CartIcon(itemsCount: context.watch<UserCubit>().state.cartCoupons.length),
                    ],
                  ))),
        ),
        AnimatedOpacity(
          opacity: _heightExtend > 50 ? 0 : _heightExtend < 0 ? 1 : 1 - _heightExtend / 50,
          duration: Duration(milliseconds: 80),
          child: _heightExtend > 50 ? Container() : Align(
            alignment: Alignment.topCenter,
            child: Container(margin: const EdgeInsets.only(top: 120), child: SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                children: [
                  Flexible(child: TextField(
                    style: TextStyle(color: Colors.black),
                    onSubmitted: (val){
                      context.read<SearchedCouponsCubit>().setSearchQuery(val);
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchResultsScreen()));
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                        isDense: true,
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.withOpacity(0.1)), borderRadius: BorderRadius.circular(16)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.withOpacity(0.1)), borderRadius: BorderRadius.circular(16)),
                        hintText: 'Busqueda de cupones', suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: SvgPicture.asset(KIcons.search, color: const Color(0xFF595CE6),)), suffixIconConstraints: const BoxConstraints(maxWidth: 32,maxHeight: 32)),)),
                  const SizedBox(width: 10,),
                  InkWell(
                    highlightColor: Colors.transparent,
                    focusColor: Colors.transparent,
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
