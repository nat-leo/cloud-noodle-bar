// libraries
import 'package:cloudnoodlebar/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

// local files
import 'package:cloudnoodlebar/main.dart';
import 'package:cloudnoodlebar/screens/home/home_page.dart';
import 'package:cloudnoodlebar/screens/checkout/checkout_page.dart';
import 'package:provider/provider.dart';

void main() {
  testScreenSize(HomePage());
  //testScreenSize(CheckoutPage());
}

void testScreenSize(Widget page) {
  final TestWidgetsFlutterBinding binding = TestWidgetsFlutterBinding.ensureInitialized();
  for(double height=1920;height>568;height-=100) { // 568 pixels (iPhone 5) is the smallest height of any phone
    for(double width=1080;width>320;width-=100) { // 320 pixels (iPhone 5) is the smallest width of any phone
      final TestWidgetsFlutterBinding binding = TestWidgetsFlutterBinding.ensureInitialized();
      testWidgets("Widget $page doesn't overflow on any screen size (width by height) $width by $height", (tester) async {
        await binding.setSurfaceSize(Size(width, height));
        try {
          await tester.pumpWidget(ChangeNotifierProvider(
            create: (context) => CartModel(),
            child: MyAppTest(home: page),
          ));
        } catch(e) {
          print("Error on screen size with width: $width, height: $height."
              " $e",);
        }
      });
    }
  }
}
