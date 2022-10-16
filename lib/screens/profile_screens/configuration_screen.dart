import 'package:blue/blocs/auth_bloc/auth_bloc.dart';
import 'package:blue/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/common/arc_with_logo.dart';

class ConfigurationScreen extends StatefulWidget {
  const ConfigurationScreen({Key? key}) : super(key: key);

  @override
  State<ConfigurationScreen> createState() => _ConfigurationScreenState();
}

class _ConfigurationScreenState extends State<ConfigurationScreen> {
  final _oldPasswordController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _oldPasswordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: [
          ArcWithLogo(withArrow: true,),
          Form(
            key: _formKey,
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  SizedBox(height: 220,),
                  Center(child: Text('Configuración', style: TextStyle(fontFamily: 'Outfit', fontSize: 24, fontWeight: FontWeight.w500),),),
                    SizedBox(height: 10,),
                    Center(child: Text('Cambiar contraseña', style: TextStyle(fontFamily: 'Outfit', fontSize: 16, fontWeight: FontWeight.w300),),),
                  SizedBox(height: 20,),
                  Text('Contraseña actual', style: TextStyle(fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.w200),),
                  SizedBox(height: 10,),
                    TextFormField(
                      obscureText: true,
                      validator: (value){
                        return validatePassword(value);
                      },
                      controller: _oldPasswordController,
                      decoration: InputDecoration(
                          hintText: '****', border: InputBorder.none),),
                    Text('Nueva contraseña', style: TextStyle(fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.w200),),
                    TextFormField(
                    obscureText: true,
                    validator: (value){
                      return validatePassword(value);
                    },
                    controller: _passwordController,
                    decoration: InputDecoration(
                        hintText: '****', border: InputBorder.none),),
                    Text('Repite nueva contraseña', style: TextStyle(fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.w200),),
                    TextFormField(
                      obscureText: true,
                      validator: (value){
                        String password = _passwordController.text;
                        if(value != password){
                          return 'Incorrect';
                        }else{
                          return null;
                        }
                      },
                      controller: _confirmPasswordController,
                      decoration: InputDecoration(
                          hintText: '****', border: InputBorder.none),),
                    Spacer(),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: 65,
                        child: ElevatedButton(onPressed: () async{
                          bool valid = _formKey.currentState!.validate();
                          if(valid){
                            context.read<AuthBloc>().add(AuthEvent.changePassword(oldPassword: _oldPasswordController.text, newPassword: _passwordController.text));
                          }

                        }, child: Text('Aplicar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),))),
                    SizedBox(height: 80,)
                ],),
              ),
            ),
          )
        ],
      ),
    );
  }
}