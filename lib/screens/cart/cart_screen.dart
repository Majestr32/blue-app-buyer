import 'package:blue/blocs/user_cubit/user_cubit.dart';
import 'package:blue/screens/checkout/checkout_screen.dart';
import 'package:blue/widgets/common/app_bar_with_arrow.dart';
import 'package:blue/widgets/common/cart_coupon_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: [
          AppBarWithArrow(title: 'CARRETILLA'),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              margin: EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      child: ListView.builder(
                        shrinkWrap: true,
                          itemCount: context.watch<UserCubit>().state.cartCoupons.length,
                          itemBuilder: (context, i){
                        return Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            child: CartCouponTile(coupon: context.watch<UserCubit>().state.cartCoupons[i]));
                      }),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Center(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Row(children: [
                                Text('Subtotal :', style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w400),),
                                Spacer(),
                                Text('\$${context.read<UserCubit>().state.cartSum.toString()}', style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w500, fontSize: 18),),
                              ],),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Center(
                            child: SizedBox(
                              height: 60,
                                width: MediaQuery.of(context).size.width * 0.85,
                                child: ElevatedButton(onPressed: () async{
                                  if(context.read<UserCubit>().state.cartCoupons.isEmpty){
                                    return;
                                  }
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => CheckoutScreen()));
                                }, child: Text('Checkout', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),))),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
