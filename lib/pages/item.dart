import 'dart:async';

import 'package:flutter/material.dart';

import '../widgets/ui_elements/title_default.dart';

class ItemPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;
  final double price;

  ItemPage(
      this.title, this.imageUrl, this.price, this.description); // this is ctor

  // _showWarningDialog(BuildContext ctx) {
  //   return showDialog(
  //       context: ctx,
  //       builder: (ctx) {
  //         return AlertDialog(
  //           title: Text("Are you sure?"),
  //           content: Text("This action cannot be undone!"),
  //           actions: <Widget>[
  //             FlatButton(
  //                 child: Text("Discard"),
  //                 onPressed: () {
  //                   Navigator.pop(ctx);
  //                 }),
  //             FlatButton(
  //               child: Text("Continue"),
  //               onPressed: () {
  //                 Navigator.pop(ctx); //this will close the dialog
  //                 Navigator.pop(ctx, true); //this will delete an item
  //               },
  //             ),
  //           ],
  //         );
  //       });
  // }

  @override
  Widget build(BuildContext ctx) {

    Widget _buildAddressPriceRow()
    {
      return             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Truskaw, Mazowieckie',
                    style: TextStyle(fontFamily: 'Oswald', color: Colors.grey)),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 5.0,
                  ),
                  child: Text(
                    '|',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Text('\$' + price.toString(),
                    style: TextStyle(fontFamily: 'Oswald', color: Colors.grey))
              ],
            );
    }

    return WillPopScope(
      onWillPop: () {
        print("Back button pressed;");
        Navigator.pop(ctx, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: new AppBar(title: Text(title)),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(imageUrl),
            Container(
              padding: EdgeInsets.all(10.0),
              child: TitleDefault(title), 
            ),
            _buildAddressPriceRow(),
            Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.center,
              child: Text(description, textAlign: TextAlign.center,),
            )
          ],
        ),
      ),
    );
  }
}
