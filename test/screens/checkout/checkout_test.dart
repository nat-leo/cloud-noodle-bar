/// checkout_test.dart
/// This is the widget testing file for the Checkout() widget.
/// We are testing to make sure that the widget applies:
///   1. Responsiveness to mobile and web platforms.
///   2. Uses the right layout widgets for mobile and web.
///
/// Don't test the functionality of child widgets imported from other files in the
/// checkout screen folder. Only test the functionality of the Checkout() widget
/// itself, or other flutter core widgets like ShippingForm() or navigation that do not
/// appear elsewhere.

// libraries
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// local files
import 'package:cloudnoodlebar/cart_model.dart';
import 'package:cloudnoodlebar/screens/checkout/shipping_form.dart';
import 'package:cloudnoodlebar/screens/checkout/your_cart.dart';
import 'package:cloudnoodlebar/screens/checkout/checkout.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets("Checkout() Widget loads ShippingForm() Widget", (tester) async {
    // arrange
    tester.binding.window.physicalSizeTestValue = const Size(1080, 1920); // change screen size
    Widget checkout = ChangeNotifierProvider(
        create: (context) => CartModel(),
        child: MaterialApp(
            home: Scaffold(
              body: Checkout(),
            )
        )
    );
    await tester.pumpWidget(checkout);
    final shippingFormFinder = find.descendant(of: find.byWidget(checkout), matching: find.byType(ShippingForm));
    // act
    // assert
    expect(shippingFormFinder, findsOneWidget);
  });

  testWidgets("Checkout() Widget loads YourCart() Widget", (tester) async {
    Widget checkout = ChangeNotifierProvider(
        create: (context) => CartModel(),
        child: MaterialApp(
            home: Scaffold(
              body: Checkout(),
            )
        )
    );
    await tester.pumpWidget(checkout);
    final yourCartFinder = find.descendant(of: find.byWidget(checkout), matching: find.byType(YourCart));
    // act
    // NEED TO USE gesture for ListView, otherwise it won't scroll.
    final gesture = await tester.startGesture(Offset.zero); //Position of the scrollview
    await gesture.moveBy(Offset(0, -300)); //How much to scroll by, negative is down, positive is up
    await tester.pump();
    // assert
    expect(find.byType(YourCart), findsOneWidget);
  });
}