import 'dart:convert';
import 'dart:developer';

import 'package:blue/blocs/branches_cubit/branches_cubit.dart';
import 'package:blue/blocs/coupon_cubit/coupon_cubit.dart';
import 'package:blue/blocs/selected_map_marker_cubit/selected_map_marker_cubit.dart';
import 'package:blue/blocs/tag_cubit/tag_cubit.dart';
import 'package:blue/blocs/theme_cubit/theme_cubit.dart';
import 'package:blue/consts/map_style.dart';
import 'package:blue/models/commerce/commerce.dart';
import 'package:blue/screens/filter/filters_screen.dart';
import 'package:blue/widgets/common/vertical_small_coupon_tile.dart';
import 'package:blue/widgets/loading_indicator/standard_loading_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../blocs/searched_coupons_cubit/searched_coupons_cubit.dart';
import '../../blocs/user_cubit/user_cubit.dart';
import '../../consts/k_icons.dart';

import '../../models/coupon/coupon.dart';
import '../../widgets/common/arc_with_logo.dart';
import '../../widgets/common/cart_icon.dart';
import '../../widgets/common/notification_icon.dart';
import '../search/search_results_screen.dart';

class IndexedSearch extends StatefulWidget {
  const IndexedSearch({Key? key}) : super(key: key);

  @override
  State<IndexedSearch> createState() => _IndexedSearchState();
}

class _IndexedSearchState extends State<IndexedSearch> {

  final ScrollController _categoriesScrollController = ScrollController();

  final _mapUniqueKey = UniqueKey();
  final _allUniqueKey = UniqueKey();

  bool get _isMap => _selectedTab == 0;

  double _heightExtend = 0;
  String _search = "";

  int _selectedTab = 0;

  @override
  void initState() {
    _categoriesScrollController.addListener(_setCategory);
    super.initState();
  }

  @override
  void dispose() {
    _categoriesScrollController.dispose();
    super.dispose();
  }

