import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
      ),
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: HeroText(),
      ),
    );
  }
}

class HeroText extends StatelessWidget {
  const HeroText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Text(
            "Ramen-ya",
            style: TextStyle(
              color: Color(0xFF484747),
              fontSize: 60,
            ),
          ),
          const Divider(
            color: Color(0xFF484747),
            thickness: 5,
            indent: 50,
            endIndent: 50,
          ),
          const Text(
            "Ramen Shop",
            style: TextStyle(
              color: Color(0xFF484747),
              fontSize: 60,
            ),
          ),
          const Text(
            "in a Cup.",
            style: TextStyle(
              color: Color(0xFF484747),
              fontSize: 60,
            ),
          ),
          ElevatedButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFF484747),
                minimumSize: const Size(331, 81),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100))
                )
              ),
              onPressed: (){},
              child: const Text(
                "Order now",
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 30,
                ),
              ))
        ],
      )
    );
  }
}

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(image: AssetImage('resources/hero-background.jpg')),
    );
  }
}

