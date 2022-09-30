import 'package:blue/blocs/commerce_cubit/commerce_cubit.dart';
import 'package:blue/models/commerce/commerce.dart';
import 'package:blue/repositories/commerce/commerce_repository.dart';
import 'package:blue/widgets/common/arc_with_logo.dart';
import 'package:blue/widgets/common/branch_tile.dart';
import 'package:blue/widgets/common/vertical_small_coupon_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../blocs/coupon_cubit/coupon_cubit.dart';
import '../../consts/k_icons.dart';
import '../../widgets/common/horizontal_coupon_tile.dart';

class CompanyDetails extends StatefulWidget {
  final Commerce commerce;
  const CompanyDetails({required this.commerce,Key? key}) : super(key: key);

  @override
  State<CompanyDetails> createState() => _CompanyDetailsState();
}

class _CompanyDetailsState extends State<CompanyDetails> {

  int _currentTag = 0;
  double _heightExtend = 0;
  final _scrollController = ScrollController();
  bool _showItems = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scroll);
    context.read<CommerceCubit>().loadCommerceDetails(widget.commerce.id);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
          ArcWithLogo(withArrow: true, heightExtend: _heightExtend,),
          Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(children: [
                const SizedBox(height: 120,),
                const Text('COMERCIO', style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w500, fontSize: 16),),
                const SizedBox(height: 15,),
                CircleAvatar(radius: 64, backgroundColor: const Color(0xFF3D5BF6), child: CircleAvatar(radius: 62,backgroundImage: Image.network(widget.commerce.logoUrl).image,),),
                const SizedBox(height: 15,),
                Text(widget.commerce.name, style: const TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w700, fontSize: 24),),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    'Sobre',
                    'Cupones',
                    'Reseñas',
                  ].asMap().entries.map((e) => GestureDetector(
                      onTap: (){
                        setState((){
                          _currentTag = e.key;
                        });
                      },
                      child: Column(
                        children: [
                          Text(e.value, style: TextStyle(fontFamily: 'Outfit', color: _currentTag == e.key ? const Color(0xFF3D5BF6) : null, fontWeight: FontWeight.w400, fontSize: 20),),
                          _currentTag == e.key ? Container(height: 2, width: 100, color: const Color(0xFF3D5BF6)) : Container(),
                        ],
                      ))).toList(),
                ),
                const SizedBox(height: 30,),
                ((){
                  switch(_currentTag){
                    case 0:
                      return _companyInformationTab();
                    case 1:
                      return _companyCoupons();
                    default:
                      return Container();
                  }
                }())
              ],),
            ),
          )
        ],
      ),
    );
  }

  Widget _companyCoupons(){
    return context.watch<CommerceCubit>().state.status == CommerceStateStatus.initial ? Container() : Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: const Align(
              alignment: Alignment.centerLeft,
              child: Text('Cupón Más Vendido', style: TextStyle(fontSize: 16, fontFamily: 'Outfit', fontWeight: FontWeight.w600),)),
        ),
        const SizedBox(height: 15,),
        VerticalSmallCouponTile(coupon: context.watch<CommerceCubit>().state.mostRatedCoupon!),
        const SizedBox(height: 15,),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: const Align(
              alignment: Alignment.centerLeft,
              child: Text('Otros cupones', style: TextStyle(fontSize: 16, fontFamily: 'Outfit', fontWeight: FontWeight.w600),)),
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
    );
  }

  Widget _companyInformationTab(){
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Información del comercio', style: TextStyle(fontSize: 14, fontFamily: 'Outfit', fontWeight: FontWeight.w600),),
              Text(widget.commerce.description, style: const TextStyle(fontWeight: FontWeight.w200, fontFamily: 'Outfit', fontSize: 14),),
              const SizedBox(height: 20,),
              _infoTile(KIcons.location, 'Locación', widget.commerce.location),
              const SizedBox(height: 10,),
              _infoTile(KIcons.profile, 'Miembro desde', widget.commerce.createdAt.toString()),
              const SizedBox(height: 10,),
              _infoTile(KIcons.send, 'Cupones canjeados', widget.commerce.couponsSold.toString()),
            ],
          ),
        ),
        SizedBox(height: 15,),
        _dropdown(context),
        SizedBox(height: 30,),
      ],
    );
  }

  Widget _dropdown(BuildContext context){
    return Container(
      width: double.infinity,
      color: Theme.of(context).splashColor,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Sucursales', style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w500),),
              Spacer(),
              Text('(${context.watch<CommerceCubit>().state.branches.length} Sucursales)', style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w300),),
              SizedBox(width: 10,),
              InkWell(
                onTap: (){
                  setState((){
                    _showItems = !_showItems;
                  });
                },
                child: Container(
                  width: 16,
                  height: 16,
                  child: AnimatedRotation(
                      turns: _showItems ? 0.25 : 0.75,
                      duration: Duration(milliseconds: 300),
                      child: SvgPicture.asset(KIcons.directionLeft, color: Theme.of(context).highlightColor,)),
                ),
              )
            ],
          ),
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
