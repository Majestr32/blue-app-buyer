import 'package:blue/blocs/user_cubit/user_cubit.dart';
import 'package:blue/screens/profile_screens/add_payment_method_screen.dart';
import 'package:blue/utils/utils.dart';
import 'package:blue/widgets/common/arc_with_logo.dart';
import 'package:blue/widgets/common/horizontal_line.dart';
import 'package:blue/widgets/common/payment_method_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class PaymentMethodsScreen extends StatefulWidget {
  const PaymentMethodsScreen({Key? key}) : super(key: key);

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  ProgressDialog? _loadingDialog;

  @override
  void initState() {
    super.initState();
    _loadingDialog = ProgressDialog(context: context);
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit,UserState>(
      listener: (context,state){
        if(state.status == UserStateStatus.loading){
          _loadingDialog!.show(max: 2, hideValue: true, msg: 'Loading ...');
        } else{
          _loadingDialog!.close();
        }
        if(state.status == UserStateStatus.error){
          StandardSnackBar.instance.showErrorSnackBar(context, state.error!);
        }
        if(state.status == UserStateStatus.authenticated){
          StandardSnackBar.instance.showInfoSnackBar(context, 'Éxito');
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Stack(
          children: [
            ArcWithLogo(withArrow: true,),
            Column(children: [
              SizedBox(height: 220,),
              Center(child: Text('Pagos', style: TextStyle(fontFamily: 'Outfit', fontSize: 24, fontWeight: FontWeight.w500),),),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ListView.separated(
                  separatorBuilder: (context, i){
                    return Divider(color: Colors.black,);
                  },
                  shrinkWrap: true,
                    itemCount: context.watch<UserCubit>().state.cards.length,
                    itemBuilder: (context, i) {
                  return PaymentMethodTile(
                      paymentMethodId: context.watch<UserCubit>().state.cards[i]["id"],
                      card: context.watch<UserCubit>().state.cards[i]["card"]);
                }),
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddPaymentMethodScreen()));
                      },
                      child: Text('+Agregar método de pago', style: TextStyle(color: Colors.green, fontFamily: 'Outfit'),))),),
              SizedBox(height: 15,),
            ],)
          ],
        ),
      ),
    );
  }
}