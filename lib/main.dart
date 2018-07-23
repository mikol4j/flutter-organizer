import 'package:flutter/material.dart';


import 'pages/auth.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.deepOrange,
            brightness: Brightness.light,
            accentColor: Colors.deepPurple),
        home: AuthPage());
  }
}
