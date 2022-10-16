import 'dart:developer';

import 'package:blue/blocs/auth_bloc/auth_bloc.dart';
import 'package:blue/blocs/theme_cubit/theme_cubit.dart';
import 'package:blue/blocs/user_cubit/user_cubit.dart';
import 'package:blue/screens/auth/forgot_password.dart';
import 'package:blue/screens/home.dart';
import 'package:blue/utils/utils.dart';
import 'package:blue/widgets/common/arc_with_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

import '../../consts/k_icons.dart';
import '../post_auth/banners_preview.dart';

class Signing extends StatefulWidget {
  const Signing({Key? key}) : super(key: key);

  @override
  State<Signing> createState() => _SigningState();
}

class _SigningState extends State<Signing> {

  int _selectedButton = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: BlocListener<UserCubit,UserState>(
        listener: (context, state) async{
          if(state.status == UserStateStatus.authenticated) {
            if(state.user.endedTutorial!){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
            }else{
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => BannersPreview()));
            }
          }
        },
        child: BlocListener<AuthBloc,AuthState>(
          listener: (context,state){
            if(state is AuthForgotPasswordState){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ForgotPassword()));
            }
          },
          child: Scaffold(
            backgroundColor: context.watch<ThemeCubit>().state.theme == ThemeMode.dark ? Color(0xFF121725) : null,
            body: Stack(
              children: [
                ArcWithLogo(),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.86,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 150,),
                          Center(
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).splashColor,
                                borderRadius: BorderRadius.circular(32)
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 6,),
                                  GestureDetector(
                                    onTap: (){
                                      setState((){
                                        _selectedButton = 0;
                                      });
                                    },
                                    child: Container(
                                        width: MediaQuery.of(context).size.width * 0.43 - 6,
                                        height: 50,
                                        decoration: _selectedButton == 0 ? BoxDecoration(
                                          color: Theme.of(context).focusColor,
                                          borderRadius: BorderRadius.circular(32)
                                        ) : null,
                                        child: Center(child: Text('Iniciar sesión', style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w500, color: _selectedButton == 0 ? Theme.of(context).highlightColor : Color(0xFFA7A9B7)),))),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      setState((){
                                        _selectedButton = 1;
                                      });
                                    },
                                    child: Container(
                                        width: MediaQuery.of(context).size.width * 0.43 - 6,
                                        height: 50,
                                        decoration: _selectedButton == 1 ? BoxDecoration(
                                            color: Theme.of(context).focusColor,
                                            borderRadius: BorderRadius.circular(32)
                                        ) : null,
                                        child: Center(child: Text('Registro', style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w500, color: _selectedButton == 1 ? Theme.of(context).highlightColor : Color(0xFFA7A9B7)),))),

                                  ),
                                  SizedBox(width: 6,),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Text('Bienvenido 👋', style: TextStyle(fontWeight: FontWeight.w500, fontFamily: 'Outfit', fontSize: 24, color: Theme.of(context).highlightColor),),
                          SizedBox(height: 50,),
                          _selectedButton == 0 ? SignInForm() : SignUpForm()
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}


