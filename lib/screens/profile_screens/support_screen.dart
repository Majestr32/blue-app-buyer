import 'package:blue/blocs/user_cubit/user_cubit.dart';
import 'package:blue/consts/k_icons.dart';
import 'package:blue/utils/utils.dart';
import 'package:blue/widgets/common/arc_with_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';


class SupportScreen extends StatefulWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {

  List<String>? _filePaths;
  final _subjectKey = TextEditingController();
  final _textKey = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  @override
  void dispose() {
    _subjectKey.dispose();
    _textKey.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: [
          ArcWithLogo(withArrow: true,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Center(child: Text('Soporte', style: TextStyle(fontFamily: 'Outfit', fontSize: 24, fontWeight: FontWeight.w500),),),
            SizedBox(height: 15,),
            Center(child: Text('¡Nos contactaremos rápido contigo!', style: TextStyle(fontFamily: 'Outfit', fontSize: 15, fontWeight: FontWeight.w500),),),
            SizedBox(height: 25,),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Theme.of(context).focusColor,
                boxShadow: [
                  BoxShadow(color: Colors.grey.withOpacity(0.4), blurRadius: 5, offset: Offset(0,6))
                ]
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Asunto', style: TextStyle(fontFamily: 'Outfit', fontSize: 16, fontWeight: FontWeight.w500),),
                    SizedBox(height: 3,),
                    TextFormField(
                      controller: _subjectKey,
                      decoration: InputDecoration(
                          hintText: 'No recibí mi QR', border: InputBorder.none),),
                    SizedBox(height: 3,),
                    Text('Descripción del problema', style: TextStyle(fontFamily: 'Outfit', fontSize: 16, fontWeight: FontWeight.w500),),
                    SizedBox(height: 3,),
                    TextField(
                      controller: _textKey,
                      keyboardType: TextInputType.multiline,
                      maxLines: 7,
                      minLines: 7,
                      decoration: InputDecoration(
                          hintText: 'Pague el servicio y no me cayó el QR', border: InputBorder.none),),
                  ],
                ),
              ),
            ),
            SizedBox(height: 25,),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                height: 65,
                child: ElevatedButton(onPressed: () async{
                  String recipient = 'blueappdev2022@gmail.com';
                  String subject = _subjectKey.text;
                  String text = _textKey.text;
                  if(subject.isEmpty || text.isEmpty){
                    StandardSnackBar.instance.showInfoSnackBar(context, 'El asunto y el texto no pueden estar vacíos');
                    return;
                  }
                  final Uri uri = Uri(
                    scheme: 'mailto',
                    path: recipient,
                    query: 'subject='+Uri.encodeComponent(subject)+'&body='+Uri.encodeComponent(text)
                  );

                  if(await canLaunchUrl(uri)){
                    await launchUrl(uri);
                  }else{
                    StandardSnackBar.instance.showInfoSnackBar(context, 'No se puede enviar correo electrónico desde su cuenta');
                  }
                }, child: Text('Enviar')))
          ],)
        ],
      ),
    );
  }
}