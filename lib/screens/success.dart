import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../cart_model.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

  Future logSuccess(context) async {
    await FirebaseAnalytics.instance.logEvent(
      name: "payment_success",
      parameters: {
        "image_name": "some placeholder name",
        "full_text": "full text goes here.",
        "debug_mode": true,
      },
    );
    Provider.of<CartModel>(context, listen: false).paymentSucceeded();
  }

  @override
  Widget build(BuildContext context) {
    logSuccess(context);
    return Scaffold(
        appBar: AppBar(
          title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Image(
                      width: 28,
                      height: 28,
                      image: AssetImage('resources/logo.png')
                  ),
                ),
                Text("CLOUD NOODLE BAR"),
              ]
          ),
        ),
        drawer: Drawer(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Cloud Noodle Bar"),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/home");
                    },
                    child: const Text("Products")
                )
              ],
            ),
          ),
        ),
        body: Success(),
      );
  }
}

class Success extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Success! We've got your order."),
    );
  }
}