import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

Future<Map<String, dynamic>> _createTestPaymentSheet() async {
  HttpsCallable url = FirebaseFunctions.instance.httpsCallable('createPaymentIntent');
  final response = await url();

  return response.data;
}

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
    print("Something Happened: $e");
    rethrow;
  }
}
