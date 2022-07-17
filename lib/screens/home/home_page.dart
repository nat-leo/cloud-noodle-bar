// libraries
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// local files
import '../../cart_model.dart';
import '../products/products_page.dart';
import '../modal/cart_modal_preview.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget _buildWeb(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            flex: 8,
            child: Container(
              height: 800,
              child: Stack(
                children: [
                  ProductsPage(),
                ],
              ),
            )
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
                const Text("CLOUD NOODLE BAR"),
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
      body: Consumer<CartModel>(
          builder: (context, cart, child) {
            return Stack(
                children: [
                  LayoutBuilder(builder: (context, constraints) {
                    if(constraints.maxWidth<600) {
                      return _buildWeb(context);
                    } else {
                      return _buildWeb(context);
                    }
                  }),
                  if(cart.total>0)
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
                                      return YourCartModalPreview();
                                    }
                                );
                              },
                              child: Icon(Icons.shopping_cart_rounded),
                            )
                        )
                    )
                ]
            );
          }
      ),
    );
  }
}
