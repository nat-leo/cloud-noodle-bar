import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

/// WARNING! This will error on the web app, and running presentPaymentSheet()
/// will break this.
///
/// args: none.
/// returns: a future map, like:
///
/// {
///    paymentIntent: 'zP46NxAgbxG1gk4Rb200TkzmsZkJ7',
///    ephemeralKey: 'uNfQSGsbEKln5jD8n1INU92vdRdCm51KmwZFFdRld',
///    customer: 'zP46NxAgbxG1gk4Rb200TkzmsZkJ7KuN',
///    publishableKey: 'pk_test_zP46NxAgbxG1gk4Rb200TkzmsZkJ7KObBjhMBNKSHG34f79CpTPL15REaS'
/// }
///
Future<Map<String, dynamic>> _createTestPaymentSheet() async {
  HttpsCallable url = FirebaseFunctions.instance.httpsCallable('createPaymentIntent');
  final response = await url();

  return response.data;
}

/// WARNING! This will error on the web app, and running presentPaymentSheet()
/// will break this.
///
/// args: None
/// returns: void
///
/// You need to run this function before running presentPaymentSheet()
/// https://stripe.com/docs/payments/accept-a-payment
Future<void> initPaymentSheet() async {
  late var data;
  try {
    data = await _createTestPaymentSheet();
  } catch(e) {
    print("An error occurred when running _createTestPaymentSheet(): $e");
  }
  try {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          merchantDisplayName: 'Cloud Noodle Bar',
          paymentIntentClientSecret: data["paymentIntent"],
          customerEphemeralKeySecret: data["ephemeralKey"],
          customerId: data["customer"],
          testEnv: true,
          applePay: false,
          googlePay: false,
        )
    );
  } catch(e) {
    print("Error with initPaymentSheet(): $e");
    rethrow;
  }
}

