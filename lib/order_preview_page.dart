/// OrderPreview page
/// Contains a widget to view what's currently in the cart, might be good to use
/// as a bottom sheet.
///
/// Use:
/// use the widget OrderPreviewPage() with no arguments as the return widget of
/// a bottom sheet.
///
// libraries
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// local files
import 'cart_model.dart';

class OrderPreviewPage extends StatelessWidget {
  const OrderPreviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, cart, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: OrderList(),
            ),
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text("Total: ${cart.total.toStringAsFixed(2)}"),
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
            return Center(
              child: Text("Add some stuff"),
            );
          } else {
            return ListView.builder(
                itemCount: cart.products.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(cart.products[index].name),
                    trailing: Text(cart.products[index].price.toStringAsFixed(2)),
                  );
                }
            );
          }
        }
    );
  }
}