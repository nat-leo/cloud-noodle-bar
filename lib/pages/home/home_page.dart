// libraries
import 'package:flutter/material.dart';

// local files
import '../../main.dart';
import 'autocomplete.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cloud Noodle Bar"),
      ),
      drawer: Drawer(
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Cloud Noodle Bar"),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/");
                  },
                  child: const Text("Products")
                )
              ],
            ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AddressSearch(),
          Expanded(
            flex: 8,
            child: Container(
              height: 800,
              child: Exterior(),
            )
          ),
        ],
      ),
    );
  }
}