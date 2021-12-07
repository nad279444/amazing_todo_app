import 'package:flutter/material.dart';

import 'home/home.dart';

void main() {
  runApp(const Todos());
}

class Todos extends StatelessWidget {
  const Todos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
                toolbarTextStyle: TextStyle(fontSize: 24, color: Colors.white),
                elevation: 0,
                backgroundColor: Colors.redAccent,
                iconTheme: IconThemeData(color: Colors.white, size: 30))),
        home: const Home());
  }
}
