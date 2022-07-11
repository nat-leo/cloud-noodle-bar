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

// local files
import 'product_card.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 300,
          child: ProductWidget(name: "Tonkotsu", price: 7.99),
        ),
        Container(
          height: 300,
          child: ProductWidget(name: "Paitan", price: 6.99),
        ),
      ],
    );
  }
}