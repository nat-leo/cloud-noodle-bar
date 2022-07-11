// libraries
import 'package:flutter/material.dart';

// local files
import 'shipping_form.dart';
import 'order_details.dart';

class ShippingDetailsPage extends StatelessWidget {
  const ShippingDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cloud Noodle Bar"),
        /**actions: <Widget>[
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
        ],**/
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
      body: ListView(
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  height: 800,
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
        ],
      ),
    );
  }
}

