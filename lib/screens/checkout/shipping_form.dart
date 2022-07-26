/// shipping_form.dart contains the ShippingForm() widget and its supporting cast.

// libraries
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// local files
import '../../cart_model.dart';
import 'custom_text_field.dart';

/// Get user input for shipping details: full name, address, suite/apt number,
/// zip code, city, state, and special delivery instructions. Then this class
/// adds those details our database and redirects or presents the payment form,
/// handled by stripe.
class ShippingForm extends StatefulWidget {
  const ShippingForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ShippingFormState();
  }
}

class ShippingFormState extends State<ShippingForm> {
  // controllers for the TextField Widgets
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final addressLineTwoController = TextEditingController();
  final cityController = TextEditingController();
  final zipController = TextEditingController();
  final stateController = TextEditingController();
  // Responsive ui
  bool isMobileViewPort = false;

  // void for now, add error handling so it returns whether or
  // not we we're successful.
  void _addOrder(order) {
    /// args:
    ///   order - a reference to the CartModel object. It can use all the functions
    ///           defined in CartModel in cart_model.dart, such as order.removeAll()
    ///           or order.calculateTotal(), just like CartModel().removeAll().
    /// returns: nothing.
    String fullName = nameController.text;
    String address = addressController.text;
    String addressLineTwo = addressLineTwoController.text;
    String zipCode = zipController.text;
    String city = cityController.text;
    String state = stateController.text;

    Map<String, dynamic> data = {
      "name": fullName,
      "address": address,
      "address_line_two": addressLineTwo,
      "zip_code": zipCode,
      "city": city,
      "state": state,
      "order": order.toJsonList(),
      "payment_success": false,
    };

    FirebaseFirestore db = FirebaseFirestore.instance;
    db.collection("orders").add(data).then((DocumentReference doc) => {
      order.removeAll(),
      order.setDocumentSnapshotId(doc)
    });
    db.collection("messages").add({
      "to": "+16507304880",
      "body": "New Order: ${data}",
      "from": "+15106216530",
    }).then((doc) => {
      print(doc)
    });
  }

  // Responsive UI elements
  Widget _buildWebForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextField(
              controller: nameController,
              hintText: '*Full Name',
            ),
            CustomTextField(
              controller: addressController,
              hintText: '*Address',
            ),
            CustomTextField(
              controller: addressLineTwoController,
              hintText: 'Address Line 2',
            ),
            Row(
              children: [
                SizedBox(
                  width: 160,
                  child: CustomTextField(
                    controller: zipController,
                    hintText: '*Zip Code',
                  ),
                ),
                SizedBox(
                  width: 160,
                  child: CustomTextField(
                    controller: cityController,
                    hintText: '*City',
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: CustomTextField(
                    controller: stateController,
                    hintText: '*State',
                  ),
                ),
              ],
            ),
            CustomTextField(
              controller: TextEditingController(),
              hintText: 'Delivery Instructions',
              textFieldHeight: 5,
            ),
          ]
        )
      )
    );
  }

  Widget _buildMobileForm() {
    return Form(
        key: _formKey,
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextField(
                    controller: nameController,
                    hintText: '*Full Name',
                  ),
                  CustomTextField(
                    controller: addressController,
                    hintText: '*Address',
                  ),
                  CustomTextField(
                    controller: addressLineTwoController,
                    hintText: 'Address Line 2',
                  ),
                  SizedBox(
                    width: 160,
                    child: CustomTextField(
                      controller: zipController,
                      hintText: '*Zip Code',
                    ),
                  ),
                  SizedBox(
                    width: 160,
                    child: CustomTextField(
                      controller: cityController,
                      hintText: '*City',
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: CustomTextField(
                      controller: stateController,
                      hintText: '*State',
                    ),
                  ),
                  CustomTextField(
                    controller: TextEditingController(),
                    hintText: 'Delivery Instructions',
                    textFieldHeight: 5,
                  )
                ],
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    //initPaymentSheet();
    if (MediaQuery.of(context).size.width > 600) {
      isMobileViewPort = false;
    } else {
      isMobileViewPort = true;
    }
    return Consumer<CartModel>(
        builder: (context, cart, child) {
          return ListView(
            children: [
              isMobileViewPort? _buildMobileForm(): _buildWebForm(),
              Padding(
                padding: EdgeInsets.only(left: 24, right: 24),
                child: ElevatedButton(
                  onPressed: () async {
                    if(kIsWeb) {
                      //redirectToCheckout();
                    }
                    _addOrder(cart);
                  },
                  child: Text(
                    "Go to Secure Checkout.",
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                )
              )
            ],
          );
        }
    );
  }
}

