import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../cart_model.dart';
import '../../utilities/js_payment_functions.dart';

class ShippingForm extends StatefulWidget {
  const ShippingForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ShippingFormState();
  }
}

class ShippingFormState extends State<ShippingForm> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final zipController = TextEditingController();
  final stateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
        builder: (context, cart, child) {
          return Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: '*Full Name',
                    ),
                  ),
                  TextFormField(
                    controller: addressController,
                    decoration: const InputDecoration(
                      hintText: '*Address',
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Address Line 2',
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 160,
                        child: TextFormField(
                          controller: zipController,
                          decoration: const InputDecoration(
                            hintText: '*Zip Code',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 160,
                        child: TextFormField(
                          controller: cityController,
                          decoration: const InputDecoration(
                            hintText: '*City',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: TextFormField(
                          controller: stateController,
                          decoration: const InputDecoration(
                            hintText: '*State',
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}
