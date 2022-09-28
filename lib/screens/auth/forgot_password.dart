import 'package:blue/screens/auth/recovery_link_sent.dart';
import 'package:blue/utils/utils.dart';
import 'package:blue/widgets/common/arc_with_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth_bloc/auth_bloc.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        context.read<AuthBloc>().add(AuthEvent.backToSigning());
        return false;
      },
      child: BlocListener<AuthBloc,AuthState>(
        listener: (context,state){
          if(state is AuthRecoveryEmailPasswordLinkSentState){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => RecoveryLinkSent()));
          }else if(state is AuthNotAuthenticatedState){
            Navigator.of(context).pop();
          }
        },
        child: Scaffold(
          body: Form(
            key: _formKey,
            child: Stack(
              children: [
                ArcWithLogo(),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('¿Olvidaste tu Contraseña?', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'Poppins'),),
                        SizedBox(height: 30,),
                        Text('Por favor ingresa tu email o número de teléfono y te enviaremos un link de recuperción a tu cuenta', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'Poppins'),),
                        SizedBox(height: 30,),
                        TextFormField(
                          controller: _emailController,
                          validator: (value) => validateEmail(value),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Theme.of(context).splashColor,
                              hintText: 'Email'
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 60,
                        child: ElevatedButton(
                            style: Theme.of(context).elevatedButtonTheme.style,
                            onPressed: (){
                              if(!_formKey.currentState!.validate()){
                                return;
                              }
                              context.read<AuthBloc>().add(AuthEvent.enterEmailForRecovery(email: _emailController.text));
                            }, child: Text('Recuperar Contraseña')),
                      ),
                      SizedBox(height: 20,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 60,
                        child: OutlinedButton(
                            style: Theme.of(context).outlinedButtonTheme.style,
                            onPressed: (){
                              context.read<AuthBloc>().add(AuthEvent.backToSigning());
                            }, child: Text('Cancelar')),
                      ),
                      SizedBox(height: 20,),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
