import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(context) {
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter-Organizer')),
        body:  Card(child: Column(children: <Widget>[
          Image.asset('assets/bb.jpg'),
          Text('Motivation')
        ],),),
      ),
    );
  }
}
