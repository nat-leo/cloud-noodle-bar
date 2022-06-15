import 'package:flutter/material.dart';

import 'products_page.dart';
import 'main.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: 100,
            color: Colors.deepPurpleAccent,
          )
        ),
        Expanded(
          flex: 6,
          child: Container(
            height: 800,
            child: Exterior(),
          )
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: 100,
            color: Colors.grey,
          )
        ),
      ],
    );
  }
}