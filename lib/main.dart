import 'package:cloudnoodlebar/screens/products/pork_tonkotsu.dart';
import 'package:cloudnoodlebar/screens/success.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter/foundation.dart';

// local files
import 'firebase_options.dart';
import 'screens/checkout/checkout_page.dart';
import 'screens/products/chicken_paitan.dart';
import 'cart_model.dart';
import 'screens/home/home_page.dart';
import 'screens/landing/landing_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFunctions.instance.useFunctionsEmulator('localhost', 5001);
  if (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android) {
    // Some android/ios specific code
  }
  else if (defaultTargetPlatform == TargetPlatform.linux || defaultTargetPlatform == TargetPlatform.macOS || defaultTargetPlatform == TargetPlatform.windows) {
    // Some desktop specific code there
    //Stripe.publishableKey = 'pk_test_51KmwZFFdRldObBjhMBNKSHG3zP46NxAkzmsZkJ7KuNfQSGsbEKln5jD8n1INU92vdRdCm4f79CpTPgbxG1gk4Rb200TL15REaS';
  }
  else {
    // Some web specific code there
    Stripe.publishableKey = 'pk_test_51KmwZFFdRldObBjhMBNKSHG3zP46NxAkzmsZkJ7KuNfQSGsbEKln5jD8n1INU92vdRdCm4f79CpTPgbxG1gk4Rb200TL15REaS';
  }
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
          background: Colors.white,
          onBackground: Colors.white,
          brightness: Brightness.light,
          error: Colors.red,
          onError: Colors.white,
          primary: Color(0xFF393945),
          onPrimary: Colors.white,
          secondary: Color(0xFF393945),
          onSecondary: Colors.white,
          surface: Colors.white,
          onSurface: Color(0xFF393945),
        ),
        textTheme: TextTheme(
          headlineMedium: GoogleFonts.poppins(
            color: Color(0xFF393945),
            fontSize: 32,
            fontWeight: FontWeight.w600
          ),
          titleMedium: GoogleFonts.poppins(
            color: Color(0xFF393945),
            fontSize: 28,
            fontWeight: FontWeight.w400
          ),
          bodySmall: GoogleFonts.lora(
            textStyle: TextStyle(
              color: Colors.black87,
              fontSize: 16,
            ),
          ),
          labelLarge: GoogleFonts.dongle(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 36,
              )
          ),
          labelSmall: GoogleFonts.dongle(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 24,
            )
          ),
        ),
        appBarTheme: AppBarTheme(
            color: Colors.white,
            titleTextStyle: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600
              )
            ),
            iconTheme: IconThemeData(color: Color(0xFF393945)),
            actionsIconTheme: const IconThemeData(color: Colors.black87),
            elevation: 0
        ),
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 0.0)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2.0),
          ),
          hoverColor: Colors.white,
          filled: true,
          fillColor: Colors.white,
        ),
      ),
      initialRoute: '/home',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const LandingPage(),
        '/success': (context) => const SuccessPage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/home': (context) => const HomePage(),
        '/home/order': (context) => const CheckoutPage(),
        '/home/order/chicken_paitan': (context) => const ChickenPaitan(),
        '/home/order/pork_tonkotsu': (context) => const PorkTonkotsu(),
      },
    );
  }
}

