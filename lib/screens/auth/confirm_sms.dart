import 'package:blue/blocs/auth_bloc/auth_bloc.dart';
import 'package:blue/blocs/user_cubit/user_cubit.dart';
import 'package:blue/screens/auth/signing.dart';
import 'package:blue/screens/home.dart';
import 'package:blue/screens/post_auth/banners_preview.dart';
import 'package:blue/screens/splash/splash_screen.dart';
import 'package:blue/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

import '../../consts/k_icons.dart';

class ConfirmSms extends StatefulWidget {
  const ConfirmSms({Key? key}) : super(key: key);

  @override
  State<ConfirmSms> createState() => _ConfirmSmsState();
}

class _ConfirmSmsState extends State<ConfirmSms> {
  

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<UserCubit, UserState>(
        listener: (context,state){
          if(state.status == UserStateStatus.authenticated){
            if(context.read<UserCubit>().state.user.endedTutorial!){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SplashScreen()));
            }else{
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => BannersPreview()));
            }
          }
        },
        child: BlocConsumer<AuthBloc,AuthState>(
          listener: (_,state){
            if(state is AuthNotAuthenticatedState){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Signing()));
            }
          },
          builder: (context,state) => SafeArea(
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                child: Column(
                  children: [
                    SizedBox(height: 30,),
                    Align(alignment: Alignment.topLeft, child: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: SvgPicture.asset(KIcons.directionLeft)),),
                    SizedBox(height: 20,),
                    Text('Te enviamos el número de código por ${state.verificationPhone ?? ''}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'Outfit'),),
                    Spacer(),
                    VerificationCode(
                      length: 6,
                        underlineColor: Colors.transparent,
                        underlineUnfocusedColor: Colors.transparent,
                        fillColor: Theme.of(context).splashColor,
                        cursorColor: Theme.of(context).splashColor,
                        fullBorder: true,
                        onCompleted: (val){
                      AuthState state = context.read<AuthBloc>().state;
                      if(state is AuthReadyForSignInPhoneVerificationState){
                        context.read<AuthBloc>().add(AuthEvent.signInVerifyPhoneCode(code: val));
                      }else{
                        context.read<AuthBloc>().add(AuthEvent.verifyPhoneCode(code: val));
                      }
                    }, onEditing: (val){

                    }),
                    Spacer(),
                    SizedBox(height: 60,)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
