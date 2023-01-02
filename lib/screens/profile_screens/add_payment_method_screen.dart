import 'dart:developer';

import 'package:blue/blocs/user_cubit/user_cubit.dart';
import 'package:blue/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

import '../../widgets/common/arc_with_logo.dart';

class AddPaymentMethodScreen extends StatefulWidget {
  const AddPaymentMethodScreen({Key? key}) : super(key: key);

  @override
  State<AddPaymentMethodScreen> createState() => _AddPaymentMethodScreenState();
}

class _AddPaymentMethodScreenState extends State<AddPaymentMethodScreen> {
  final _formKey = GlobalKey<FormState>();
  final _numberController = TextEditingController();
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _expDateController = TextEditingController();
  final _cvcController = TextEditingController();
  ProgressDialog? _loadingDialog;

  @override
  void initState() {
    super.initState();
    _loadingDialog = ProgressDialog(context: context);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    _surnameController.dispose();
    _expDateController.dispose();
    _cvcController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit,UserState>(
      listener: (context,state){
        if(state.status == UserStateStatus.loading){
          _loadingDialog!.show(max: 2, hideValue: true, msg: 'Cargando ...');
        } else{
          _loadingDialog!.close();
        }
        if(state.status == UserStateStatus.error){
          StandardSnackBar.instance.showErrorSnackBar(context, state.error!);
        } else if(state.status == UserStateStatus.successOperation){
          StandardSnackBar.instance.showInfoSnackBar(context, 'Éxito');
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Stack(
          children: [
            const ArcWithLogo(withArrow: true,),
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                const Center(child: Text('Pagos', style: TextStyle(fontFamily: 'Outfit', fontSize: 24, fontWeight: FontWeight.w500),),),
                const SizedBox(height: 30,),
                const Center(child: Text('Agregar una tarjeta', style: TextStyle(fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.w500),),),
                const SizedBox(height: 15,),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    controller: _numberController,
                    onEditingComplete: (){
                      FocusScope.of(context).nextFocus();
                    },
                    onChanged: (val){
                      if(val.length == 16){
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    keyboardType: TextInputType.number,
                    maxLength: 16,
                    validator: (value){
                      if(value == null || value.length < 16){
                        return 'El número de tarjeta no es válido';
                      }
                    },
                    decoration: const InputDecoration(
                      counterText: '',
                        hintText: 'Número de tarjeta', border: InputBorder.none),),
                ),
                const SizedBox(height: 15,),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _nameController,
                          onEditingComplete: (){
                            FocusScope.of(context).nextFocus();
                          },
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return 'El nombre no puede estar vacío';
                            }
                            return '';
                          },
                          decoration: const InputDecoration(
                              hintText: 'Nombre', border: InputBorder.none),),
                      ),
                      const SizedBox(width: 10,),
                      Expanded(
                        child: TextFormField(
                          controller: _surnameController,
                          onEditingComplete: (){
                            FocusScope.of(context).nextFocus();
                          },
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return 'El apellido no puede estar vacio';
                            }
                            return '';
                          },
                          decoration: const InputDecoration(
                              hintText: 'Apellido', border: InputBorder.none),),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15,),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _expDateController,
                          onEditingComplete: (){
                            FocusScope.of(context).nextFocus();
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            CardExpirationFormatter()
                          ],
                          onChanged: (val){
                            if(val.length == 5){
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return 'La fecha no puede estar vacía';
                            }
                            return '';
                          },
                          decoration: const InputDecoration(
                              hintText: 'MM/AA', border: InputBorder.none),),
                      ),
                      const SizedBox(width: 10,),
                      Expanded(
                        child: TextFormField(
                          controller: _cvcController,
                          onEditingComplete: (){
                            FocusScope.of(context).nextFocus();
                          },
                          maxLength: 4,
                          keyboardType: TextInputType.number,
                          validator: (value){
                            if(value == null || value.length < 3){
                              return 'Cvc debe tener al menos 3 caracteres';
                            }
                            return '';
                          },
                          decoration: const InputDecoration(
                            counterText: '',
                              hintText: 'CVV', border: InputBorder.none),),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15,),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 60,
                  child: ElevatedButton(
                      style: Theme.of(context).elevatedButtonTheme.style,
                      onPressed: (){
                        if(_formKey.currentState!.validate()){
                          return;
                        }
                        String number = _numberController.text;
                        String expDate = _expDateController.text;
                        String name = _nameController.text;
                        String surname = _surnameController.text;
                        String cvc = _cvcController.text;
                        int expMonth = int.parse(expDate.split("/")[0]);
                        int expYear = int.parse(expDate.split("/")[1]);
                        context.read<UserCubit>().addCard(number, expMonth, expYear, cvc);
                      }, child: const Text('Aplicar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, fontFamily: 'Outfit'),)),
                ),
              ],),
            )
          ],
        ),
      ),
    );
  }
}

class CardExpirationFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newValueString = newValue.text;
    String onlyNumbers = newValueString.replaceAll(RegExp("[^0-9]"), "");
    if(onlyNumbers.length > 4){
      return oldValue;
    }
    if(onlyNumbers.length == 1){
      switch(onlyNumbers[0]){
        case "0":
          break;
        case "1":
          break;
        default:
          onlyNumbers = "0" + onlyNumbers[0];
          break;
      }
    }
    else if(onlyNumbers.length == 2){
      switch(onlyNumbers[0]){
        case "0":
          if(onlyNumbers[1] == "0") {
            return oldValue;
          }
          break;
        case "1":
          if(!(onlyNumbers[1] == "0" || onlyNumbers[1] == "1" || onlyNumbers[1] == "2")){
            return oldValue;
          }
          break;
        default:
          return oldValue;
      }
    }
    if(onlyNumbers.length >= 3){
      onlyNumbers = onlyNumbers.substring(0,2) + "/" + onlyNumbers.substring(2, onlyNumbers.length);
    }
    return newValue.copyWith(
      text: onlyNumbers,
      selection: TextSelection.fromPosition(
        TextPosition(offset: onlyNumbers.length),
      ),
    );
  }
}
