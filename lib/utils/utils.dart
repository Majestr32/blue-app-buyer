import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String? validateEmail(String? value) {
  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || !regex.hasMatch(value)) {
    return 'Introduzca una dirección de correo electrónico válida';
  } else {
    return null;
  }
}

Future<void> showConfirmationDialog(BuildContext context,String title,VoidCallback onSuccess){
  return showDialog(context: context, builder: (context) => AlertDialog(
    title: Text(title),
    actions: [
      ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onPressed: (){
            Navigator.of(context).pop();
          }, child: const Text('NO')),
      ElevatedButton(onPressed: (){
        onSuccess.call();
        Navigator.of(context).pop();
      }, child: const Text('SI')),
    ],
  ));
}
String? validatePassword(String? value) {
  String pattern = "^.{6,}";
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || !regex.hasMatch(value)) {
    return 'La longitud de la contraseña debe ser mayor a 6';
  } else {
    return null;
  }
}
showLoaderDialog(BuildContext context){
  AlertDialog alert=AlertDialog(
    content: new Row(
      children: [
        const CircularProgressIndicator(),
        Container(margin: const EdgeInsets.only(left: 7),child:const Text("Cargando ..." )),
      ],),
  );
  showDialog(barrierDismissible: false,
    context:context,
    builder:(BuildContext context){
      return alert;
    },
  );
}
String? validateUsername(String? value) {
  String pattern = "^.{4,}";
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || !regex.hasMatch(value)) {
    return 'La longitud del nombre de usuario debe ser mayor a 4';
  } else {
    return null;
  }
}

String formatDate(DateTime date){
  return DateFormat.yMMMMd('en_US').format(date);
}

class StandardSnackBar{
  StandardSnackBar._constructor();
  static final StandardSnackBar _instance = StandardSnackBar._constructor();
  static StandardSnackBar get instance => _instance;

  bool _isOpened = false;

  void showErrorSnackBar(BuildContext context,String error){
    _dontDisplayNewIfAlreadyDisplayed(() => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Row(
          children: [
            const Icon(Icons.error_outline, color: Colors.red,),
            const SizedBox(width: 10,),
            Flexible(child: Text(error)),
          ],
        ),
      )));
  }
  void showInfoSnackBar(BuildContext context,String message){
    _dontDisplayNewIfAlreadyDisplayed(() => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        children: [
          const Icon(Icons.info_outline, color: Colors.blue,),
          const SizedBox(width: 10,),
          Flexible(child: Text(message)),
        ],
      ),
    )));
  }

  void _dontDisplayNewIfAlreadyDisplayed(VoidCallback showSnackBar){
    if(_isOpened) return;

    showSnackBar();
    _isOpened = true;
    Future.delayed(const Duration(milliseconds: 4000)).then((value) => _isOpened = false);
  }
}