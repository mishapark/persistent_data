import 'package:categories/ui/screers/details.dart';
import 'package:categories/ui/screers/items.dart';
import 'package:categories/ui/screers/my_homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => const MyHomePage(title: ""),
        '/items': (BuildContext context) => const Items(),
        '/details': (BuildContext context) => const Details(),
      },
    );
  }
}
