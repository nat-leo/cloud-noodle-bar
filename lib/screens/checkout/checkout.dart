// libraries
import 'package:flutter/material.dart';

// local files
import 'shipping_form.dart';
import 'your_cart.dart';

class ShippingDetailsPage extends StatelessWidget {
  const ShippingDetailsPage({Key? key}) : super(key: key);

  Widget _buildMobile() {
    return ListView(
      children: [
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                height: 900, // if too small, add scrolling to shipping form that hides the go to checkout button.
                width: 600,
                decoration: BoxDecoration(
                  color: Color(0xFFDEDEE0),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ShippingForm(),
              ),
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
                    children: [
                      Expanded(
                        child: YourCart(),
                      ),
                    ],
                  ),
                )
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildWeb() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Stack(
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
                ),
              ),
            ],
          ),
        ),
        Flexible(
          child: Stack(
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
                  child: YourCart(),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

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
          if(constraints.maxWidth<1000) {
            return _buildMobile();
          } else {
            return _buildWeb();
          }
        },
      )
    );
  }
}


