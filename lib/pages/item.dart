import 'dart:async';

import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  final String title;
  final String imageUrl;

  ItemPage(this.title, this.imageUrl); // this is ctor
  @override
  Widget build(BuildContext ctx) {
    return WillPopScope(onWillPop: (){
      print ("Back button pressed;");
      Navigator.pop(ctx,false);
      return Future.value(false);
    },
        child: Scaffold(
            appBar: new AppBar(title: Text(title)),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(imageUrl),
                Container(padding: EdgeInsets.all(10.0), child: Text(title)),
                Container(
                    padding: EdgeInsets.all(10.0),
                    child: RaisedButton(
                      color: Theme.of(ctx).primaryColor,
                      child: Text("Delete"),
                      onPressed: () => Navigator.pop(ctx, true),
                    )),
              ],
            )));
  }
}
