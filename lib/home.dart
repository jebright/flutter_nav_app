import 'package:flutter/material.dart';
import 'about.dart';

class MyHomePage extends StatefulWidget {
  
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

void _navAbout(BuildContext context) {
  Navigator.push(
      context, new MaterialPageRoute(builder: (context) => new AboutPage()));
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Home Page'),
      ),
      body: new Center(
        child: new RaisedButton(
          child: new Text('Visit About Page'),
          onPressed: () => _navAbout(context),
        ),
      ),
    );
  }
}
