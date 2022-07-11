// libraries
import 'package:flutter/material.dart';

// local files
import '../../main.dart';
import '../checkout/order_preview_page.dart';
import '../products/products_page.dart';
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
                    Navigator.pushNamed(context, "/home");
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
              child: Stack(
                children: [
                  ProductsPage(),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(35)
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return OrderPreviewPage();
                                }
                            );
                          },
                          child: Icon(Icons.shopping_cart_rounded),
                        )
                    ),
                  ),
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}