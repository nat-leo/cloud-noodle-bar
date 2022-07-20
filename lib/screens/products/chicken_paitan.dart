import 'package:cloudnoodlebar/screens/products/products_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../cart_model.dart';
import '../modal/cart_modal_preview.dart';

class ChickenPaitan extends StatelessWidget {
  const ChickenPaitan({Key? key}) : super(key: key);

  Widget _buildWeb() {
    return Row(
      children: const [
        Expanded(
          flex: 1,
          child: ChickenPhotos(),
        ),
        Expanded(
          flex: 1,
          child: ChickenOverview(),
        ),
      ],
    );
  }

  Widget _buildMobile() {
    return ListView(
      children: [
        ChickenPhotos(),
        ChickenOverview(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Consumer<CartModel>(
        builder: (context, cart, child) {
          return Stack(
            children: [
              LayoutBuilder(builder: (context, constraints) {
                if(constraints.maxWidth<600) {
                  return _buildMobile();
                } else {
                  return _buildWeb();
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

class ChickenPhotos extends StatefulWidget {
  const ChickenPhotos({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ChickenPhotosState();
  }
}

// PHOTO WIDGET
// This is a product photo slideshow, with a main window to
// show the selected image, and a list of images below it that,
// when onHover or onTap, switches to the main window.
class ChickenPhotosState extends State<ChickenPhotos> {
  late String mainPhoto = topView;
  final String topView = "resources/chickenPaitanTop2.jpg";
  final String sideView = "resources/chickenPaitanSide.jpg";
  final String birdsEyeView = "resources/chickenPaitanBirdsEye2.jpg";

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Image(
              image: AssetImage(mainPhoto),
              width: constraints.maxWidth,
              //height: 200,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MouseRegion(
                  onHover: (PointerEvent details) => setState(() {
                    mainPhoto = topView;
                  }),
                  child: GestureDetector(
                    onTap: () => setState(() {
                      mainPhoto = topView;
                    }),
                    child: Image(
                      image: AssetImage(topView),
                      width: constraints.maxWidth/4,
                      //height:50,
                    ),
                  ),
                ),
                MouseRegion(
                  onHover: (PointerEvent details) => setState(() {
                    mainPhoto = sideView;
                  }),
                  child: GestureDetector(
                    onTap: () => setState(() {
                      mainPhoto = sideView;
                    }),
                    child: Image(
                      image: AssetImage(sideView),
                      width: constraints.maxWidth/4,
                    ),
                  ),
                ),
                MouseRegion(
                  onHover: (PointerEvent details) => setState(() {
                    mainPhoto = birdsEyeView;
                  }),
                  child: GestureDetector(
                    onTap: () => setState(() {
                      mainPhoto = birdsEyeView;
                    }),
                    child: Image(
                      image: AssetImage(birdsEyeView),
                      width: constraints.maxWidth/4,
                    ),
                  ),
                ),
                MouseRegion(
                  onHover: (PointerEvent details) => setState(() {
                    mainPhoto = sideView;
                  }),
                  child: GestureDetector(
                    onTap: () => setState(() {
                      mainPhoto = sideView;
                    }),
                    child: Image(
                      image: AssetImage(sideView),
                      width: constraints.maxWidth/4,
                    ),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}

// PRODUCT DESCRIPTION, INSTRUCTIONS, and INGREDIENTS
// This widget shows useful text about the product, including a
// brief description, cooking instructions, and ingredients list.
class ChickenOverview extends StatelessWidget {
  const ChickenOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Description(),
        Instructions(),
        Ingredients(),
      ],
    );
  }
}

// INSTRUCTIONS
// A brief infographic on how to cook the product.
class Instructions extends StatelessWidget {
  const Instructions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Instructions:",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            "After placing cold items (e.g Green onions) on the wax"
            "paper, gently cover the cup with the top leaving a crack "
            "open.",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Image(
                      image: AssetImage("resources/microwave.png"),
                      width: 50,
                    ),
                    Text("Microwave for 60 seconds"),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Image(
                      image: AssetImage("resources/stir.png"),
                      width: 50,
                    ),
                    Text("Stir contents."),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Image(
                      image: AssetImage("resources/microwave.png"),
                      width: 50,
                    ),
                    Text("Microwave for 60 seconds again"),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Image(
                      image: AssetImage("resources/cup-noodle-done.png"),
                      width: 50,
                    ),
                    Text("Enjoy!"),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

// DESCRIPTION
// A brief overview of the product in order to convince you to buy it.
//
// Also includes a responsive button that adds the product to your cart
// and shows you how much you've already got in your cart, stolen from the
// ProductWidget class.
class Description extends StatelessWidget {
  final String name = "Chicken Paitan";
  final double price = 8.00;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "${price.toStringAsFixed(2)}",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Spacer(),
              AddToCartButton(name: name, price: price)
            ],
          ),
          Text(
            "Please buy me I'm so broke I bet everything on this.",
            style: Theme.of(context).textTheme.bodySmall,
          )
        ],
      ),
    );
  }
}

// INGREDIENTS
// A list of ingredients, starting with the most prominent ingredient,
// then a descending order of ingredients by amount of that ingredient
// in the product by weight.
class Ingredients extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Ingredients:",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            "Chicken broth, noodles, soya chicken (chicken, soy sauce, spices),"
                "ajitsuke poahed egg (egg, soy sauce, mirin), tare ("
                "kombu, shiitake mushrooms, bonito flakes, salt, gelatin),"
                " green onion",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}

class AddToCartButton extends StatefulWidget {
  final String name;
  final double price;

  const AddToCartButton({
    Key? key,
    required this.name,
    required this.price,

  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AddToCartButtonState();
  }
}

class AddToCartButtonState extends State<AddToCartButton> {
  int quantity = 0;
  bool inCart = false;

  @override void initState() {
    setProductQuantity();
    super.initState();
  }

  void _addToCart() {
    setState(() {
      quantity++;
      inCart = true;
    });
    Provider.of<CartModel>(context, listen: false).add(
        Product(
          image: "path/to/image",
          name: widget.name,
          price: widget.price,
          quantity: quantity,
        )
    );
    Provider.of<CartModel>(context, listen: false).calculateTotal();
  }

  void _removeFromCart() {
    setState(() {
      quantity--;
      if(quantity<=0) {
        quantity = 0;
        inCart = false;
      }
      Provider.of<CartModel>(context, listen: false).remove(widget.name);
      Provider.of<CartModel>(context, listen: false).calculateTotal();
    });
  }

  void setProductQuantity() {
    if(Provider.of<CartModel>(context, listen: false).contains(widget.name)) {
      setState(() {
        inCart = true;
        quantity = Provider.of<CartModel>(context, listen: false).get(widget.name).quantity;
      });
    }
  }

  int getProductQuantity() {
    setProductQuantity();
    return quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
        builder: (context, cart, child) {
          return Container(
              child: inCart ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Color(0xFF393945),
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(12)
                      ),
                      onPressed: _removeFromCart,
                      child: const Icon(
                        Icons.remove,
                        color: Colors.white,
                      )
                  ),
                  Text(
                    "$quantity",
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Colors.black87,
                    ),
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Color(0xFF393945),
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(12)
                      ),
                      onPressed: () {
                        _addToCart();
                      },
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      )
                  ),
                ],
              ) : TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xFF393945),
                    //shape: const CircleBorder(),
                    //padding: const EdgeInsets.all(12)
                  ),
                  onPressed: () {
                    _addToCart();
                  },
                  child: Text(
                    "ADD TO CART",
                    style: Theme.of(context).textTheme.labelSmall,
                  )
              )
          );
        }
    );
  }
}