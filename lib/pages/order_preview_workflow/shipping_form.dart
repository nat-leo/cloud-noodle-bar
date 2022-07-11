import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:googleapis/monitoring/v3.dart';
import 'package:provider/provider.dart';

import '../../cart_model.dart';

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
  // UI state for the TextFieldWidgets
  double _width = 0.0;
  Color _color = Colors.white;
  // Responsive ui
  bool isLargeScreen = false;

  void _setFocusedBorder(PointerEvent details) {
    setState(() {
      _width = 2.0;
      _color = Colors.grey;
    });
  }

  void _removeFocusedBorder(PointerEvent details) {
    setState(() {
      _width = 0.0;
      _color = Colors.white;
    });
  }

  // void for now, add error handling so it returns whether or
  // not we we're successful.
  void _addOrder(order) {
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
    };
    FirebaseFirestore db = FirebaseFirestore.instance;
    db.collection("orders").add(data).then((DocumentReference doc) =>
        order.removeAll());
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
            CustomForm(
              controller: nameController,
              hintText: '*Full Name',
            ),
            CustomForm(
              controller: addressController,
              hintText: '*Address',
            ),
            CustomForm(
              controller: addressLineTwoController,
              hintText: 'Address Line 2',
            ),
            Row(
              children: [
                SizedBox(
                  width: 160,
                  child: CustomForm(
                    controller: zipController,
                    hintText: '*Zip Code',
                  ),
                ),
                SizedBox(
                  width: 160,
                  child: CustomForm(
                    controller: cityController,
                    hintText: '*City',
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: CustomForm(
                    controller: stateController,
                    hintText: '*State',
                  ),
                ),
              ],
            ),
            CustomForm(
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
                  CustomForm(
                    controller: nameController,
                    hintText: '*Full Name',
                  ),
                  CustomForm(
                    controller: addressController,
                    hintText: '*Address',
                  ),
                  CustomForm(
                    controller: addressLineTwoController,
                    hintText: 'Address Line 2',
                  ),
                  SizedBox(
                    width: 160,
                    child: CustomForm(
                      controller: zipController,
                      hintText: '*Zip Code',
                    ),
                  ),
                  SizedBox(
                    width: 160,
                    child: CustomForm(
                      controller: cityController,
                      hintText: '*City',
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: CustomForm(
                      controller: stateController,
                      hintText: '*State',
                    ),
                  ),
                  CustomForm(
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
    if (MediaQuery.of(context).size.width > 600) {
      isLargeScreen = true;
    } else {
      isLargeScreen = false;
    }
    return Consumer<CartModel>(
        builder: (context, cart, child) {
          return ListView(
            children: [
              isLargeScreen? _buildWebForm(): _buildMobileForm(),
              Padding(
                padding: EdgeInsets.only(left: 24, right: 24),
                child: ElevatedButton(
                  onPressed: () async {
                    //redirectToCheckout();
                    //await Stripe.instance.presentPaymentSheet();
                    //_addOrder(cart);
                    //await Stripe.instance.presentPaymentSheet();
                  },
                  child: Text("Go to Secure Checkout.")
                )
              )
            ],
          );

        }
    );
  }
}

class CustomForm extends StatefulWidget {
  const CustomForm({
    Key? key,
    required this.controller,
    required this.hintText,
    this.textFieldHeight=1,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final int textFieldHeight;

  @override
  State<StatefulWidget> createState() {
    return CustomFormState();
  }
}

class CustomFormState extends State<CustomForm> {
  double _width = 0.0;
  Color _color = Colors.white;

  void _setFocusedBorder(PointerEvent details) {
    setState(() {
      _width = 2.0;
      _color = Colors.grey;
    });
  }

  void _removeFocusedBorder(PointerEvent details) {
    setState(() {
      _width = 0.0;
      _color = Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: MouseRegion(
        onHover: _setFocusedBorder,
        onEnter: _setFocusedBorder,
        onExit: _removeFocusedBorder,
        child: TextFormField(
          controller: widget.controller,
          maxLines: widget.textFieldHeight,
          minLines: widget.textFieldHeight,
          decoration: InputDecoration(
              hintText: widget.hintText,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: _color, width: _width
                  )
              )
          ),
        ),
      ),
    );
  }
}

Future<Map<String, dynamic>> _createTestPaymentSheet() async {
  HttpsCallable url = FirebaseFunctions.instance.httpsCallable('payment_sheet');
  final response = await url();
  return response.data;
}

Future<void> initPaymentSheet() async {
  try {
    final data = await _createTestPaymentSheet();
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          merchantDisplayName: 'Cloud Noodle Bar',
          paymentIntentClientSecret: data["paymentIntent"],
          customerEphemeralKeySecret: data["ephemeralKey"],
          customerId: data["customer"],
          testEnv: true,
          applePay: false,
          googlePay: false,
        )
    );
  } catch(e) {
    print("Something Happened: $e");
    rethrow;
  }
}