class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool _rememberMe = false;
  bool _obscurePassword = true;
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _usernameController,
            validator: (value) => validateUsername(value),
            decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).splashColor,
                prefixIcon: SvgPicture.asset(KIcons.user),
                prefixIconConstraints: BoxConstraints(maxWidth: 48, minWidth: 48),
                hintText: 'Nombre'
            ),
          ),
          SizedBox(height: 20,),
          TextFormField(
            controller: _emailController,
            validator: (value) => validateEmail(value),
            decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).splashColor,
                prefixIcon: SvgPicture.asset(KIcons.sms),
                prefixIconConstraints: BoxConstraints(maxWidth: 48, minWidth: 48),
                hintText: 'Correo Electrónico'
            ),
          ),
          SizedBox(height: 20,),
          TextFormField(
            controller: _passwordController,
            obscureText: _obscurePassword,
            validator: (value) => validatePassword(value),
            decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).splashColor,
                prefixIcon: SvgPicture.asset(KIcons.key),
                prefixIconConstraints: BoxConstraints(maxWidth: 48, minWidth: 48),
                suffixIcon: IconButton(
                  onPressed: (){
                    setState((){
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                  icon: _obscurePassword ? SvgPicture.asset(KIcons.hide) : SvgPicture.asset(KIcons.eye),
                ),
                suffixIconConstraints: BoxConstraints(maxWidth: 48, minWidth: 48),
                hintText: 'Contraseña'
            ),
          ),
          SizedBox(height: 20,),
          SizedBox(
            height: 52,
            child: Stack(
              children: [
                CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Transform.translate(
                        offset: Offset(-15,0),
                        child: Text('Recuérdame',)),
                    value: _rememberMe, onChanged: (val){
                  setState((){
                    _rememberMe = val!;
                  });
                }),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                      style: Theme.of(context).textButtonTheme.style,
                      onPressed: (){
                        context.read<AuthBloc>().add(AuthEvent.requestPasswordRecovery());
                      },
                      child: Text('Olvidé mi contraseña?', style: TextStyle(fontFamily: 'Outfit'),)),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.82,
              height: 60,
              child: ElevatedButton(
                style: Theme.of(context).elevatedButtonTheme.style,
                  onPressed: (){
                    if(!_formKey.currentState!.validate()){
                      return;
                    }
                    String email = _emailController.text;
                    String password = _passwordController.text;
                    String username = _usernameController.text;
                    context.read<AuthBloc>().add(AuthEvent.signUpWithEmailAndPassword(email: email, username: username, password: password));
                  }, child: Text('Registrarse', style: TextStyle(fontFamily: 'Outfit'),))),
          SizedBox(height: 20,),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.82,
              height: 60,
              child: ElevatedButton.icon(
                  label: Text('Iniciar sesión Google', style: TextStyle(fontFamily: 'Outfit', color: Theme.of(context).highlightColor),),
                  icon: SvgPicture.asset(KIcons.google),
                  style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).splashColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)
                      )
                  ),
                  onPressed: (){
                    context.read<AuthBloc>().add(AuthEvent.signInWithGoogleAccount());
                  })),
          SizedBox(height: 20,),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.82,
              height: 60,
              child: ElevatedButton.icon(
                  label: Text('Iniciar sesión Facebook', style: TextStyle(fontFamily: 'Outfit', color: Theme.of(context).highlightColor),),
                  icon: SvgPicture.asset(KIcons.facebook, width: 32, height: 32,),
                  style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).splashColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)
                      )
                  ),
                  onPressed: (){
                    context.read<AuthBloc>().add(AuthEvent.signInWithGoogleAccount());
                  })),
          SizedBox(height: 30,)
        ],
      ),
    );
}
}

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool _rememberMe = false;
  bool _obscurePassword = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            validator: (value) => validateEmail(value),
            decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).splashColor,
              prefixIcon: SvgPicture.asset(KIcons.sms),
              prefixIconConstraints: BoxConstraints(maxWidth: 48, minWidth: 48),
              hintText: 'Correo Electrónico'
            ),
          ),
          SizedBox(height: 20,),
          TextFormField(
            controller: _passwordController,
            obscureText: _obscurePassword,
            validator: (value) => validatePassword(value),
            decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).splashColor,
                prefixIcon: SvgPicture.asset(KIcons.eye),
                prefixIconConstraints: BoxConstraints(maxWidth: 48, minWidth: 48),
                suffixIcon: IconButton(
                  onPressed: (){
                    setState((){
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                  icon: _obscurePassword ? SvgPicture.asset(KIcons.hide) : SvgPicture.asset(KIcons.eye),
                ),
                suffixIconConstraints: BoxConstraints(maxWidth: 48, minWidth: 48),
                hintText: 'Contraseña'
            ),
          ),
          SizedBox(height: 20,),
          SizedBox(
            height: 52,
            child: Stack(
              children: [
                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                    title: Transform.translate(
                        offset: Offset(-15,0),
                        child: Text('Recuérdame',)),
                    value: _rememberMe, onChanged: (val){
                    setState((){
                      _rememberMe = val!;
                    });
                }),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    style: Theme.of(context).textButtonTheme.style,
                      onPressed: (){
                        context.read<AuthBloc>().add(AuthEvent.requestPasswordRecovery());
                      },
                      child: Text('Olvidé mi contraseña?', style: TextStyle(fontFamily: 'Outfit'),)),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.82,
              height: 60,
              child: ElevatedButton(
                  style: Theme.of(context).elevatedButtonTheme.style,
                  onPressed: (){
                    if(!_formKey.currentState!.validate()){
                      return;
                    }
                    String email = _emailController.text;
                    String password = _passwordController.text;
                    context.read<AuthBloc>().add(AuthEvent.signInWithEmailAndPassword(email: email, password: password));
                  }, child: Text('Iniciar sesión', style: TextStyle(fontFamily: 'Outfit'),))),
          SizedBox(height: 20,),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.82,
              height: 60,
              child: ElevatedButton.icon(
                  label: Text('Iniciar sesión Google', style: TextStyle(fontFamily: 'Outfit', color: Theme.of(context).highlightColor),),
                  icon: SvgPicture.asset(KIcons.google),
                  style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).splashColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)
                      )
                  ),
                  onPressed: (){
                    context.read<AuthBloc>().add(AuthEvent.signInWithGoogleAccount());
                  })),
          SizedBox(height: 20,),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.82,
              height: 60,
              child: ElevatedButton.icon(
                label: Text('Iniciar sesión Facebook', style: TextStyle(fontFamily: 'Outfit', color: Theme.of(context).highlightColor),),
                icon: SvgPicture.asset(KIcons.facebook, width: 32, height: 32,),
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).splashColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)
                      )
                  ),
                  onPressed: (){
                    context.read<AuthBloc>().add(AuthEvent.signInWithFacebookAccount());
                  })),
          SizedBox(height: 30,)
        ],
      ),
    );
  }
}

