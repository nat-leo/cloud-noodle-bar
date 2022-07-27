// libraries
import 'package:cloudnoodlebar/screens/modals_and_drawers/page_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// local files
import '../../cart_model.dart';
import '../products/products_list.dart';
import '../modals_and_drawers/cart_modal_preview.dart';

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
                  ProductsList(),
                ],
              ),
            )
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      child: Consumer<CartModel>(
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
