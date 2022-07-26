// libraries
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

class ProductListing extends StatelessWidget {
  String title;
  double price;
  String? image; // need the ? for nullable and optional fields.
  String? url;

  ProductListing({
    Key? key,
    required this.title,
    required this.price,
    this.image,
    this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        print("I've been violated.");
        url != null? Navigator.pushNamed(context, "${url!}"): print("No url found");
        // Log a select content event
        await FirebaseAnalytics.instance.logEvent(
          name: "select_content",
          parameters: {
            "content_type": "product",
            "debug_mode": true, // so you can see the event in debug view
            "item_id": title,
          },
        );

      },
      child: Container(
        height: 800 / 2.5,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if(image!=null) ...[
              Expanded(
                flex: 2,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(image!),
                  radius: 800 / 2.5 / 4 * 3,
                )
              )
            ] else ...[
              Expanded(
                flex: 2,
                child: CircleAvatar(
                  backgroundColor: Color(0xFF393945),
                  radius: 800 / 2.5 / 4 * 3,
                )
              )
            ],
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Text(title),
                  Text(price.toStringAsFixed(2))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}