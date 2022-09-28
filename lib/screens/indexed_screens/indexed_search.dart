import 'dart:convert';
import 'dart:developer';

import 'package:blue/blocs/coupon_cubit/coupon_cubit.dart';
import 'package:blue/blocs/theme_cubit/theme_cubit.dart';
import 'package:blue/consts/map_style.dart';
import 'package:blue/models/commerce/commerce.dart';
import 'package:blue/screens/filter/filters_screen.dart';
import 'package:blue/widgets/common/vertical_small_coupon_tile.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../blocs/searched_coupons_cubit/searched_coupons_cubit.dart';
import '../../consts/k_icons.dart';

import '../../models/coupon/coupon.dart';
import '../../widgets/common/arc_with_logo.dart';
import '../search/search_results_screen.dart';

class IndexedSearch extends StatefulWidget {
  const IndexedSearch({Key? key}) : super(key: key);

  @override
  State<IndexedSearch> createState() => _IndexedSearchState();
}

class _IndexedSearchState extends State<IndexedSearch> {

  final _mapUniqueKey = UniqueKey();
  final _allUniqueKey = UniqueKey();

  double _heightExtend = 0;

  int _selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ArcWithLogo(heightExtend: _heightExtend,),
        IndexedStack(
          index: _selectedTab,
          children: [
            AllSearchTab(key: _allUniqueKey, onHeightExtendChanged: (height) => setState((){
              _heightExtend = height;}),),
            Align(
                alignment: Alignment.bottomCenter,
                child: MapSearchTab(key: _mapUniqueKey))
          ],
        ),
        SafeArea(
          child: Column(children: [
            SizedBox(height: _heightExtend > 100 ? 0 : 100 - _heightExtend),
            Center(
              child: Container( child: SizedBox(
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
                          padding: EdgeInsets.only(right: 10),
                          child: SvgPicture.asset(KIcons.search, color: Color(0xFF595CE6),)), suffixIconConstraints: BoxConstraints(maxWidth: 32,maxHeight: 32)),)),
                    SizedBox(width: 10,),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => FiltersScreen(inSearchResultsScreen: false,)));
                      },
                      child: CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.white, child: SvgPicture.asset(KIcons.filter,color: Color(0xFF595CE6),)),
                    )
                  ],
                ),
              ),),
            ),
            SizedBox(height: 15,),
            ((){
              final _tabs = [
                _tab('Todas', KIcons.filter2, 24, _selectedTab == 0, () => setState((){_selectedTab = 0;})),
                _tab('Viajes', KIcons.currentLocation, 18, _selectedTab == 1, () => setState((){_selectedTab = 1;}))
              ].map((e) => Container(margin: EdgeInsets.symmetric(horizontal: 5), child: e,)).toList();
              return SizedBox(
                height: 40,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 2,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i){
                      return _tabs[i];
                    }),
              );
            }()),
            SizedBox(height: 15,),
          ],),
        ),
      ],
    );
  }

  Widget _tab(String title, String iconPath, double iconSize, bool active, VoidCallback onTap){
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: active ? Color(0xFF5D5FEF) : Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 5)
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              SvgPicture.asset(iconPath, color: active ? Colors.white : Color(0xFF5D5FEF), width: iconSize, height: iconSize,),
              SizedBox(width: 4,),
              Text(title, style: TextStyle(color: active ? Colors.white : Color(0xFF3E4462), fontFamily: 'Outfit'),),
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
  Commerce? _selectedCommerce;
  List<Coupon> _commerceCoupons = [];
  Set<Marker> _markers = <Marker>{};

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
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
                      _commerceCoupons = [];
                    });
                  },
                  onMapCreated: (controller) async{
                    _mapController = controller;
                    bool isLightTheme = context.read<ThemeCubit>().state.theme == ThemeMode.light;
                    if(!isLightTheme){
                      _mapController?.setMapStyle(jsonEncode(darkMapStyle));
                    }
                    do{
                      await Future.delayed(Duration(seconds: 1));
                    }while(context.read<CouponCubit>().state.status == CouponStateStatus.initial);
                      for(int i = 0; i < context.read<CouponCubit>().state.newCoupons.length; i++){
                        final commerce = context.read<CouponCubit>().state.newCoupons[i].commerce;
                        _markers.add(Marker(markerId: MarkerId(commerce.id.toString()), position: LatLng(commerce.lat,commerce.ln), onTap: (){
                          setState((){
                            _selectedCommerce = commerce;
                            _commerceCoupons = context.read<CouponCubit>().state.newCoupons.where((element) => element.commerceId == _selectedCommerce!.id).toList();
                          });
                        }));
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
        _selectedCommerce == null ? Container() : Align(
            alignment: Alignment.bottomCenter,
            child: Container(margin: EdgeInsets.only(bottom: 90), height: 140, child: CarouselSlider.builder(
              itemCount: _commerceCoupons.length,
              options: CarouselOptions(
                viewportFraction: 0.95,
                enableInfiniteScroll: false,
                height: 140
              ),
              itemBuilder: (context, i, j){
                return VerticalSmallCouponTile(coupon: _commerceCoupons[i]);
              },
            ),))
      ],
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
          SizedBox(height: 220,),
          BlocBuilder<CouponCubit,CouponState>(
            builder: (context,state) => Column(
              children: [
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.newCoupons.length,
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      return Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: VerticalSmallCouponTile(coupon: state.newCoupons[i]));
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

