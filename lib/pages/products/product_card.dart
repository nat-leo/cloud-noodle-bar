// libraries
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// local files
import '../../cart_model.dart';
import 'products_class.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({
    Key? key,
    required this.name,
    required this.price,
  }) : super(key: key);

  final String name;
  final double price;

  @override
  State<StatefulWidget> createState() {
    return ProductWidgetState();
  }
}

class ProductWidgetState extends State<ProductWidget> {
  int quantity = 0;
  bool addedToCart = false;

  _addToCart() {
    setState(() {
      quantity++;
      addedToCart = true;
    });
    Provider.of<CartModel>(context, listen: false).add(
        Product(
          image: "path/to/image",
          name: widget.name,
          price: widget.price,
          quantity: quantity,
        )
    );
    Provider.of<CartModel>(context, listen: false).calculateTotal();
  }

  _removeFromCart() {
    setState(() {
      quantity--;
      if(quantity<=0) {
        quantity = 0;
        addedToCart = false;
      }
      Provider.of<CartModel>(context, listen: false).remove(widget.name);
      Provider.of<CartModel>(context, listen: false).calculateTotal();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10)
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  child: Column(
                    children: [
                      Text(widget.name),
                      Text(widget.price.toStringAsFixed(2)),
                    ],
                  ),
                ),
                Container(
                    child: addedToCart? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            style: TextButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(12)
                            ),
                            onPressed: _removeFromCart,
                            child: const Icon(Icons.remove)
                        ),
                        Text("$quantity"),
                        TextButton(
                            style: TextButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(12)
                            ),
                            onPressed: () {_addToCart();},
                            child: const Icon(Icons.add)
                        ),
                      ],
                    ) : TextButton(
                        style: TextButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(12)
                        ),
                        onPressed: _addToCart,
                        child: const Icon(Icons.add)
                    )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
