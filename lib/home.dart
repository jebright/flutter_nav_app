import 'dart:async';

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

Future<bool> _exitApp( BuildContext context) {
  return showDialog(
      context: context,
      child: new AlertDialog(
        title: new Text('Do you want to exit this application?'),
        content: new Text('We hate to see you leave...'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Yes'),
          ),
        ],
      ),
    ) ?? false; 
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () => _exitApp(context),
        child: new Scaffold(
      appBar: new AppBar(
        title: new Text('Home Page'),
      ),
      body: new Center(
        child: new RaisedButton(
          child: new Text('Visit About Page'),
          onPressed: () => _navAbout(context),
        ),
      ),
    ));
  }
}
