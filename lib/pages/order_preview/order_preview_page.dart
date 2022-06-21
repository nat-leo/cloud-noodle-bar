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

class OrderPreviewPage extends StatelessWidget {
  const OrderPreviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, cart, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              flex: 2,
              child: OrderList(),
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
                          Navigator.pushNamed(context, "/order");
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

class OrderList extends StatelessWidget {
  const OrderList({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
        builder: (context, cart, child) {
          if(cart.products.isEmpty) {
            return const Center(
              child: Text("Add some stuff"),
            );
          } else {
            return ListView.builder(
                itemCount: cart.products.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text("${cart.products[index].name} (${cart.products[index].quantity}) @ ${cart.products[index].price}"),
                    trailing: Text((cart.products[index].price*cart.products[index].quantity).toStringAsFixed(2))
                  );
                }
            );
          }
        }
    );
  }
}