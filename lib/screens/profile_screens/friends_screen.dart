import 'package:blue/blocs/user_cubit/user_cubit.dart';
import 'package:blue/consts/k_icons.dart';
import 'package:blue/models/friend/friend.dart';
import 'package:blue/utils/utils.dart';
import 'package:blue/widgets/common/arc_with_logo.dart';
import 'package:blue/widgets/common/small_coupon_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({Key? key}) : super(key: key);

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  final _uidController = TextEditingController();

  @override
  void dispose() {
    _uidController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit,UserState>(
      listener: (context,state){
        if(state.status == UserStateStatus.error){
          StandardSnackBar.instance.showErrorSnackBar(context, state.error!);
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Stack(
          children: [
            ArcWithLogo(withArrow: true,),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Center(child: Text('Familiares/Amigos', style: TextStyle(fontFamily: 'Outfit', fontSize: 24, fontWeight: FontWeight.w500),),),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        shrinkWrap: true,
                          itemCount: context.watch<UserCubit>().state.friends.length,
                          itemBuilder: (context, i){
                        return _friendTile(context, context.watch<UserCubit>().state.friends[i]);
                      }),
                    ),
                    SizedBox(height: 20,),
                    Center(child: Text('Agrega a tus seres queridos', style: TextStyle(fontFamily: 'Outfit', fontSize: 16, fontWeight: FontWeight.w500),),),
                    SizedBox(height: 15,),
                    TextField(
                      controller: _uidController,
                      decoration: InputDecoration(
                          hintText: 'UID', border: InputBorder.none),),
                    SizedBox(height: 60,),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: 65,
                        child: ElevatedButton(onPressed: () async{
                          String uid = _uidController.text;
                          if(uid.isEmpty){
                            StandardSnackBar.instance.showInfoSnackBar(context, 'El UID está vacío');
                            return;
                          }
                          context.read<UserCubit>().addFriend(uid);
                        }, child: Text('Agregar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),)))
                ],),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _friendTile(BuildContext context, Friend friend){
    return Row(
      children: [
        CircleAvatar(radius: 16, backgroundColor: Colors.green, child: SvgPicture.asset(KIcons.tick)),
        Spacer(),
        Text(friend.friend.username!, style: TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w400),),
        Spacer(flex: 2,),
        IconButton(onPressed: (){
          context.read<UserCubit>().removeFriend(friend.receiverUid);
        }, icon: SvgPicture.asset(KIcons.close))
      ],
    );
  }
}
