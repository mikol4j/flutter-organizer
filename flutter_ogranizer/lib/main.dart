import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(context) {
    return new MaterialApp(
home: Scaffold(
  appBar: AppBar(
    title: Text('Flutter-Organizer')
  ),
),
    );
  }
}
