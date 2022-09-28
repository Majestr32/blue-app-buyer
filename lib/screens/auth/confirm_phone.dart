import 'dart:developer';

import 'package:blue/blocs/user_cubit/user_cubit.dart';
import 'package:blue/consts/k_icons.dart';
import 'package:blue/screens/auth/confirm_sms.dart';
import 'package:blue/screens/auth/signing.dart';
import 'package:blue/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../blocs/auth_bloc/auth_bloc.dart';

class ConfirmPhone extends StatefulWidget {
  const ConfirmPhone({Key? key}) : super(key: key);

  @override
  State<ConfirmPhone> createState() => _ConfirmPhoneState();
}

class _ConfirmPhoneState extends State<ConfirmPhone> {
  String phoneNumber = '';

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if(!context.read<AuthBloc>().state.user!.emailVerified){
        showInfoSnackBar(context, 'Verifique el correo electrónico antes de configurar la autenticación de factor de teléfono, enlace enviado');
      }
      //context.read<AuthBloc>().add(AuthEvent.sendEmailVerificationMail());
    });
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        context.read<AuthBloc>().add(AuthEvent.signOut());
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Signing()));
        return true;
      },
      child: Scaffold(
        body: SafeArea(
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
                  Text('Introduce tu número de teléfono', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600, fontFamily: 'Outfit'),),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).splashColor,
                      borderRadius: BorderRadius.circular(16)
                    ),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 4),
                    child: InternationalPhoneNumberInput(
                      inputDecoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(16)
                        ),
                        fillColor: Colors.white,
                        filled: true
                      ),
                      onInputChanged: (val){
                        phoneNumber = val.phoneNumber!;
                      },
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.82,
                      height: 60,
                      child: ElevatedButton(
                          style: Theme.of(context).elevatedButtonTheme.style,
                          onPressed: (){
                            context.read<AuthBloc>().add(AuthEvent.enterPhoneForVerification(phone: phoneNumber));
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ConfirmSms()));
                          }, child: Text('Inicia sesión', style: TextStyle(fontFamily: 'Outfit'),))),
                  TextButton(onPressed: (){
                    context.read<AuthBloc>().add(AuthEvent.signOut());
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Signing()));
                  }, style: Theme.of(context).textButtonTheme.style, child: Text('Regístrese aquí')),
                  SizedBox(height: 40,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
