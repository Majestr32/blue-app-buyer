import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:blue/blocs/branches_cubit/branches_cubit.dart';
import 'package:blue/blocs/coupon_cubit/coupon_cubit.dart';
import 'package:blue/blocs/selected_map_marker_cubit/selected_map_marker_cubit.dart';
import 'package:blue/blocs/tag_cubit/tag_cubit.dart';
import 'package:blue/blocs/theme_cubit/theme_cubit.dart';
import 'package:blue/consts/map_style.dart';
import 'package:blue/screens/filter/filters_screen.dart';
import 'package:blue/widgets/common/vertical_small_coupon_tile.dart';
import 'package:blue/widgets/loading_indicator/standard_loading_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../blocs/user_cubit/user_cubit.dart';
import '../../consts/k_icons.dart';
import 'package:blue/utils/utils.dart';
import 'package:custom_marker/marker_icon.dart';

import '../../utils/refreshables.dart';
import '../../widgets/common/arc_with_logo.dart';
import '../../widgets/common/cart_icon.dart';
import '../../widgets/common/notification_icon.dart';

class IndexedSearch extends StatefulWidget {
  const IndexedSearch({Key? key}) : super(key: key);

  @override
  State<IndexedSearch> createState() => _IndexedSearchState();
}

class _IndexedSearchState extends State<IndexedSearch> with SingleTickerProviderStateMixin{
  final _mapUniqueKey = UniqueKey();
  final _allUniqueKey = UniqueKey();

  late final _tabController = TabController(length: context.read<TagCubit>().state.activeTags.length + 1, vsync: this);
  final _horizontalController = ScrollController();

  bool _isMap = false;

  double _heightExtend = 0;
  String _search = "";

  @override
  void initState() {
    super.initState();
    _tabController.addListener(_updateTab);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _horizontalController.dispose();
    super.dispose();
  }

  void _updateTab(){
    if(_tabController.index == 0){
      context.read<CouponCubit>().changeCategoryTo(0);
    }else{
      context.read<CouponCubit>().changeCategoryTo(context.read<TagCubit>().state.activeTags[_tabController.index - 1].id);
    }

    _horizontalController.animateTo(_horizontalController.position.maxScrollExtent * (_tabController.index / context.read<TagCubit>().state.activeTags.length), duration: Duration(milliseconds: 300), curve: Curves.bounceIn);
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          IndexedStack(
            index: _isMap ? 1 : 0,
            children: [
              AllSearchTab(key: _allUniqueKey, tabController: _tabController, onHeightExtendChanged: (height) => setState((){
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
              ((){
                final _tabs = [
                  _tab('Todas', KIcons.filter2, 16, _tabController.index == 0, () {
                    setState((){_tabController.index = 0;});
                  }),
                  ...List.generate(context.watch<TagCubit>().state.activeTags.length, (index) => _tab(context.watch<TagCubit>().state.activeTags[index].name, null, 16, _tabController.index == index + 1, () {
                    setState((){_tabController.index = index + 1;});
                  }))
                ].map((e) => Tab(
                    child: e)).toList();
                return SingleChildScrollView(
                  controller: _horizontalController,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(width: 15,),
                      GestureDetector(
                        onTap: (){
                          setState((){
                            _isMap = !_isMap;
                          });
                        },
                        child: Container(width: 40, height: 40, decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(blurRadius: 18, color: Color(0xFF5D5FEF))
                            ],
                            borderRadius: BorderRadius.circular(8), color: _isMap ? Color(0xFF5D5FEF) : Colors.white),
                          child: Center(
                            child: Image.asset('assets/images/compass.png', width: 24, height: 24, color: _isMap ? Colors.white : Colors.black),
                          ),
                        ),
                      ),
                      TabBar(
                        padding: EdgeInsets.symmetric(vertical: 25),
                        indicatorColor: Colors.transparent,
                        controller: _tabController,
                        tabs: _tabs,
                        isScrollable: true,
                      ),
                    ],
                  ),
                );
              }()),
              SizedBox(height: 15,),
            ],),
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
        height: 40,
          padding: EdgeInsets.symmetric(horizontal: 10),
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

  //To count if user applied filters
  int previousMarkersCount = 0;

