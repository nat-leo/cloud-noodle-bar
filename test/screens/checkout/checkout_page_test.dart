// libraries
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

// local files
import 'package:cloudnoodlebar/cart_model.dart';
import 'package:cloudnoodlebar/screens/checkout/checkout_page.dart';

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