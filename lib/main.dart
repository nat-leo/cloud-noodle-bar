import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:cloud_functions/cloud_functions.dart';

// local files
import 'pages/products/products_page.dart';
import 'pages/order_preview_workflow/order_workflow_after_preview.dart';
import 'pages/order_preview_workflow/order_preview_page.dart';
import 'cart_model.dart';
import 'pages/home/home_page.dart';
import 'pages/landing/landing_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFunctions.instance.useFunctionsEmulator('localhost', 5001);
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
        // is not restarted.x
        colorScheme: const ColorScheme(
          background: Colors.grey,
          onBackground: Colors.grey,
          brightness: Brightness.light,
          error: Colors.red,
          onError: Colors.grey,
          primary: Colors.blueGrey,
          onPrimary: Colors.white,
          secondary: Colors.white,
          onSecondary: Colors.grey,
          surface: Colors.white,
          onSurface: Colors.grey,
        ),
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 0)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2.0),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
      initialRoute: '/home',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const LandingPage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/home': (context) => const HomePage(),
        '/home/order': (context) => const ShippingDetailsPage()
      },
    );
  }
}

