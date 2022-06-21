// libraries
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

// local files
import '../../utililties/js_payment_functions.dart';
import '../../cart_model.dart';

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
        children: const [
          ShippingDetails(),
        ],
      ),
    );
  }
}

class ShippingDetails extends StatefulWidget {
  const ShippingDetails({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ShippingDetailsState();
  }
}

class ShippingDetailsState extends State<ShippingDetails> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final zipController = TextEditingController();
  final deliveryInstructionsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
        builder: (context, cart, child) {
          return Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField( // NAME
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Full Name',
                    ),
                  ),
                  TextFormField( // ADDRESS
                    controller: addressController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Address',
                    ),
                  ),
                  TextFormField( // CITY
                    controller: cityController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'City',
                    ),
                  ),
                  TextFormField( // ZIP CODE
                    controller: zipController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Zip Code',
                    ),
                  ),
                  TextFormField( // DELIVERY INSTRUCTIONS
                    controller: deliveryInstructionsController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Delivery Instructions',
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        FirebaseFirestore.instance.collection('orders').add({
                          'name': nameController.text,
                          'address': addressController.text,
                          'city': cityController.text,
                          'zip': zipController.text,
                          'instructions': deliveryInstructionsController.text,
                          'order': jsonEncode(cart.products),
                        });
                        redirectToCheckout();
                      },
                      child: const Text("Stripe Checkout")
                  ),
                ],
              )
          );
        }
    );
  }
}
