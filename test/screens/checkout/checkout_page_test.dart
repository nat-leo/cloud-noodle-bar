/// checkout_page_test.dart
/// This is the widget testing file for the CheckoutPage() widget.
/// We are testing to make sure that the widget applies:
///   1. Responsiveness to mobile and web platforms.
///   2. Uses the right layout widgets for mobile and web.
///
/// Don't test the functionality of child widgets imported from other files in the
/// checkout screen folder. Only test the functionality of the CheckoutPage() widget
/// itself, or other flutter core widgets like Drawer() or navigation that do not
/// appear elsewhere.

// libraries
import 'package:cloudnoodlebar/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// local files
import 'package:cloudnoodlebar/screens/checkout/checkout_page.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets("Checkout Page Screen loads Checkout() Widget", (tester) async {
    // arrange
    //tester.binding.window.physicalSizeTestValue = Size(1024, 1920); // change screen size
    Widget checkout = ChangeNotifierProvider(
        create: (context) => CartModel(),
        child: const MaterialApp(
            home: Scaffold(
              body: CheckoutPage(),
            )
        )
    );
    await tester.pumpWidget(checkout);
    // act
    // assert
    expect(find.byWidget(checkout), findsOneWidget);
  });
}