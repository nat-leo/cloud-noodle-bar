// libraries
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
          Row(
            children: [
              Container(
                width: 100,
                child: Text("Heloo"),
              ),
              Container(
                width: 100,
                child: Text("Heloo"),
              ),
              Container(
                width: 100,
                child: Text("Heloo"),
              ),
            ],
          )
        ],
      ),
    );
  }
}