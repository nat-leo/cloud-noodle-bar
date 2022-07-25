/// Cart Model
/// Contains the model for the cart app state. What's a cart? a cart is a list
/// of items the customer wants to buy aka Product objects. It's gotta hang around when the user
/// leaves the page.
// libraries
import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';

import "package:flutter/material.dart";

//local files
import 'screens/products/products_class.dart';

class CartModel extends ChangeNotifier {
  late String orderId;
  final List<Product> products = [];
  double total = 0;

  bool contains(String name) {
    for(int i=0; i<products.length; i++) {
      if (products[i].name == name) {
        return true;
      }
    }
    return false;
  }

  Product get(String name) {
    for(int i=0; i<products.length; i++) {
      if (products[i].name == name) {
        return products[i];
      }
    }
    return Product(name: "Not Found", price: 0.00, image: "null");
  }

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

  // For handling orders
  void setDocumentSnapshotId(String documentSnapshotId) {
    orderId = documentSnapshotId;
  }

  void paymentSucceeded() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final orderRef = db.collection("orders").doc(orderId);
    orderRef.update({"payment_success": true}).then(
            (value) => print("DocumentSnapshot successfully updated!"),
            onError: (e) => print("Error updating document $e"));
  }

  // helper functions
  List toJsonList() {
    List<Map> jsonList = [];
    for(int i=0; i<products.length; i++) {
      jsonList.add(products[i].toJson());
    }
    return jsonList;
  }
}