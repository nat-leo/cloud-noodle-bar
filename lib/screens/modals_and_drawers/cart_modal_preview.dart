/// OrderPreview page
/// Contains a widget to view what's currently in the cart, might be good to use
/// as a bottom sheet.
///
/// Use:
/// use the widget OrderPreviewPage() with no arguments as the return widget of
/// a bottom sheet.

// libraries
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// local files
import '../../cart_model.dart';
import '../checkout/your_cart.dart';

class YourCartModalPreview extends StatelessWidget {
  const YourCartModalPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, cart, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              flex: 2,
              child: YourCart(),
            ),
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.centerRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Total: ${cart.total}"),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/home/order");
                        },
                        child: const Text("Get Delivered")
                    ),
                  ],
                ),
              )
            ),
          ],
        );
      }
    );
  }
}

