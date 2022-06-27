/// Cart Model
/// Contains the model for the cart app state. What's a cart? a cart is a list
/// of items the customer wants to buy aka Product objects. It's gotta hang around when the user
/// leaves the page.
// libraries
import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';

import "package:flutter/material.dart";
import "package:provider/provider.dart";

//local files
import 'pages/products/products_class.dart';

class CartModel extends ChangeNotifier {
  final List<Product> products = [];
  double total = 0;

  void add(Product product) {
    // update don't add if duplicate product
    for(int i=0; i<products.length; i++) {
      if(products[i].name == product.name) {
        products[i].quantity = product.quantity;
        notifyListeners();
        return;
      }
    }
    products.add(product);
    notifyListeners();
  }

  void remove(String name) {
    for(int i=0; i<products.length; i++) {
      if(products[i].name == name) {
        if(products[i].quantity>1) {
          products[i].quantity--;
          notifyListeners();
          return;
        } else {
          products.remove(products[i]);
          notifyListeners();
          return;
        }
      }
    }
  }

  void removeAll() {
    products.clear();
    total = 0;
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  void calculateTotal() {
    total = 0;
    for(int i=0; i<products.length; i++) {
      total += products[i].price * products[i].quantity;
    }
  }

  // helper functions
  Map toJson() {
    List<Map> jsonList = [];
    for(int i=0; i<products.length; i++) {
      jsonList.add(products[i].toJson());
    }
    return {'order': jsonList.toList()};
  }
}