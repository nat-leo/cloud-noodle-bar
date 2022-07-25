// libraries
import 'package:flutter/material.dart';

// local files
import 'checkout.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Checkout();
        },
      )
    );
  }
}


