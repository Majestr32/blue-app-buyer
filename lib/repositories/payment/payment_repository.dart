import 'dart:developer';

import 'package:blue/services/payment/payment_service_contract.dart';

class PaymentRepository{
  final IPaymentService _paymentService;

  Future<dynamic> getOrCreateCustomerByEmail(String email) async{
    var customers = await getCustomerByEmail(email);
    log(customers.toString());
    if((customers as List).isEmpty){
      customers = await createCustomer(email);
    }else{
      customers = customers.first;
    }
    return customers;
  }
  Future<dynamic> getCustomerByEmail(String email) async{
    return (await _paymentService.getCustomerByEmail(email))["data"];
  }
  Future<void> checkout(String userUid, double sum, String paymentMethodId, String customerId){
    return _paymentService.checkout(userUid, sum, paymentMethodId, customerId);
  }
  Future<dynamic> createCustomer(String email){
    return _paymentService.createCustomer(email);
  }
  Future<void> attachPaymentMethod(String paymentMethodId, String customerId){
    return _paymentService.attachPaymentMethod(paymentMethodId, customerId);
  }
  Future<void> detachPaymentMethod(String paymentMethodId){
    return _paymentService.detachPaymentMethod(paymentMethodId);
  }
  Future<dynamic> listCustomerPaymentMethods(String customerId) async{
    return (await _paymentService.listCustomerPaymentMethods(customerId))["data"];
  }
  Future<dynamic> createPaymentMethod(String cardNumber, int expMonth, int expYear, String cvc){
    return _paymentService.createPaymentMethod(cardNumber, expMonth, expYear, cvc);
  }

  const PaymentRepository({
    required IPaymentService paymentService,
  }) : _paymentService = paymentService;
}