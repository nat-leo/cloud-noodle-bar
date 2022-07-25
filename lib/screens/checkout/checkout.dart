// libraries
import 'package:flutter/material.dart';

// local files
import 'shipping_form.dart';
import 'your_cart.dart';

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  Widget _buildMobile() {
    return ListView(
      key: const Key("mobile_scrollview_checkout"),
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
                    children: const [
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
    return LayoutBuilder(
      builder: (context, constraints) {
        if(constraints.maxWidth<1000) {
          print("Building mobile checkout()");
          return _buildMobile();
        } else {
          print("Building web checkout()");
          return _buildWeb();
        }
      },
    );
  }
}
