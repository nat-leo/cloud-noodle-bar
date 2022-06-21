@JS()
library stripe;

import 'package:js/js.dart';

@JS()
class Stripe{
  external Stripe(String key);

  external redirectToCheckout(CheckoutOptions checkoutOptions);
}

@JS()
@anonymous
class CheckoutOptions{
  external List<LineItem> get lineItems;
  external String get mode;
  external String get successUrl;
  external String get cancelUrl;

  external factory CheckoutOptions({
    List<LineItem> lineItems,
    String mode,
    String successUrl,
    String cancelUrl
  });
}

@JS()
@anonymous
class LineItem{
  external String get price;
  external int get quantity;

  external factory LineItem({
    String price,
    int quantity
  });
}

void redirectToCheckout() {
  // this is a publishable key, which is ok. Add configurable config next time.
  Stripe('pk_test_51KmwZFFdRldObBjhMBNKSHG3zP46NxAkzmsZkJ7KuNfQSGsbEKln5jD8n1INU92vdRdCm4f79CpTPgbxG1gk4Rb200TL15REaS').redirectToCheckout(CheckoutOptions(
    lineItems: [
      LineItem(price: 'price_1LBk6RFdRldObBjh3Ri1rT9g', quantity: 1),
    ],
    mode: 'payment',
    successUrl: 'http://localhost:50119/#/landing',
    cancelUrl: 'http://localhost:50119/#/',
  ));
}
