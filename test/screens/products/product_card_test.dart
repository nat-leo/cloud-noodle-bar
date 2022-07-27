// libraries
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// local files
import 'package:cloudnoodlebar/screens/products/product_card.dart';

void main() {
  testWidgets("ProductListing() displays title and price correctly", (tester) async {
    // arrange
    //tester.binding.window.physicalSizeTestValue = Size(1024, 1920); // change screen size
    Widget product = MaterialApp(home: Scaffold(
      body: ProductListing(
        title: "Product",
        price: 7.00,
      ),
    ));
    await tester.pumpWidget(product);
    // act
    final titleFinder = find.text("Product");
    final priceFinder = find.text("7.00");
    // assert
    expect(titleFinder, findsOneWidget);
    expect(priceFinder, findsOneWidget);
  });

  testWidgets("ProductListing() displays title and price correctly", (tester) async {
    // arrange
    //tester.binding.window.physicalSizeTestValue = Size(1024, 1920); // change screen size
    Widget product = MaterialApp(home: Scaffold(
      body: ProductListing(
        title: "Product",
        price: 7.00,
      ),
    ));
    await tester.pumpWidget(product);
    // act
    final titleFinder = find.text("Product");
    final priceFinder = find.text("7.00");
    // assert
    expect(titleFinder, findsOneWidget);
    expect(priceFinder, findsOneWidget);
  });
}