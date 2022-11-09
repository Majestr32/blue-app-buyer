import 'dart:developer';

import 'package:blue/blocs/commerce_cubit/commerce_cubit.dart';
import 'package:blue/models/commerce/commerce.dart';
import 'package:blue/repositories/commerce/commerce_repository.dart';
import 'package:blue/utils/utils.dart';
import 'package:blue/widgets/common/arc_with_logo.dart';
import 'package:blue/widgets/common/branch_tile.dart';
import 'package:blue/widgets/common/vertical_small_coupon_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../blocs/coupon_cubit/coupon_cubit.dart';
import '../../blocs/theme_cubit/theme_cubit.dart';
import '../../consts/k_icons.dart';
import '../../widgets/common/horizontal_coupon_tile.dart';
import '../../widgets/common/review_tile.dart';

class CompanyDetails extends StatefulWidget {
  final Commerce commerce;
  const CompanyDetails({required this.commerce,Key? key}) : super(key: key);

  @override
  State<CompanyDetails> createState() => _CompanyDetailsState();
}

class _CompanyDetailsState extends State<CompanyDetails> with SingleTickerProviderStateMixin{

  double _heightExtend = 0;
  final _scrollController = ScrollController();
  List<String> _tabs = [
    'Sobre',
    'Cupones',
    'Reseñas'
  ];
  late final _tabController = TabController(length: _tabs.length, vsync: this);
  bool _showItems = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scroll);
    _tabController.addListener(_updateTab);
    context.read<CommerceCubit>().loadCommerceDetails(widget.commerce.id);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void _updateTab(){
    setState((){
    });
  }
  void _scroll(){
    setState((){
      _heightExtend = _scrollController.position.extentBefore;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: [
          NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder: (context,value) => [SliverToBoxAdapter(
              child: Column(children: [
                const SizedBox(height: 170,),
                CircleAvatar(radius: 64, backgroundColor: const Color(0xFF3D5BF6), child: CircleAvatar(radius: 62,backgroundImage: Image.network(widget.commerce.logoUrl).image,),),
                const SizedBox(height: 15,),
                Text(widget.commerce.name, textAlign: TextAlign.center, style: const TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w700, fontSize: 24),),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('UID: ', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'Outfit'),),
                    Text(widget.commerce.id.toString(), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, fontFamily: 'Outfit'),),
                    const SizedBox(width: 5,),
                    SvgPicture.asset(KIcons.link),
                  ],
                ),
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(KIcons.starFilled),
                    const SizedBox(width: 2,),
                    Text(widget.commerce.avgRating.toString(), style: const TextStyle(color: Color(0xFFFFE500), fontFamily: 'Outfit', fontWeight: FontWeight.w700),),
                    const SizedBox(width: 2,),
                    Text("(${widget.commerce.reviewsCount})", style: const TextStyle(color: Color(0xFF898A8D), fontFamily: 'Outfit'),),
                  ],
                ),
                const SizedBox(height: 10,),
                Theme(
                  data: ThemeData(
                    splashColor: Colors.grey.withOpacity(0.3)
                  ),
                  child: TabBar(
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
                    indicatorColor: const Color(0xFF3D5BF6),
                    controller: _tabController,
                    tabs: _tabs.asMap().entries.map((e) => Tab(
                      height: 23,
                      child: Text(e.value, style: TextStyle(fontFamily: 'Outfit', color: _tabController.index == e.key ? const Color(0xFF3D5BF6) : Theme.of(context).highlightColor, fontWeight: FontWeight.w400, fontSize: 18),),
                    )).toList(),
                  ),
                ),
                const SizedBox(height: 30,),
    ]),
            ),],
            body: TabBarView(
                controller: _tabController,
                children: [
                  _companyInformationTab(),
                  _companyCoupons(),
                  _reviews()
                ]),
          ),
          ArcWithLogo(withArrow: true, heightExtend: _heightExtend,),
          _heightExtend > 20 ? Container() : Align(
              alignment: Alignment.topCenter,
              child: Container(margin: EdgeInsets.only(top: 120), child: const Text('COMERCIO', style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w500, color: Colors.white, fontSize: 16),),))
        ],
      ),
    );
  }

  Widget _reviews(){
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.85,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Text('${context.watch<CommerceCubit>().state.reviews.length} reseñas', style: TextStyle(fontSize: 18, fontFamily: 'Outfit', fontWeight: FontWeight.w400),),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: context.watch<CommerceCubit>().state.reviews.length,
                    itemBuilder: (context, i) => ReviewTile(review: context.watch<CommerceCubit>().state.reviews[i]),),
                ),
              ),
              SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }

  Widget _companyCoupons(){
    return context.watch<CommerceCubit>().state.status == CommerceStateStatus.initial ? Container() : SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            child: const Align(
                alignment: Alignment.centerLeft,
                child: Text('Cupón Más Vendido', style: TextStyle(fontSize: 16, fontFamily: 'Outfit', fontWeight: FontWeight.w400),)),
          ),
          const SizedBox(height: 15,),
          VerticalSmallCouponTile(coupon: context.watch<CommerceCubit>().state.mostRatedCoupon!),
          const SizedBox(height: 15,),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: const Align(
                alignment: Alignment.centerLeft,
                child: Text('Otros cupones', style: TextStyle(fontSize: 16, fontFamily: 'Outfit', fontWeight: FontWeight.w400),)),
          ),
          const SizedBox(height: 15,),
          SizedBox(
            height: 300,
            child: ListView.builder(
              clipBehavior: Clip.none,
                itemCount: context.watch<CommerceCubit>().state.coupons.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) => HorizontalCouponTile(coupon: context.watch<CommerceCubit>().state.coupons[i],)),
          ),
          const SizedBox(height: 15,),
        ],
      ),
    );
  }

  Widget _companyInformationTab(){
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Información del comercio', style: TextStyle(fontSize: 14, fontFamily: 'Outfit', fontWeight: FontWeight.w600),),
                Text(widget.commerce.description, style: const TextStyle(fontWeight: FontWeight.w200, fontFamily: 'Outfit', fontSize: 14),),
                const SizedBox(height: 20,),
                _infoTile(KIcons.location, 'Locación', widget.commerce.location),
                const SizedBox(height: 10,),
                _infoTile(KIcons.profile, 'Miembro desde', formatDate(widget.commerce.createdAt)),
                const SizedBox(height: 10,),
                _infoTile(KIcons.send, 'Cupones canjeados', widget.commerce.couponsSold.toString()),
              ],
            ),
          ),
          SizedBox(height: 15,),
          _dropdown(context),
          SizedBox(height: 30,),
        ],
      ),
    );
  }

  Widget _dropdown(BuildContext context){
    return context.watch<CommerceCubit>().state.branches.isEmpty ? Container() : GestureDetector(
      onTap: (){
        setState((){
          _showItems = !_showItems;
        });
        if(_showItems){
          _scrollController.animateTo(_scrollController.offset + 200, duration: Duration(seconds: 1), curve: Curves.decelerate);
        }
      },
      child: Material(
        color: Colors.transparent,
        elevation: 0,
        child: Container(
          width: double.infinity,
          color: context.watch<ThemeCubit>().state.theme == ThemeMode.light ? Colors.white : Theme.of(context).splashColor,
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Sucursales', style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w500),),
                  Spacer(),
                  Text('(${context.watch<CommerceCubit>().state.branches.length} Sucursales)', style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w300),),
                  SizedBox(width: 10,),
                  Container(
                    width: 16,
                    height: 16,
                    child: AnimatedRotation(
                        turns: _showItems ? 0.25 : 0.75,
                        duration: Duration(milliseconds: 300),
                        child: SvgPicture.asset(KIcons.directionLeft, color: Theme.of(context).highlightColor,)),
                  )
                ],
              ),
              SizedBox(height: 15,),
              Divider(),
              !_showItems ? Container() : ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: context.watch<CommerceCubit>().state.branches.length,
                  itemBuilder: (context,i) {
                    return Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: BranchTile(branch: context.watch<CommerceCubit>().state.branches[i],));
                  })
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoTile(String iconPath, String title, String subtitle){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(iconPath, color: const Color(0xFFB5B5B5),),
            const SizedBox(width: 10,),
            Text(title, style: const TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w400, color: Color(0xFFB5B5B5), fontSize: 16),)
          ],
        ),
        Padding(
            padding: const EdgeInsets.only(left: 33),
            child: Text(subtitle, style: const TextStyle(fontFamily: 'Outfit', fontSize: 18, fontWeight: FontWeight.w500),))
      ],
    );
  }
}