  final Set<Marker> _markers = <Marker>{};

  double posX = 0;
  double posY = 0;
  double diffX = 0;
  double diffY = 0;

  double zoom = 2;

  double get rangeMinX => posX - diffX / 2;
  double get rangeMaxX => posX + diffX / 2;
  double get rangeMinY => posY - diffY / 2;
  double get rangeMaxY => posY + diffY / 2;

  late final Timer _mapUpdateCoolDown;

  @override
  void initState() {
    super.initState();
    context.read<BranchesCubit>().loadBranches();
    //_mapUpdateCoolDown = Timer.periodic(const Duration(seconds: 1), (timer) {
    //  if(previousMarkersCount != _markers.length){
    //    _scrollToNearestResult();
    //    previousMarkersCount = _markers.length;
    //  }
    //  final foundMarkers = _markers.where((element) => (element.position.longitude <= rangeMaxX && element.position.longitude >= rangeMinX) && (element.position.latitude <= rangeMaxY && element.position.latitude >= rangeMinY));
    //  if(foundMarkers.isEmpty){
    //    setState((){
    //      _selectedCommerce = null;
    //    });
    //    return;
    //  }
    //  final foundMarker = foundMarkers.first;
    //  setState((){
    //    _selectedCommerce = 0;
    //    final branches = context.read<CouponCubit>().state.markerBranches;
    //    final marker = branches.firstWhere((element) => element.lat == foundMarker.position.latitude && element.ln == foundMarker.position.longitude);
    //    context.read<SelectedMapMarkerCubit>().loadBranchMarkers(marker.id!);
    //  });
    //});
  }

  @override
  void dispose() {
    _mapController?.dispose();
    _mapUpdateCoolDown.cancel();
    super.dispose();
  }

  void _scrollToNearestResult(){
    if(_markers.isEmpty){
      return;
    }
    final userPos = context.read<SelectedMapMarkerCubit>().state.currentPosition;
    if(userPos == null){
      _mapController?.moveCamera(CameraUpdate.newLatLngZoom(_markers.first.position, 12));
      return;
    }
    final userLatLng = LatLng(userPos.latitude, userPos.longitude);
    double minDist = distanceBetweenMapMarkers(userLatLng,_markers.first.position);
    LatLng moveTo = _markers.first.position;

    for (var marker in _markers){
      final distance = distanceBetweenMapMarkers(marker.position, userLatLng);
      if(distance < minDist){
        minDist = distance;
        moveTo = marker.position;
      }
    }

    _mapController?.moveCamera(CameraUpdate.newLatLngZoom(moveTo, 12));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CouponCubit,CouponState>(
      listener: (context,state)async{
        if(state.status == CouponStateStatus.loaded){
          final asyncMarkers = await Stream.fromIterable(state.markerBranches.map((e) async => Marker(
              icon: await MarkerIcon.downloadResizePictureCircle(e.logoUrl!, size: 120, addBorder: true, borderSize: 20),
              markerId: MarkerId(e.id.toString()), position: LatLng(e.lat,e.ln), onTap: (){
            setState((){
              _selectedCommerce = 0;
            });
            context.read<SelectedMapMarkerCubit>().loadBranchMarkers(e.id!, query: state.searchQuery, minPrice: state.minPrice, maxPrice: state.maxPrice, favs: state.selectedCategory == 0 ? null : [state.selectedCategory]);
          }))).asyncMap((event) => event).toList();
          log(asyncMarkers.length.toString());
          setState((){
            _markers.clear();
            _markers.addAll(asyncMarkers);
            _scrollToNearestResult();
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
                    onCameraMove: (pos){
                      //posX = pos.target.longitude;
                      //posY = pos.target.latitude;
                      //diffX = 180 / pos.zoom;
                      //diffY = 90 / pos.zoom;
                      //zoom = zoom;
                    },
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
  final TabController tabController;
  const AllSearchTab({Key? key, required this.onHeightExtendChanged, required this.tabController}) : super(key: key);

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
    widget.tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: widget.tabController,
      children: List.generate(widget.tabController.length, (index) => SingleChildScrollView(
        physics: BouncingScrollPhysics(),
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
      ),)
    );
  }
}