  void _setCategory(){
    double extendAfter = _categoriesScrollController.position.extentBefore;
    double maxExtend = _categoriesScrollController.position.maxScrollExtent;
    int resultingTab = ((context.read<TagCubit>().state.tags.length + 1) * extendAfter) ~/ maxExtend;
    if(_selectedTab == resultingTab){
      return;
    }
    context.read<CouponCubit>().changeCategoryTo(resultingTab);
    setState((){
      _selectedTab = resultingTab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IndexedStack(
          index: _isMap ? 1 : 0,
          children: [
            AllSearchTab(key: _allUniqueKey, onHeightExtendChanged: (height) => setState((){
              _heightExtend = height;}),),
            Align(
                alignment: Alignment.bottomCenter,
                child: MapSearchTab(key: _mapUniqueKey))
          ],
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
        SafeArea(
          child: Column(children: [
            SizedBox(height: _heightExtend > 30 ? 70 : 120 - _heightExtend),
            Center(
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Row(
                  children: [
                    Flexible(child: TextField(
                      style: TextStyle(color: Colors.black),
                      onChanged: (val){
                        if(_search == val){
                          return;
                        }
                        _search = val;
                        context.read<CouponCubit>().setSearchQuery(val);
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.withOpacity(0.1)), borderRadius: BorderRadius.circular(16)),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.withOpacity(0.1)), borderRadius: BorderRadius.circular(16)),
                          isDense: true,
                          hintText: 'Busqueda de cupones', suffixIcon: Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: SvgPicture.asset(KIcons.search, color: Color(0xFF595CE6),)), suffixIconConstraints: BoxConstraints(maxWidth: 32,maxHeight: 32)),)),
                    SizedBox(width: 10,),
                    InkWell(
                      highlightColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => FiltersScreen(inSearchResultsScreen: true,)));
                      },
                      child: CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.white, child: SvgPicture.asset(KIcons.filter,color: Color(0xFF595CE6),)),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            ((){
              final _tabs = [
                GestureDetector(
                  onTap: (){
                    setState((){
                      _selectedTab = 0;
                      _heightExtend = 0;
                    });
                  },
                  child: Container(width: 40, decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(blurRadius: 18, color: Color(0xFF5D5FEF))
                      ],
                      borderRadius: BorderRadius.circular(8), color: _isMap ? Color(0xFF5D5FEF) : Colors.white),
                    child: Center(
                      child: Image.asset('assets/images/compass.png', width: 24, height: 24, color: _isMap ? Colors.white : Colors.black),
                    ),
                  ),
                ),
                _tab('Todas', KIcons.filter2, 16, _selectedTab == 1, () {
                  context.read<CouponCubit>().changeCategoryTo(0);
                  setState((){_selectedTab = 1;});
                }),
                ...List.generate(context.watch<TagCubit>().state.tags.length, (index) => _tab(context.watch<TagCubit>().state.tags[index].name, null, 16, _selectedTab == index + 2, () {
                  context.read<CouponCubit>().changeCategoryTo(context.read<TagCubit>().state.tags[index].id);
                  setState((){_selectedTab = index + 2;});
                }))
              ].map((e) => Container(margin: EdgeInsets.symmetric(horizontal: 8), child: e,)).toList();
              return SingleChildScrollView(
                controller: _categoriesScrollController,
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.none,
                child: SizedBox(
                  height: 40,
                  child: Row(
                    children: [
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
            SizedBox(height: 15,),
          ],),
        ),
      ],
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
}

class MapSearchTab extends StatefulWidget {

  const MapSearchTab({Key? key}) : super(key: key);

  @override
  State<MapSearchTab> createState() => _MapSearchTabState();
}

class _MapSearchTabState extends State<MapSearchTab> {
  GoogleMapController? _mapController;
  int? _selectedCommerce;
  Set<Marker> _markers = <Marker>{};

  @override
  void initState() {
    super.initState();
    context.read<BranchesCubit>().loadBranches();
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CouponCubit,CouponState>(
      listener: (context,state){
        if(state.status == CouponStateStatus.loaded){
          setState((){
            _markers.clear();
            _markers.addAll(state.markerBranches.map((e) => Marker(
                icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
                markerId: MarkerId(e.id.toString()), position: LatLng(e.lat,e.ln), onTap: (){
              setState((){
                _selectedCommerce = e.commerceId;
                context.read<SelectedMapMarkerCubit>().loadBranchMarkers(e.id!);
              });
            })));
          });
        }
      },
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: BlocListener<ThemeCubit, ThemeState>(
                listener: (context,state){
                  if(state.theme == ThemeMode.light){
                    _mapController?.setMapStyle(null);
                  }else{
                    _mapController?.setMapStyle(jsonEncode(darkMapStyle));
                  }
                },
                child: SizedBox(
                  child: GoogleMap(
                    markers: _markers,
                    onTap: (_){
                      setState((){
                        _selectedCommerce = null;
                        context.read<SelectedMapMarkerCubit>().reset();
                      });
                    },
                    onMapCreated: (controller) async{
                      _mapController = controller;
                      bool isLightTheme = context.read<ThemeCubit>().state.theme == ThemeMode.light;
                      if(!isLightTheme){
                        _mapController?.setMapStyle(jsonEncode(darkMapStyle));
                      }
                      setState((){});
                    },
                    zoomControlsEnabled: false,
                    initialCameraPosition: CameraPosition(target: LatLng(5,6)),
                  ),
                ),
              ),
            ),
          ),
          _selectedCommerce == null ? Container() : BlocBuilder<SelectedMapMarkerCubit,SelectedMapMarkerState>(
            builder: (context,state) => state.markerCoupons.isEmpty ? Container() : Align(
                alignment: Alignment.bottomCenter,
                child: Container(margin: EdgeInsets.only(bottom: 90), height: 130, child: CarouselSlider.builder(
                  itemCount: state.markerCoupons.length,
                  options: CarouselOptions(
                    disableCenter: true,
                    viewportFraction: 0.9,
                    enlargeCenterPage: false,
                    padEnds: false,
                    enableInfiniteScroll: false,
                    height: 140
                  ),
                  itemBuilder: (context, i, j){
                    return Container(
                        margin: state.markerCoupons.length == 1 ? EdgeInsets.only(left: 10) : EdgeInsets.only(left: i == 0 ? 10 : 5, right: i == state.markerCoupons.length - 1 ? 20 : 5),
                        child: VerticalSmallCouponTile(coupon: state.markerCoupons[i], withHeart: false,));
                  },
                ),)),
          )
        ],
      ),
    );
  }
}


class AllSearchTab extends StatefulWidget {
  final Function(double) onHeightExtendChanged;
  const AllSearchTab({Key? key, required this.onHeightExtendChanged}) : super(key: key);

  @override
  State<AllSearchTab> createState() => _AllSearchTabState();
}

class _AllSearchTabState extends State<AllSearchTab> {
  final ScrollController _allScrollController = ScrollController();
  bool _allLoading = false;

  @override
  void initState() {
    super.initState();
    _allScrollController.addListener(_loadMoreAllCoupones);
  }

  void _loadMoreAllCoupones(){
    widget.onHeightExtendChanged.call(_allScrollController.position.extentBefore);
    if(_allLoading){
      return;
    }
    if(_allScrollController.position.extentAfter < 200){
      _allLoading = true;
      context.read<CouponCubit>().loadNewCoupons().then((value) => _allLoading = false);
    }
  }

  @override
  void dispose() {
    _allScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _allScrollController,
      child: Column(
        children: [
          SizedBox(height: 250,),
          BlocBuilder<CouponCubit,CouponState>(
            builder: (context,state) => state.status == CouponStateStatus.loading ? Container(
                margin: EdgeInsets.only(top: 20),
                child: StandardLoadingIndicator()) : Column(
              children: [
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.categoryCoupons.length,
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                          margin: EdgeInsets.only(bottom: 15,),
                          child: VerticalSmallCouponTile(coupon: state.categoryCoupons[i]));
                    }),
                SizedBox(height: 60,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

