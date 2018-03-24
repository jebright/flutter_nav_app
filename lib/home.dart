import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
                  title: new Text("About"),
                  trailing: new Icon(Icons.info),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed('/about');
                  }),
              new ListTile(
                  title: new Text("Contact"),
                  trailing: new Icon(Icons.phone),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed('/contact');
                  }),
            ],
          ),
        ),
        body: new Center(
          child: new Text("Home Page", style: new TextStyle(fontSize: 35.0)),
        ));
  }
}
