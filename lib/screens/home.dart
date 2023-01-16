import 'package:blue/blocs/auth_bloc/auth_bloc.dart';
import 'package:blue/blocs/coupon_cubit/coupon_cubit.dart';
import 'package:blue/blocs/user_cubit/user_cubit.dart';
import 'package:blue/consts/k_icons.dart';
import 'package:blue/screens/indexed_screens/indexed_coupones.dart';
import 'package:blue/screens/indexed_screens/indexed_home.dart';
import 'package:blue/screens/indexed_screens/indexed_profile.dart';
import 'package:blue/screens/indexed_screens/indexed_search.dart';
import 'package:blue/utils/refreshables.dart';
import 'package:blue/widgets/common/arc_with_logo.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'auth/signing.dart';

class Home extends StatefulWidget {
  final int defaultIndexedScreen;
  const Home({this.defaultIndexedScreen = 0,Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late int _currentPage = widget.defaultIndexedScreen;

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance.subscribeToTopic("Buyer");
    context.read<UserCubit>().updateSignInDate();
    if(context.read<UserCubit>().state.status != CouponStateStatus.initial){
      context.read<CouponCubit>().loadStartCoupons(context.read<UserCubit>().state.tagsIds);
    }
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit,UserState>(
      listener: (context,state){
        if(state.status == UserStateStatus.authenticated){
          context.read<CouponCubit>().loadStartCoupons(state.tagsIds);
        }
      },
      child: WillPopScope(
        onWillPop: () async => false,
        child: BlocListener<AuthBloc,AuthState>(
          listener: (context, state){
            if(state is AuthNotAuthenticatedState){
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Signing()));
            }
          },
          child: Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                IndexedStack(
                  index: _currentPage,
                  children: [
                    IndexedHome(),
                    IndexedSearch(),
                    IndexedCoupons(),
                    IndexedProfile()
                  ],
                ),
                Align(alignment: Alignment.bottomCenter, child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Theme.of(context).splashColor,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
                    boxShadow: [
                      BoxShadow(offset: Offset(0,-4), color: Colors.grey.withOpacity(0.4), blurRadius: 4)
                    ]
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      KIcons.home,
                      KIcons.search,
                      KIcons.document,
                      KIcons.profile
                    ].asMap().entries.map((e) => Expanded(
                        child: Material(
                          borderRadius: e.key == 0 ? BorderRadius.only(topLeft: Radius.circular(24)) : e.key == 3 ? BorderRadius.only(topRight: Radius.circular(24)) : null,
                          color: Theme.of(context).splashColor,
                          child: InkWell(
                            borderRadius: e.key == 0 ? BorderRadius.only(topLeft: Radius.circular(24)) : e.key == 3 ? BorderRadius.only(topRight: Radius.circular(24)) : null,
                            splashColor: Colors.grey[200],
                            highlightColor: Colors.grey,
                            onTap: (){
                              setState((){
                                _currentPage = e.key;
                              });
                            },
                            child: Center(
                              child: Container(
                                  width: 20,
                                  height: 20,
                                  child: Stack(
                                    children: [
                                      Center(child: SvgPicture.asset(e.value, fit: BoxFit.none, color: _currentPage == e.key ? Theme.of(context).highlightColor : Color(0xFF5A5F6B),)),
                                      e.key == _currentPage ? Align(
                                          alignment: Alignment.bottomRight,
                                          child: CircleAvatar(radius: 5, backgroundColor: Color(0xFFF9A137),)) : Container()
                                    ],
                                  )),
                            ),
                          ),
                        ))).toList(),
                  ),
                ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*Center(
                child: ElevatedButton(
                  onPressed: (){
                    context.read<AuthBloc>().add(AuthEvent.signOut());
                  },
                  child: Text('Log out'),
                ),
              ),*/