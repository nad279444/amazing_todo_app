import 'package:amazing_todo_app/screens/home/home.dart';
import 'package:flutter/material.dart';

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
            primaryColor: Colors.redAccent,
            appBarTheme: const AppBarTheme(
                toolbarTextStyle: TextStyle(fontSize: 24, color: Colors.white),
                elevation: 0,
                backgroundColor: Colors.redAccent,
                iconTheme: IconThemeData(color: Colors.white, size: 30))),
        home: const Home());
  }
}
