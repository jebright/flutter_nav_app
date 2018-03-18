import 'dart:async';

import 'package:flutter/material.dart';

class MyFormPage extends StatefulWidget {
  @override
  _MyFormPageState createState() => new _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final formKey = new GlobalKey<FormState>();
  bool saving = false;

  void _submit() {
    print('submit called...');
    final form = formKey.currentState;
    if (!form.validate()) {
      return;
    }

    setState(() {
      saving = true;
    });

    //Simulate a service call
    print('submitting to backend...');
    new Future.delayed(new Duration(seconds: 4), () {
      Navigator.pop(context);
    });
  }

  Future<bool> _canLeave(BuildContext context) {
    final form = formKey.currentState;
    if (form.validate()) {
      return new Future<bool>.value(true);
    } else
      return _prompt(context);
  }

  Future<bool> _prompt(BuildContext context) {
    return showDialog(
          context: context,
          child: new AlertDialog(
            title: new Text('Warning - Incomplete form'),
            content: new Text('Do you want to stay and complete form?'),
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

  List<Widget> _buildForm(BuildContext context) {
    var l = new List<Widget>();
    l.add(new Form(
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
    ));

    if (saving) {
      l.add(const ModalBarrier(dismissible: false));
      l.add(new Center(child: new CircularProgressIndicator()));
    }
    return l;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('My Form'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Stack(
          children: _buildForm(context),
        ),
      ),
    );
  }
}
