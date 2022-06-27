// libraries
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

// local files
import '../../utilities/js_payment_functions.dart';
import '../../cart_model.dart';
import 'shipping_form.dart';
import 'order_details.dart';

class ShippingDetailsPage extends StatelessWidget {
  const ShippingDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cloud Noodle Bar"),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
                padding: const EdgeInsets.all(20),
                primary: Theme.of(context).colorScheme.onPrimary
            ),
            onPressed: () {
              FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: "bill@nye.com",
                  password: "watwatwat"
              );
            },
            child: const Text("Log in"),
          )
        ],
      ),
      drawer: const Drawer(
        child: Center(child: Text("Placeholder")),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  height: 300,
                  width: 600,
                  decoration: BoxDecoration(
                    color: Color(0xFFDEDEE0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ShippingForm(),
                )
              ),
            ],
          ),
          Stack(
            children: [
              Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    height: 200,
                    width: 600,
                    decoration: BoxDecoration(
                      color: const Color(0xFFDEDEE0),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            "Products",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Expanded(
                          child: OrderDetails(),
                        ),
                      ],
                    ),
                  )
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              redirectToCheckout();
            },
            child: Text("Go to Secure Checkout.")
          )
        ],
      ),
    );
  }
}

