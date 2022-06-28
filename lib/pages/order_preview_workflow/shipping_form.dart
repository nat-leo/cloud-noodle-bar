import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:googleapis/monitoring/v3.dart';
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
  // controllers for the TextField Widgets
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final zipController = TextEditingController();
  final stateController = TextEditingController();
  // UI state for the TextFieldWidgets
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
    return Consumer<CartModel>(
        builder: (context, cart, child) {
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
                    controller: TextEditingController(),
                    hintText: 'Address Line 2',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

class CustomForm extends StatefulWidget {
  const CustomForm({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;

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
    return MouseRegion(
      onHover: _setFocusedBorder,
      onEnter: _setFocusedBorder,
      onExit: _removeFocusedBorder,
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
            hintText: widget.hintText,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: _color, width: _width
                )
            )
        ),
      ),
    );
  }
}