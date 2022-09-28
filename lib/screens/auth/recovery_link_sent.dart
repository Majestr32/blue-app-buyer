import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth_bloc/auth_bloc.dart';
import '../../widgets/common/arc_with_logo.dart';

class RecoveryLinkSent extends StatelessWidget {
  const RecoveryLinkSent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        context.read<AuthBloc>().add(AuthEvent.backToSigning());
        return true;
      },
      child: BlocBuilder<AuthBloc,AuthState>(
        builder: (context,state) => Scaffold(
          body: Stack(
            children: [
              ArcWithLogo(),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Email de Recuperación Envido', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'Poppins'),),
                      SizedBox(height: 30,),
                      Text('Te hemos enviado un correo a ${obscuredEmail(state is AuthRecoveryEmailPasswordLinkSentState ? (state).email : '')} con el link para que recuperes tu cuenta', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'Poppins'),),
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
                      child: OutlinedButton(
                          style: Theme.of(context).outlinedButtonTheme.style,
                          onPressed: (){
                            context.read<AuthBloc>().add(AuthEvent.backToSigning());
                            Navigator.of(context).pop();
                          }, child: Text('Cancelar')),
                    ),
                    SizedBox(height: 60,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  String obscuredEmail(String email){
    if(email.isEmpty){
      return '';
    }
    String domain = email.split("@").last;
    return email.substring(0,2) + "****@" + domain;
  }
}
