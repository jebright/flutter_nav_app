import 'package:flutter/material.dart';
import 'home.dart';
import 'about.dart';
import 'contact.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Nav Demo 3',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => new MyHomePage(),
        '/about': (BuildContext context) => new AboutPage(),
        '/contact': (BuildContext context) => new ContactPage(),
      },
    );
  }
}