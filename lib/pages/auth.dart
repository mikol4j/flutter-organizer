import 'package:flutter/material.dart';

import 'items.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Center(
            child: RaisedButton(
                child: Text("Login"),
                onPressed: () {
                  Navigator.pushReplacement(ctx,
                      MaterialPageRoute(builder: (ctx) => ItemsPage()));
                })));
  }
}
