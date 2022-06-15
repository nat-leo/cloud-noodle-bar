import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Welcome"),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, "/");
            },
            child: Text("Enter Site"),
          )
        ],
      ),
    );
  }
}