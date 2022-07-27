import 'package:flutter/material.dart';

/// Every single whatever_page.dart should have one of these scaffolds that
/// contains the header and drawer menu that is
class PageScaffold extends StatelessWidget {
  final Widget child;
  const PageScaffold({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: FittedBox(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Image(
                        width: 28,
                        height: 28,
                        image: AssetImage('resources/logo.png')
                    ),
                  ),
                ),
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child:  Text(
                    "CLOUD NOODLE BAR",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ]
          ),
        )
      ),
      drawer: Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "CLOUD NOODLE BAR",
                style: Theme.of(context).textTheme.labelSmall,
              ),
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
      body: child
    );
  }
}