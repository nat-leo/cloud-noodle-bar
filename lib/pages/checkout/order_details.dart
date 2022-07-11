import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../cart_model.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

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