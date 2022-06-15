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
///
// libraries
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// local files
import 'cart_model.dart';
import 'products_class.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisExtent: 250,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: 1,
      itemBuilder: (context, index) {
        return const SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: ProductWidget(),
        );
      }
    );
  }
}

class ProductWidget extends StatelessWidget {
  const ProductWidget({Key? key}) : super(key: key);

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
                    padding: EdgeInsets.all(6),
                    child: Column(
                      children: [
                        Text("Tonkotsu"),
                        Text("7.99"),
                      ],
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(12)
                    ),
                    onPressed: () {
                      Provider.of<CartModel>(context, listen: false).add(
                        Product(
                          image: "path/to/image",
                          name: "Tonkotsu",
                          price: 7.99,
                        )
                      );
                    },
                    child: Icon(Icons.add)
                  )
                ],
              ),
            ),
          ],
        ),
      );
  }
}