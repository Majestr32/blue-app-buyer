import 'dart:async';

import 'package:blue/blocs/theme_cubit/theme_cubit.dart';
import 'package:blue/blocs/user_cubit/user_cubit.dart';
import 'package:blue/models/coupon/coupon.dart';
import 'package:blue/screens/cart/cart_screen.dart';
import 'package:blue/screens/checkout/checkout_screen.dart';
import 'package:blue/screens/details/company_details.dart';
import 'package:blue/screens/rating/rating_screen.dart';
import 'package:blue/utils/utils.dart';
import 'package:blue/widgets/common/review_tile.dart';
import 'package:blue/widgets/error/error_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../blocs/coupon_cubit/coupon_cubit.dart';
import '../../blocs/coupon_reviews_cubit/coupon_reviews_cubit.dart';
import '../../consts/k_icons.dart';
import '../../widgets/common/arc_with_logo.dart';
import '../../widgets/common/branch_tile.dart';
import '../../widgets/common/cart_icon.dart';
import '../../widgets/common/horizontal_coupon_tile.dart';
import '../../widgets/common/notification_icon.dart';
import '../../widgets/common/vertical_small_coupon_tile.dart';

class TicketDetails extends StatefulWidget {
  final Coupon coupon;
  final String tag;
  const TicketDetails({required this.coupon,required this.tag,Key? key}) : super(key: key);

  @override
  State<TicketDetails> createState() => _TicketDetailsState();
}

class _TicketDetailsState extends State<TicketDetails> {
  DateTime _now = DateTime.now();
  final _scrollController = ScrollController();
  double _heightExtend = 0;
  int _selectedIndex = 0;

  bool _showBranches = false;
  bool _showTermsAndConditions = false;
  bool _showFaqs = false;

