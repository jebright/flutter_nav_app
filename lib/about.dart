import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {

  @override
  _AboutPageState createState() => new _AboutPageState();
}

void _navHome(BuildContext context) {
  Navigator.pop(context);
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('About'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: new Center(
        child: new RaisedButton(
          child: new Text('Back to Home Page'),
          onPressed: () => _navHome(context),
        ),
      ),
    );
  }
}
