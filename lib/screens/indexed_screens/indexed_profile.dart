import 'dart:io';
import 'dart:math';

import 'package:blue/blocs/theme_cubit/theme_cubit.dart';
import 'package:blue/blocs/user_cubit/user_cubit.dart';
import 'package:blue/consts/k_icons.dart';
import 'package:blue/screens/profile_screens/configuration_screen.dart';
import 'package:blue/screens/profile_screens/favourites_screen.dart';
import 'package:blue/screens/profile_screens/friends_screen.dart';
import 'package:blue/screens/profile_screens/interests_screen.dart';
import 'package:blue/screens/profile_screens/payment_methods_screen.dart';
import 'package:blue/screens/profile_screens/support_screen.dart';
import 'package:blue/utils/utils.dart';
import 'package:blue/widgets/common/horizontal_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../blocs/auth_bloc/auth_bloc.dart';

class IndexedProfile extends StatefulWidget {
  const IndexedProfile({Key? key}) : super(key: key);

  @override
  State<IndexedProfile> createState() => _IndexedProfileState();
}

class _IndexedProfileState extends State<IndexedProfile> {
  bool _editMode = false;
  String? _pickedImageUrl;
  final _usernameFocusNode = FocusNode();
  final _usernameController = TextEditingController();

  @override
  void dispose() {
    _usernameFocusNode.dispose();
    _usernameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Spacer(flex: 2,),
              Stack(
                children: [
                  Align(
                      alignment: Alignment.center,
                      child: Text('PERFIL', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, fontFamily: 'Outfit'),)),
                  Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                          onTap: (){
                            if(_editMode && (_usernameController.text != context.read<UserCubit>().state.user.username) || _pickedImageUrl != null){
                              context.read<UserCubit>().editUser(_pickedImageUrl, _usernameController.text);
                            }
                            setState((){
                              _editMode = !_editMode;
                              _usernameController.text = context.read<UserCubit>().state.user.username!;
                              _pickedImageUrl = null;
                            });
                          },
                          child: !_editMode ? SvgPicture.asset(KIcons.edit) : SvgPicture.asset(KIcons.tick, color: Colors.green,)))
                ],
              ),
              SizedBox(height: 10,),
              CircleAvatar(radius: 64, backgroundImage: _pickedImageUrl != null ? Image.file(File(_pickedImageUrl!)).image : context.watch<UserCubit>().state.user.profileImgUrl == null ? null : Image.network(context.watch<UserCubit>().state.user.profileImgUrl!).image, backgroundColor: Colors.grey.withOpacity(0.1), child: _editMode ? Align(alignment: Alignment.bottomRight, child: InkWell(
                  onTap: () async{
                    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                    if(pickedFile == null){
                      return;
                    }
                    setState((){
                      _pickedImageUrl = pickedFile.path;
                    });
                  },
                  child: CircleAvatar(radius: 24, backgroundColor: Theme.of(context).splashColor, child: Center(child: SvgPicture.asset(KIcons.camera, color: Theme.of(context).highlightColor,),),)),) : context.watch<UserCubit>().state.user.profileImgUrl == null ? SvgPicture.asset(KIcons.user) : Container(),),
              SizedBox(height: 10,),
              _editMode ? EditableText(controller: _usernameController, textAlign: TextAlign.center, focusNode: _usernameFocusNode, backgroundCursorColor: Colors.black, cursorColor: Theme.of(context).splashColor, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Theme.of(context).highlightColor, fontFamily: 'Outfit'),) : Text(context.watch<UserCubit>().state.user.username!, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Outfit'),),
              SizedBox(height: 10,),
              Text(context.watch<UserCubit>().state.user.user!.email!, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'Outfit'),),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('UID: ', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'Outfit'),),
                  Text(context.watch<UserCubit>().state.user.uid!, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, fontFamily: 'Outfit'),),
                  SizedBox(width: 5,),
                  InkWell(
                      onTap: (){
                        showInfoSnackBar(context, 'Saved to clipboard');
                        Clipboard.setData(ClipboardData(text: context.read<UserCubit>().state.user.uid!));
                      },
                      child: SvgPicture.asset(KIcons.link))
                ],
              ),
              SizedBox(height: 20,),
              Column(
                children: [
                  _profileTile(context,'Mis favoritos',(){Navigator.of(context).push(MaterialPageRoute(builder: (context) => FavouritesScreen()));}),
                  _profileTile(context,'Mis Intereses',(){Navigator.of(context).push(MaterialPageRoute(builder: (context) => InterestsScreen()));}),
                  _profileTile(context,'Familiares/Amigos',(){Navigator.of(context).push(MaterialPageRoute(builder: (context) => FriendsScreen()));}),
                  context.read<AuthBloc>().state.user == null || context.read<AuthBloc>().state.user!.providerData.first.providerId != 'password' ? null : _profileTile(context,'Configuración',(){Navigator.of(context).push(MaterialPageRoute(builder: (context) => ConfigurationScreen()));}),
                  _profileTile(context,'Pagos',(){Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentMethodsScreen()));}),
                  _profileTile(context,'Soporte',(){Navigator.of(context).push(MaterialPageRoute(builder: (context) => SupportScreen()));}),
                ].whereType<Widget>().map((e) => Container(
                    height: 42,
                    child: Column(children: [e,HorizontalLine()]))).toList(),
              ),
              Row(children: [
                Text('Modo claro', style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w500),),
                Spacer(),
                Switch(value: context.watch<ThemeCubit>().state.theme == ThemeMode.dark, onChanged: (v){context.read<ThemeCubit>().toggleTheme();})
              ],),
              SizedBox(height: 30,),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 60,
                child: ElevatedButton(
                    //style: Theme.of(context).elevatedButtonTheme.style,
                    onPressed: (){
                      context.read<AuthBloc>().add(AuthEvent.signOut());
                    }, child: Text('Lout out')),
              ),
              Spacer(flex: 1,),
              SizedBox(height: 80,)
            ],
          ),
        ),
      ),
    );
  }

  Widget _profileTile(BuildContext context,String name, VoidCallback onTap){
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      highlightColor: Colors.grey.withOpacity(0.3),
      onTap: onTap,
      child: SizedBox(
        height: 40,
        child: Row(children: [
          Text(name, style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w500),),
          Spacer(),
          Transform.rotate(
              angle: pi,
              child: SvgPicture.asset(KIcons.directionLeft, color: Theme.of(context).highlightColor,))
        ],),
      ),
    );
  }
}
