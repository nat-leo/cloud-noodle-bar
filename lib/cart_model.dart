/// Cart Model
/// Contains the model for the cart app state. What's a cart? a cart is a list
/// of items the customer wants to buy. It's gotta hang around when the user
/// leaves the page.
// libraries
import 'dart:html';

import "package:flutter/material.dart";
import "package:provider/provider.dart";

//local files
import 'products_class.dart';

class CartModel extends ChangeNotifier {
  final List<Product> products = [];
  num total = 0;

  void add(Product product) {
    products.add(product);
    updateTotal(product.price);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  void removeAll() {
    products.clear();
    updateTotal(0);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
  // helper functions
  void updateTotal(price) {
    total += price;
  }
}