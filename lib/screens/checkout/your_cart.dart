import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../cart_model.dart';

class YourCart extends StatelessWidget {
  const YourCart({Key? key}) : super(key: key);

  Widget _buildMobile() {
    return Consumer<CartModel>(
        builder: (context, cart, child) {
          if(cart.products.isEmpty) {
            return const Center(
              child: Text("Add some stuff"),
            );
          } else {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "Shopping Cart",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: cart.products.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            leading: Text("${cart.products[index].name} (${cart.products[index].quantity}) @ ${cart.products[index].price}"),
                            trailing: Text((cart.products[index].price*cart.products[index].quantity).toStringAsFixed(2))
                        );
                      }
                  ),
                ),
              ],
            );
          }
        }
    );
  }

  Widget _buildWeb() {
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

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if(constraints.maxWidth<1000) {
          return _buildMobile();
        } else {
          return _buildWeb();
        }
      },
    );
  }
}