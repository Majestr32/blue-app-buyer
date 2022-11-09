import 'package:blue/blocs/searched_coupons_cubit/searched_coupons_cubit.dart';
import 'package:blue/screens/filter/filters_screen.dart';
import 'package:blue/widgets/loading_indicator/standard_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../blocs/coupon_cubit/coupon_cubit.dart';
import '../../blocs/tag_cubit/tag_cubit.dart';
import '../../blocs/user_cubit/user_cubit.dart';
import '../../consts/k_icons.dart';
import '../../widgets/common/arc_with_logo.dart';
import '../../widgets/common/cart_icon.dart';
import '../../widgets/common/notification_icon.dart';
import '../../widgets/common/vertical_small_coupon_tile.dart';

class SearchResultsScreen extends StatefulWidget {
  final bool categorySearch;
  const SearchResultsScreen({this.categorySearch = false,Key? key}) : super(key: key);

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen>{

  final ScrollController _allScrollController = ScrollController();
  late final _searchTextFieldController = TextEditingController(text: context.read<SearchedCouponsCubit>().state.searchQuery);
  late String _searchQuery = context.read<SearchedCouponsCubit>().state.searchQuery;

  double _heightExtend = 0;
  bool _allLoading = false;
  int _selectedTab = 0;

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
    _searchTextFieldController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _allScrollController,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 220,),
                context.watch<SearchedCouponsCubit>().state.status != SearchedCouponsStateStatus.loaded ? StandardLoadingIndicator() : _all(context)
              ],
            ),
          ),
          ArcWithLogo(heightExtend: _heightExtend, withArrow: true,),
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
          widget.categorySearch ? Container() : AnimatedOpacity(
            opacity: _heightExtend > 50 ? 0 : _heightExtend < 0 ? 1 : 1 - _heightExtend / 50,
            duration: Duration(milliseconds: 80),
            child: _heightExtend > 50 ? Container() : Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Container(margin: const EdgeInsets.only(top: 120), child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Row(
                      children: [
                        Flexible(child: TextField(
                          controller: _searchTextFieldController,
                          style: TextStyle(color: Colors.black),
                          onChanged: (val){
                            if(_searchQuery == val){
                              return;
                            }
                            _searchQuery = val;
                            context.read<SearchedCouponsCubit>().setSearchQuery(val);
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
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => FiltersScreen(inSearchResultsScreen: true,)));
                          },
                          child: CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.white, child: SvgPicture.asset(KIcons.filter, color: const Color(0xFF595CE6),),),
                        )
                      ],
                    ),
                  ),),
                  SizedBox(height: 15,),
                  ((){
                    final _tabs = [
                      _tab('Todas', KIcons.filter2, 16, _selectedTab == 0, () {
                        context.read<SearchedCouponsCubit>().changeCategoryTo(0);
                        setState((){_selectedTab = 0;});
                      }),
                      ...List.generate(context.watch<TagCubit>().state.activeTags.length, (index) => _tab(context.watch<TagCubit>().state.activeTags[index].name, null, 16, _selectedTab == index + 1, () {
                        context.read<SearchedCouponsCubit>().changeCategoryTo(context.read<TagCubit>().state.activeTags[index].id);
                        setState((){_selectedTab = index + 1;});
                      }))
                    ].map((e) => Container(margin: EdgeInsets.symmetric(horizontal: 8), child: e,)).toList();
                      return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      clipBehavior: Clip.none,
                      child: SizedBox(
                        height: 40,
                        child: Row(
                          children: [
                            SizedBox(width: 20,),
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: _tabs.length,
                                physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, i){
                                  return _tabs[i];
                                }),
                            SizedBox(width: 20,)
                          ],
                        ),
                      ),
                    );
                  }()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tab(String title, String? iconPath, double iconSize, bool active, VoidCallback onTap){
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: active ? Color(0xFF5D5FEF) : Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 5)
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              iconPath == null ? Container() : SvgPicture.asset(iconPath, color: active ? Colors.white : Color(0xFF5D5FEF), width: iconSize, height: iconSize,),
              SizedBox(width: 4,),
              Text(title, style: TextStyle(color: active ? Colors.white : Color(0xFF3E4462), fontFamily: 'Outfit', fontSize: 12),),
            ],
          )),
    );
  }

  Widget _all(BuildContext context){
    return BlocBuilder<SearchedCouponsCubit,SearchedCouponsState>(
          builder: (context,state) => Column(
            children: [
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                  itemCount: state.categoryCoupons.length,
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                        margin: EdgeInsets.only(bottom: 20),
                        child: VerticalSmallCouponTile(coupon: state.categoryCoupons[i]));
                  }),
              SizedBox(height: 60,),
            ],
          ),
    );
  }
}
