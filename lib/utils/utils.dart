import 'package:flutter/material.dart';

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
        CircularProgressIndicator(),
        Container(margin: EdgeInsets.only(left: 7),child:Text("Cargando ..." )),
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
void showErrorSnackBar(BuildContext context,String error){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Row(
      children: [
        Icon(Icons.error_outline, color: Colors.red,),
        SizedBox(width: 10,),
        Flexible(child: Text(error)),
      ],
    ),
  ));
}
void showInfoSnackBar(BuildContext context,String message){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Row(
      children: [
        Icon(Icons.info_outline, color: Colors.blue,),
        SizedBox(width: 10,),
        Flexible(child: Text(message)),
      ],
    ),
  ));
}