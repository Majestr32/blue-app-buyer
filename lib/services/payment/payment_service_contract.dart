abstract class IPaymentService{
  ///Return type example
  ///{
  ///   "object": "list",
  ///   "url": "/v1/customers",
  ///   "has_more": false,
  ///   "data": [
  ///     {
  ///       "id": "cus_MTlgTwUKiJL0es",
  ///       "object": "customer",
  ///       "address": null,
  ///       "balance": 0,
  ///       "created": 1663848288,
  ///       "currency": "usd",
  ///       "default_source": null,
  ///       "delinquent": false,
  ///       "description": null,
  ///       "discount": null,
  ///       "email": null,
  ///       "invoice_prefix": "FEB5EBE",
  ///       "invoice_settings": {
  ///         "custom_fields": null,
  ///         "default_payment_method": null,
  ///         "footer": null,
  ///         "rendering_options": null
  ///       },
  ///       "livemode": false,
  ///       "metadata": {},
  ///       "name": null,
  ///       "next_invoice_sequence": 1,
  ///       "phone": null,
  ///       "preferred_locales": [],
  ///       "shipping": null,
  ///       "tax_exempt": "none",
  ///       "test_clock": null
  ///     },
  ///     {...},
  ///     {...}
  ///   ]
  /// }
  Future<dynamic> getCustomerByEmail(String email);
  ///Return type example
  ///{
  ///     "id": "cus_MTl9nU6LzE4r7d",
  ///     "object": "customer",
  ///     "account_balance": 0,
  ///     "address": null,
  ///     "balance": 0,
  ///     "created": 1663846281,
  ///     "currency": null,
  ///     "default_currency": null,
  ///     "default_source": null,
  ///     "delinquent": false,
  ///     "description": "testing connection",
  ///     "discount": null,
  ///     "email": "vladik11042002v@gmail.com",
  ///     "invoice_prefix": "DB92BE49",
  ///     "invoice_settings": {
  ///         "custom_fields": null,
  ///         "default_payment_method": null,
  ///         "footer": null,
  ///         "rendering_options": null
  ///     },
  ///     "livemode": false,
  ///     "metadata": {},
  ///     "name": "Vladyslav Yemets",
  ///     "next_invoice_sequence": 1,
  ///     "phone": null,
  ///     "preferred_locales": [],
  ///     "shipping": null,
  ///     "sources": {
  ///         "object": "list",
  ///         "data": [],
  ///         "has_more": false,
  ///         "total_count": 0,
  ///         "url": "/v1/customers/cus_MTl9nU6LzE4r7d/sources"
  ///     },
  ///     "subscriptions": {
  ///         "object": "list",
  ///         "data": [],
  ///         "has_more": false,
  ///         "total_count": 0,
  ///         "url": "/v1/customers/cus_MTl9nU6LzE4r7d/subscriptions"
  ///     },
  ///     "tax_exempt": "none",
  ///     "tax_ids": {
  ///         "object": "list",
  ///         "data": [],
  ///         "has_more": false,
  ///         "total_count": 0,
  ///         "url": "/v1/customers/cus_MTl9nU6LzE4r7d/tax_ids"
  ///     },
  ///     "tax_info": null,
  ///     "tax_info_verification": null,
  ///     "test_clock": null
  /// }
  Future<dynamic> createCustomer(String email);
  Future<void> attachPaymentMethod(String paymentMethodId, String customerId);
  Future<void> detachPaymentMethod(String paymentMethodId);
  ///Return type example
  ///{
  ///   "object": "list",
  ///   "url": "/v1/customers/cus_MTlavgAzCLCBor/payment_methods",
  ///   "has_more": false,
  ///   "data": [
  ///     {
  ///       "id": "pm_1LiGEZ2eZvKYlo2CJABZtqVR",
  ///       "object": "payment_method",
  ///       "billing_details": {
  ///         "address": {
  ///           "city": null,
  ///           "country": null,
  ///           "line1": null,
  ///           "line2": null,
  ///           "postal_code": null,
  ///           "state": null
  ///         },
  ///         "email": null,
  ///         "name": null,
  ///         "phone": null
  ///       },
  ///       "card": {
  ///         "brand": "visa",
  ///         "checks": {
  ///           "address_line1_check": null,
  ///           "address_postal_code_check": null,
  ///           "cvc_check": "unchecked"
  ///         },
  ///         "country": "US",
  ///         "exp_month": 8,
  ///         "exp_year": 2023,
  ///         "fingerprint": "Xt5EWLLDS7FJjR1c",
  ///         "funding": "credit",
  ///         "generated_from": null,
  ///         "last4": "4242",
  ///         "networks": {
  ///           "available": [
  ///             "visa"
  ///           ],
  ///           "preferred": null
  ///         },
  ///         "three_d_secure_usage": {
  ///           "supported": true
  ///         },
  ///         "wallet": null
  ///       },
  ///       "created": 1663241275,
  ///       "customer": null,
  ///       "livemode": false,
  ///       "metadata": {},
  ///       "type": "card"
  ///     },
  ///     {...},
  ///     {...}
  ///   ]
  /// }
  Future<dynamic> listCustomerPaymentMethods(String customerId);
  ///Return type example
  ///{
  ///   "id": "pm_1LiGEZ2eZvKYlo2CJABZtqVR",
  ///   "object": "payment_method",
  ///   "billing_details": {
  ///     "address": {
  ///       "city": null,
  ///       "country": null,
  ///       "line1": null,
  ///       "line2": null,
  ///       "postal_code": null,
  ///       "state": null
  ///     },
  ///     "email": null,
  ///     "name": null,
  ///     "phone": null
  ///   },
  ///   "card": {
  ///     "brand": "visa",
  ///     "checks": {
  ///       "address_line1_check": null,
  ///       "address_postal_code_check": null,
  ///       "cvc_check": "unchecked"
  ///     },
  ///     "country": "US",
  ///     "exp_month": 8,
  ///     "exp_year": 2023,
  ///     "fingerprint": "Xt5EWLLDS7FJjR1c",
  ///     "funding": "credit",
  ///     "generated_from": null,
  ///     "last4": "4242",
  ///     "networks": {
  ///       "available": [
  ///         "visa"
  ///       ],
  ///       "preferred": null
  ///     },
  ///     "three_d_secure_usage": {
  ///       "supported": true
  ///     },
  ///     "wallet": null
  ///   },
  ///   "created": 1663241275,
  ///   "customer": null,
  ///   "livemode": false,
  ///   "metadata": {},
  ///   "type": "card"
  /// }
  Future<dynamic> createPaymentMethod(String cardNumber, int expMonth, int expYear, String cvc);
  Future<void> checkout(String userUid, double sum, String paymentMethodId, String customerId);
}