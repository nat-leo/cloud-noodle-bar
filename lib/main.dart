import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

// local files
import 'products_page.dart';
import 'order_preview_page.dart';
import 'cart_model.dart';
import 'home_page.dart';
import 'landing_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cloud Noodle Bar',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF484747),
        secondaryHeaderColor: const Color(0xFFFFFFFF),
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      initialRoute: '/landing',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/landing': (context) => const LandingPage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/': (context) => const HomePage(),
      },
    );
  }
}

class Exterior extends StatelessWidget {
  const Exterior({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Expanded(
            flex: 2,
            child: ProductsPage()
          ),
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
    );
  }
}

