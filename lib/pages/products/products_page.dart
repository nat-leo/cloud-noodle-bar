/// Products Page
///
/// contains a Gridview of available products that resizes with the screen.
/// Also contains ProductWidget(), a widget that contains individual Card() widgets
/// for each product.
///
/// Use:
/// Call the widget ProductsPage(), the other widgets defined here are helper widgets
/// for the products page. There are no arguments to this widget. It is not meant
/// to be a full stand alone page, so you'll need to add this as the main window.
/// navigation, snack-bars, bottom sheets, and banners need to be built on top
/// of or around this page widget.
///
/// This page contains:
/// ProductPage()
/// ProductWidget()

// libraries
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// local files
import '../../cart_model.dart';
import 'products_class.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisExtent: 250,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: 1,
      itemBuilder: (context, index) {
        return const SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: ProductWidget(name: 'Tonkotsu', price: 7.99),
        );
      }
    );
  }
}

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
      Provider.of<CartModel>(context, listen:false).remove(widget.name);
      Provider.of<CartModel>(context, listen: false).calculateTotal();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              flex: 2,
              child: Icon(Icons.arrow_back_ios_new),
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
