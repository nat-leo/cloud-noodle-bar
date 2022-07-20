// libraries
import 'package:firebase_analytics/firebase_analytics.dart';
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
                      child: Text(
                        "Add to Cart",
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Colors.black87,
                        ),
                      ),
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

class ProductListing extends StatelessWidget {
  String title;
  double price;
  String? image; // need the ? for nullable and optional fields.
  String? url;

  ProductListing({
    Key? key,
    required this.title,
    required this.price,
    this.image,
    this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        print("I've been violated.");
        url != null? Navigator.pushNamed(context, "${url!}"): print("No url found");
        // Log a select content event
        await FirebaseAnalytics.instance.logEvent(
          name: "select_content",
          parameters: {
            "content_type": "product",
            "debug_mode": true, // so you can see the event in debug view
            "item_id": title,
          },
        );

      },
      child: Container(
        height: 800 / 2.5,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if(image!=null) ...[
              Expanded(
                flex: 2,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(image!),
                  radius: 800 / 2.5 / 4 * 3,
                )
              )
            ] else ...[
              Expanded(
                flex: 2,
                child: CircleAvatar(
                  backgroundColor: Color(0xFF393945),
                  radius: 800 / 2.5 / 4 * 3,
                )
              )
            ],
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Text(title),
                  Text(price.toStringAsFixed(2))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}