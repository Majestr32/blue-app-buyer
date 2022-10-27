import 'dart:async';

import 'package:blue/blocs/theme_cubit/theme_cubit.dart';
import 'package:blue/blocs/user_cubit/user_cubit.dart';
import 'package:blue/models/coupon/coupon.dart';
import 'package:blue/screens/details/company_details.dart';
import 'package:blue/screens/rating/rating_screen.dart';
import 'package:blue/utils/utils.dart';
import 'package:blue/widgets/common/review_tile.dart';
import 'package:blue/widgets/error/error_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../blocs/coupon_cubit/coupon_cubit.dart';
import '../../blocs/coupon_reviews_cubit/coupon_reviews_cubit.dart';
import '../../consts/k_icons.dart';
import '../../widgets/common/arc_with_logo.dart';
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
  late final Timer _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
          ArcWithLogo(withArrow: true, heightExtend: _heightExtend,),
          Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  SizedBox(height: 120,),
                  Container(width: MediaQuery.of(context).size.width * 0.9, height: 240, decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24)
                  ), child: Padding(
                      padding: EdgeInsets.all(5),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Hero(
                              tag: widget.tag,
                              child: Image.network(widget.coupon.posterUrl, fit: BoxFit.cover, errorBuilder: (context,obj,stacktrace) => ErrorImage(),))))),
                    SizedBox(height: 10,),
                    _dots(1),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => CompanyDetails(commerce: widget.coupon.commerce)));
                          },
                          child: CircleAvatar(radius: 18, backgroundColor: Colors.grey, backgroundImage: Image.network(widget.coupon.commerce.logoUrl, errorBuilder: (context,obj,stacktrace) => ErrorImage(),).image)),
                      SizedBox(width: 5,),
                      Text(widget.coupon.commerce.name, style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w600, fontSize: 12),),
                      Spacer(),
                      SvgPicture.asset(KIcons.starFilled),
                      SizedBox(width: 2,),
                      Text(widget.coupon.avgRating.toString(), style: TextStyle(color: Color(0xFFFFE500), fontFamily: 'Outfit', fontWeight: FontWeight.w700),),
                      SizedBox(width: 2,),
                      Text("(${widget.coupon.reviewsCount})", style: TextStyle(color: Color(0xFF898A8D), fontFamily: 'Outfit'),),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Text(widget.coupon.name, style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w500, fontSize: 20),),
                    SizedBox(height: 5,),
                    Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${widget.coupon.commerce.couponsSold} Vendidos', style: TextStyle(color: context.watch<ThemeCubit>().state.theme == ThemeMode.light ? Color(0xFFB5B5B5) : Colors.white, fontFamily: 'Outfit', fontWeight: FontWeight.w400, fontSize: 16),),
                          ((){
                            return Text('Termina en: ${_formattedDate(widget.coupon.expDate, _now)}', style: TextStyle(fontFamily: 'Outfit', color: Colors.red, fontWeight: FontWeight.w400, fontSize: 12),);
                          }()),
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
                              Text("\$${widget.coupon.price}", style: TextStyle(fontFamily: 'Poppins', fontSize: 12, color: Colors.grey, decoration: TextDecoration.lineThrough, fontWeight: FontWeight.bold),),
                              SizedBox(width: 3,),
                              Text("\$${widget.coupon.priceWithDiscount}", style: TextStyle(fontFamily: 'Poppins', fontSize: 16, color: context.watch<ThemeCubit>().state.theme == ThemeMode.light ? Color(0xFF595CE6) : Colors.white, fontWeight: FontWeight.bold),),
                            ],),
                          widget.coupon.discount == null ? Container() : Align(
                              alignment: Alignment.centerRight,
                              child: Text('${widget.coupon.discount}% dicountos', style: TextStyle(fontFamily: 'Poppins', fontSize: 12, color: Color(0xFF41BF71)),))
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 30,),
                    Center(
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: 60,
                          child: ElevatedButton(onPressed: () async{

                          }, child: Text('Comprar Ahora', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),))),
                    ),
                  SizedBox(height: 15,),
                    Center(
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: 60,
                          child: OutlinedButton(onPressed: () async{
                            context.read<UserCubit>().addCouponToCart(widget.coupon.id);
                            showInfoSnackBar(context, 'Added to cart');
                          }, child: Text('Agregar a Carrito', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),))),
                    ),
                  SizedBox(height: 30,),
                  _companyInformationTab(),
                    SizedBox(height: 10,),
                    Text('${context.watch<CouponReviewsCubit>().state.reviews.length} Calificaciones', style: TextStyle(fontSize: 14, fontFamily: 'Outfit', fontWeight: FontWeight.w600),),
                    SizedBox(height: 10,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                          itemCount: context.watch<CouponReviewsCubit>().state.reviews.length,
                          itemBuilder: (context, i) => ReviewTile(review: context.watch<CouponReviewsCubit>().state.reviews[i]),),
                    ),
                    SizedBox(height: 30,)
                ],),
              ),
            ),
          ),
          AnimatedOpacity(
            opacity: _heightExtend > 50 ? 0 : _heightExtend < 0 ? 1 : 1 - _heightExtend / 50,
            duration: Duration(milliseconds: 80),
            child: SafeArea(
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
          ),
        ],
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
