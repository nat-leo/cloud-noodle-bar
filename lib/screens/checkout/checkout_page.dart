// libraries
import 'package:cloudnoodlebar/screens/modals_and_drawers/page_scaffold.dart';
import 'package:flutter/material.dart';

// local files
import 'checkout.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Checkout();
        },
      )
    );
  }
}


