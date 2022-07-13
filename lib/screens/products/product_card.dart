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
    required this.productUrl,
    required this.productImage,
  }) : super(key: key);

  final String name;
  final double price;
  final String productUrl;
  final Widget productImage;

  @override
  State<StatefulWidget> createState() {
    return ProductWidgetState();
  }
}

class ProductWidgetState extends State<ProductWidget> {
  int quantity = 0;
  bool inCart = false;

  @override void initState() {
    setProductQuantity();
    super.initState();
  }

  void _addToCart() {
    setState(() {
      quantity++;
      inCart = true;
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

  void _removeFromCart() {
    setState(() {
      quantity--;
      if(quantity<=0) {
        quantity = 0;
        inCart = false;
      }
      Provider.of<CartModel>(context, listen: false).remove(widget.name);
      Provider.of<CartModel>(context, listen: false).calculateTotal();
    });
  }

  void setProductQuantity() {
    if(Provider.of<CartModel>(context, listen: false).contains(widget.name)) {
      setState(() {
        inCart = true;
        quantity = Provider.of<CartModel>(context, listen: false).get(widget.name).quantity;
      });
    }
  }

  int getProductQuantity() {
    setProductQuantity();
    return quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, cart, child) {
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
                  child: widget.productImage,
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
                    TextButton(
                      style: TextButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(12)
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, widget.productUrl);
                      },
                      child: const Text("Add to Cart"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
