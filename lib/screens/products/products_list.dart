/// Products Page
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

// libraries
import 'package:cloudnoodlebar/utilities/storage.dart';
import 'package:flutter/material.dart';
import 'package:googleapis/forms/v1.dart';

// local files
import 'product_card.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({Key? key}) : super(key: key);

  Widget _buildMobile(context) {
    return GridView.count(
      crossAxisCount: 2,
      children: [
        ProductListing(title: "Chicken Paitan", price: 8.00, url: "/home/order/chicken_paitan"),
        ProductListing(title: "Tonkotsu", price: 8.00, url: "/home/order/pork_tonkotsu"),
        ProductListing(title: "Mushroom", price: 8.00,),
      ],
    );
  }

  Widget _buildWeb(context) {
    return GridView.count(
      crossAxisCount: 4,
      children: [
        ProductListing(title: "Chicken Paitan", price: 8.00, url: "/home/order/chicken_paitan"),
        ProductListing(title: "Tonkotsu", price: 8.00, url: "/home/order/pork_tonkotsu"),
        ProductListing(title: "Mushroom", price: 8.00,),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if(constraints.maxWidth<600) {
          return _buildMobile(context);
        } else {
          return _buildWeb(context);
        }
      },
    );
  }
}