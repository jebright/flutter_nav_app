import 'dart:async';

import 'package:flutter/material.dart';

class MyFormPage extends StatefulWidget {
  @override
  _MyFormPageState createState() => new _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();
  bool saved = false;

  void _submit() {
    final form = formKey.currentState;
    if (!form.validate()) {
      return;
    }

    saved = true;
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
        backgroundColor: Colors.black, content: new Text("Saved!")));
  }

  Future<bool> _canLeave(BuildContext context) {
    if (saved) {
      return new Future<bool>.value(true);
    } else
      return _prompt(context);
  }

  Future<bool> _prompt(BuildContext context) {
    return showDialog(
          context: context,
          child: new AlertDialog(
            title: new Text('Warning - Incomplete form'),
            content: new Text('Do you want to stay and complete this form?'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text('My Form'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Form(
          key: formKey,
          autovalidate: true,
          child: new Column(
            children: [
              new TextFormField(
                  decoration: new InputDecoration(labelText: 'Enter something'),
                  validator: (val) =>
                      val.isEmpty ? "You must enter something" : null),
              new RaisedButton(
                onPressed: _submit,
                child: new Text('Save'),
              ),
            ],
          ),
          onWillPop: () => _canLeave(context),
        ),
      ),
    );
  }
}
