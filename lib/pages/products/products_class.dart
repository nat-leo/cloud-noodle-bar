/// Data Structure for holding products as objects.
///
/// We Need:
/// Data to hold product info
///     a. A thumbnail
///     b. Product name
///     c. Price
///     d. A description (optional)
/// We possibly need:
/// To make https calls to Firebase to get thumbnails, product info,
/// etc. This is so our app loads faster in the beginning (Maybe???)

class Product {
  final String name;
  final double price;
  final String image;
  late int quantity;

  Product({
    required this.name,
    required this.price,
    required this.image,
    this.quantity=0,
  });

  Map toJson() => {
    'product': name,
    'price': price,
    'quantity': quantity.toString(),
  };
}
