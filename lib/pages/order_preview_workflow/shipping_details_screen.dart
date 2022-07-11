import 'package:flutter/material.dart';

class ShippingDetailScreen extends StatefulWidget {
  const ShippingDetailScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ShippingDetailsScreenState();
  }
}

class ShippingDetailsScreenState extends State<ShippingDetailScreen> {
  bool isLargeScreen = false;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      if (MediaQuery.of(context).size.width > 600) { // this is more android-like
        isLargeScreen = true;
      } else {
        isLargeScreen = false;
      }
      return isLargeScreen? Text("Big") : Text("Small");
    });
  }
}

class LargeShippingDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LargeShippingDetailsState();
  }
}

class LargeShippingDetailsState extends State<LargeShippingDetails> {
  final cityController = TextEditingController();
  final zipController = TextEditingController();
  final stateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Text("Hu");
  }
}