  late final Timer _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CouponCubit>().addCouponToHistory(widget.coupon.id);
    context.read<CouponReviewsCubit>().loadComments(widget.coupon.id);
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState((){
        _now = DateTime.now();
      });
    });
    _scrollController.addListener(_scroll);
  }
  void _scroll(){
    setState((){
      _heightExtend = _scrollController.position.extentBefore;
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      SizedBox(height: 200,),
                      CarouselSlider.builder(
                        options: CarouselOptions(viewportFraction: 1, height: 240, onPageChanged: (index,_){
                          setState((){
                            _selectedIndex = index;
                          });
                        }),
                        itemCount: widget.coupon.posterUrls.length,
                        itemBuilder: (context, i, j) => Container(width: MediaQuery.of(context).size.width * 0.9, height: 240, decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24)
                        ), child: Padding(
                            padding: EdgeInsets.all(5),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Hero(
                                    tag: widget.tag,
                                    child: Image.network(widget.coupon.posterUrls[i], fit: BoxFit.cover, errorBuilder: (context,obj,stacktrace) => ErrorImage(),))))),
                      ),
                        SizedBox(height: 10,),
                        _dots(widget.coupon.posterUrls.length),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          InkWell(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => CompanyDetails(commerce: widget.coupon.commerce)));
                              },
                              child: CircleAvatar(radius: 18, backgroundColor: Colors.grey, backgroundImage: Image.network(widget.coupon.commerce.logoUrl, errorBuilder: (context,obj,stacktrace) => ErrorImage(),).image)),
                          SizedBox(width: 10,),
                          GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => CompanyDetails(commerce: widget.coupon.commerce)));
                              },
                              child: Text(widget.coupon.commerce.name, style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w500, fontSize: 12),)),
                          Spacer(),
                          SvgPicture.asset(KIcons.starFilled, width: 16, height: 16,),
                          SizedBox(width: 2,),
                          Text(widget.coupon.avgRating.toString(), style: TextStyle(color: Color(0xFFFFE500), fontSize: 16, fontFamily: 'Outfit', fontWeight: FontWeight.w700),),
                          SizedBox(width: 2,),
                          Text("(${widget.coupon.reviewsCount})", style: TextStyle(color: Color(0xFF898A8D), fontSize: 12, fontFamily: 'Outfit'),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Text(widget.coupon.name, style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w500, fontSize: 20),),
                        SizedBox(height: 24,),
                        Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${widget.coupon.commerce.couponsSold} Vendidos', style: TextStyle(color: context.watch<ThemeCubit>().state.theme == ThemeMode.light ? Color(0xFFB5B5B5) : Colors.white, fontFamily: 'Outfit', fontWeight: FontWeight.w400, fontSize: 16),),
                              SizedBox(height: 3,),
                              Text('Termina en: \n${_formattedDate(widget.coupon.campaignEnding, _now)}', style: TextStyle(fontFamily: 'Outfit', color: Colors.red, fontWeight: FontWeight.w400, fontSize: 12),)
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              widget.coupon.discount == null ? Row(children: [
                                SizedBox(width: 4,),
                                Text("\$${widget.coupon.price}", style: TextStyle(fontFamily: 'Poppins', fontSize: 16, color: context.watch<ThemeCubit>().state.theme == ThemeMode.light ? Color(0xFF595CE6) : Colors.white, fontWeight: FontWeight.bold),),
                              ],) :
                              Row(
                                children: [
                                  SizedBox(width: 4,),
                                  Text("\$${widget.coupon.price}", style: TextStyle(fontFamily: 'Poppins', fontSize: 16, color: Colors.grey, decoration: TextDecoration.lineThrough, fontWeight: FontWeight.bold),),
                                  SizedBox(width: 3,),
                                  Text("\$${widget.coupon.priceWithDiscount}", style: TextStyle(fontFamily: 'Poppins', fontSize: 16, color: context.watch<ThemeCubit>().state.theme == ThemeMode.light ? Color(0xFF595CE6) : Colors.white, fontWeight: FontWeight.bold),),
                                ],),
                              SizedBox(height: 4,),
                              widget.coupon.discount == null ? Container() : Align(
                                  alignment: Alignment.centerRight,
                                  child: Text('${widget.coupon.discount}% descuento', style: TextStyle(fontFamily: 'Poppins', fontSize: 12, color: Color(0xFF41BF71)),))
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 30,),
                        _formattedDate(widget.coupon.campaignEnding, _now) == 'Expired' ? Container() : Center(
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.85,
                              height: 60,
                              child: ElevatedButton(onPressed: () async{
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartScreen()));
                                if(context.read<UserCubit>().state.cartCoupons.isEmpty){
                                  context.read<UserCubit>().addCouponToCart(widget.coupon.id);
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => CheckoutScreen()));
                                }else{
                                  await showConfirmationDialog(context, 'Tienes artículos en tu carrito, ¿quieres vaciarlo para continuar tu compra?” ', () async{
                                    context.read<UserCubit>().emptyCart().then((value){
                                      if(context.read<UserCubit>().state.cartCoupons.isEmpty){
                                        context.read<UserCubit>().addCouponToCart(widget.coupon.id);
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CheckoutScreen()));
                                      }
                                    });
                                  });
                                }
                              }, child: Text('Comprar Ahora', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),))),
                        ),
                        _formattedDate(widget.coupon.campaignEnding, _now) == 'Expired' ? Container() : SizedBox(height: 15,),
                        _formattedDate(widget.coupon.campaignEnding, _now) == 'Expired' ? Container() : Center(
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.85,
                              height: 60,
                              child: OutlinedButton(onPressed: () async{
                                context.read<UserCubit>().addCouponToCart(widget.coupon.id);
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartScreen()));
                              }, child: Text('Agregar a Carrito', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),))),
                        ),
                      SizedBox(height: 30,),
                      _companyInformationTab(),
                        SizedBox(height: 100,),
                    ],),
                  ),
                ),
                _dropdownFaqs(),
                SizedBox(height: 20,),
                _dropdownBranches(),
                SizedBox(height: 20,),
                _dropdownTermsAndConditions(),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 35,),
                        Text('${context.watch<CouponReviewsCubit>().state.reviews.length} Calificaciones', style: TextStyle(fontSize: 14, fontFamily: 'Outfit', fontWeight: FontWeight.w600),),
                        SizedBox(height: 10,),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: context.watch<CouponReviewsCubit>().state.reviews.length,
                            itemBuilder: (context, i) => Container(
                                margin: EdgeInsets.only(bottom: 20),
                                child: ReviewTile(review: context.watch<CouponReviewsCubit>().state.reviews[i])),),
                        ),
                        SizedBox(height: 30,)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          ArcWithLogo(withArrow: true, heightExtend: _heightExtend,),
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
        ],
      ),
    );
  }


  Widget _dropdownFaqs(){
    return widget.coupon.faqs!.isEmpty ? Container() : GestureDetector(
      onTap: (){
        setState((){
          _showFaqs = !_showFaqs;
        });
        if(_showFaqs){
          _scrollController.animateTo(_scrollController.offset + 200, duration: Duration(seconds: 1), curve: Curves.decelerate);
        }
      },
      child: Material(
        color: Colors.transparent,
        elevation: 0,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Preguntas Frecuentes', style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w500),),
                  Spacer(),
                  SizedBox(width: 10,),
                  Container(
                    width: 16,
                    height: 16,
                    child: AnimatedRotation(
                        turns: _showFaqs ? 0.25 : 0.75,
                        duration: Duration(milliseconds: 300),
                        child: SvgPicture.asset(KIcons.directionLeft, color: Theme.of(context).highlightColor,)),
                  )
                ],
              ),
              SizedBox(height: 15,),
              Divider(),
              !_showFaqs ? Container() : ListView.builder(
                  itemCount: widget.coupon.faqs!.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i){
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.coupon.faqs![i].question, style: const TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w500),),
                          SizedBox(height: 30,),
                          Text(widget.coupon.faqs![i].answer, style: const TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w300),),
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dropdownBranches(){
    return context.watch<CouponReviewsCubit>().state.branches.isEmpty ? Container() : GestureDetector(
      onTap: (){
        setState((){
          _showBranches = !_showBranches;
        });
        if(_showBranches){
          _scrollController.animateTo(_scrollController.offset + 200, duration: Duration(seconds: 1), curve: Curves.decelerate);
        }
      },
      child: Material(
        color: Colors.transparent,
        elevation: 0,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Ubicación en Mapa', style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w500),),
                  Spacer(),
                  Text('(${context.watch<CouponReviewsCubit>().state.branches.length} Sucursales)', style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w300),),
                  SizedBox(width: 10,),
                  Container(
                    width: 16,
                    height: 16,
                    child: AnimatedRotation(
                        turns: _showBranches ? 0.25 : 0.75,
                        duration: Duration(milliseconds: 300),
                        child: SvgPicture.asset(KIcons.directionLeft, color: Theme.of(context).highlightColor,)),
                  )
                ],
              ),
              SizedBox(height: 15,),
              Divider(),
              !_showBranches ? Container() : ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: context.watch<CouponReviewsCubit>().state.branches.length,
                  itemBuilder: (context,i) {
                    return Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: BranchTile(branch: context.watch<CouponReviewsCubit>().state.branches[i],));
                  })
            ],
          ),
        ),
      ),
    );
  }

  Widget _dropdownTermsAndConditions(){
    return context.watch<CouponReviewsCubit>().state.branches.isEmpty ? Container() : GestureDetector(
      onTap: (){
        setState((){
          _showTermsAndConditions = !_showTermsAndConditions;
        });
        if(_showTermsAndConditions){
          _scrollController.animateTo(_scrollController.offset + 200, duration: Duration(seconds: 1), curve: Curves.decelerate);
        }
      },
      child: Material(
        color: Colors.transparent,
        elevation: 0,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Términos y condiciones', style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w500),),
                  Spacer(),
                  Container(
                    width: 16,
                    height: 16,
                    child: AnimatedRotation(
                        turns: _showTermsAndConditions ? 0.25 : 0.75,
                        duration: Duration(milliseconds: 300),
                        child: SvgPicture.asset(KIcons.directionLeft, color: Theme.of(context).highlightColor,)),
                  )
                ],
              ),
              SizedBox(height: 15,),
              Divider(),
              !_showTermsAndConditions ? Container() : Align(
                  alignment: Alignment.centerLeft,
                  child: Text(widget.coupon.termsAndConditions, style: TextStyle(fontWeight: FontWeight.w200, fontFamily: 'Outfit', color: Color(0xFF8B8B8B), fontSize: 14),))
            ],
          ),
        ),
      ),
    );
  }

  String _formattedDate(DateTime expDate, DateTime now){
    final differenceInSeconds = expDate.difference(now).inSeconds;
    if(differenceInSeconds < 0){
      return 'Expired';
    }
    final timeLeft = expDate.subtract(Duration(milliseconds: now.millisecondsSinceEpoch));
    final leftInDays = timeLeft.day;
    final leftInHours = timeLeft.hour;
    final leftInMinutes = timeLeft.minute;
    final leftInSeconds = timeLeft.second;
    return "$leftInDays dìas $leftInHours h $leftInMinutes m $leftInSeconds s";
  }

  Widget _dots(int elementsCount){
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(elementsCount, (index) => Row(children: [
          CircleAvatar(radius: 6,backgroundColor: _selectedIndex != index ? const Color(0xFFD9D9D9) : const Color(0xFF3D5BF6)),
          const SizedBox(width: 5,),
        ],))
    );
  }

  Widget _companyInformationTab(){
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Detalles', style: TextStyle(fontSize: 14, fontFamily: 'Outfit', fontWeight: FontWeight.w600),),
          SizedBox(height: 10,),
          Text(widget.coupon.description, style: TextStyle(fontWeight: FontWeight.w200, fontFamily: 'Outfit', color: Color(0xFF8B8B8B), fontSize: 14),),
          SizedBox(height: 10,),
          widget.coupon.items!.isEmpty ? Container() : Text('Incluye:', style: TextStyle(fontSize: 14, fontFamily: 'Outfit', fontWeight: FontWeight.w600),),
          SizedBox(height: 10,),
          Column(
            children: widget.coupon.items!.map((e) => Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  SvgPicture.asset(KIcons.tick, color: Theme.of(context).highlightColor, width: 11.5, height: 8.3,),
                  SizedBox(width: 17,),
                  Text(e.trim(), style: TextStyle(fontSize: 16, fontFamily: 'Outfit', fontWeight: FontWeight.w400, color: Color(0xFF8B8B8B))),
                ],
              ),
            )).toList()
          )
        ],
      ),
    );
  }
}
