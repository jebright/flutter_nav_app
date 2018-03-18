import 'dart:async';

import 'package:flutter/material.dart';
import 'about.dart';
import 'myform.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

void _navAbout(BuildContext context) {
  Navigator.push(
      context, new MaterialPageRoute(builder: (context) => new AboutPage()));
}

void _navForm(BuildContext context) {
  Navigator.push(
      context, new MaterialPageRoute(builder: (context) => new MyFormPage()));
}

Future<bool> _exitApp(BuildContext context) {
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
      ) ??
      false;
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () => _exitApp(context),
        child: new Scaffold(
            appBar: new AppBar(
              title: new Text("Navigation Demo"),
              backgroundColor: Colors.deepOrangeAccent,
            ),
            drawer: new Drawer(
              child: new ListView(
                children: <Widget>[
                  new ListTile(
                    title: new Text("WELCOME"),
                  ),
                  new Divider(),
                  new ListTile(
                      title: new Text("Sample Form"),
                      trailing: new Icon(Icons.edit),
                      onTap: () {
                        Navigator.of(context).pop();
                        _navForm(context);
                      }),
                  new ListTile(
                      title: new Text("About"),
                      trailing: new Icon(Icons.info),
                      onTap: () {
                        Navigator.of(context).pop();
                        _navAbout(context);
                      }),
                ],
              ),
            ),
            body: new Center(
              child:
                  new Text("Home Page", style: new TextStyle(fontSize: 35.0)),
            )));
  }
}
