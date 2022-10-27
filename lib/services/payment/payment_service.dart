import 'dart:developer';

import 'package:blue/custom_error.dart';
import 'package:blue/services/payment/payment_service_contract.dart';
import 'package:dio/dio.dart';

import '../../consts/api.dart';


class PaymentService implements IPaymentService{
  final Dio _dio;


  @override
  Future<void> attachPaymentMethod(String paymentMethodId, String customerId) async{
    await _dio.post("$apiBase/payment_methods/$paymentMethodId/attach", data: {'customer' : customerId});
  }

  @override
  Future createCustomer(String email) async{
    final response = await _dio.post("$apiBase/customers", data: {'email': email});
    return response.data;
  }

  @override
  Future createPaymentMethod(String cardNumber, int expMonth, int expYear, String cvc) async{
    final response = await _dio.post("$apiBase/payment_methods", data: {'type': 'card', 'card[number]': cardNumber, 'card[exp_year]': expYear, 'card[exp_month]': expMonth, 'card[cvc]': cvc});
    if(response.data["error"] != null){
      throw CustomError(error: response.data["error"]["message"], code: response.data["error"]["code"]);
    }
    return response.data;
  }

  @override
  Future<void> detachPaymentMethod(String paymentMethodId) async{
    await _dio.post("$apiBase/payment_methods/$paymentMethodId/detach");
  }

  @override
  Future getCustomerByEmail(String email) async{
    final response = await _dio.get("$apiBase/customers", queryParameters: {'email': email});
    return response.data;
  }

  @override
  Future listCustomerPaymentMethods(String customerId) async{
    final response = await _dio.get("$apiBase/customers/$customerId/payment_methods", queryParameters: {'type': 'card'});
    return response.data;
  }

  const PaymentService({
    required Dio dio,
  }) : _dio = dio;

  @override
  Future<void> checkout(String userUid, double sum, String paymentMethodId, String customerId) async{
    try{
      await _dio.post("$hostApi/carts/$userUid/checkout", data: {'customer_id': customerId, 'payment_method_id': paymentMethodId});
    }on DioError catch(e){
      log(e.response.toString());
    }
  }

  Future<dynamic> _createPaymentIntent(double sum, String customerId) async{
    final response = await _dio.post("$apiBase/payment_intents", data: {'currency': 'usd', 'customer': customerId, 'amount': (sum * 100).round()});
    if(response.data["error"] != null){
      throw CustomError(error: response.data["error"]["message"], code: response.data["error"]["code"]);
    }
    return response.data;
  }
}