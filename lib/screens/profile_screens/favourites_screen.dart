import 'package:blue/blocs/user_cubit/user_cubit.dart';
import 'package:blue/widgets/common/arc_with_logo.dart';
import 'package:blue/widgets/common/small_coupon_tile.dart';
import 'package:blue/widgets/common/vertical_small_coupon_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  final _scrollController = ScrollController();
  double _heightExtend = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scroll);
  }

  void _scroll(){
    setState((){
      _heightExtend = _scrollController.position.extentBefore;
    });
  }
  @override
  void dispose() {
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
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(children: [
              SizedBox(height: 220,),
              Center(child: Text('Mis favoritos', style: TextStyle(fontFamily: 'Outfit', fontSize: 24, fontWeight: FontWeight.w500),),),
              SizedBox(height: 15,),
              ListView.builder(
                  itemCount: context.watch<UserCubit>().state.favs.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, i){
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: VerticalSmallCouponTile(coupon: context.watch<UserCubit>().state.favs[i].coupon));
              })
            ],),
          )
        ],
      ),
    );
  }
}
