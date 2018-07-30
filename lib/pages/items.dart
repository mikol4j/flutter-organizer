import 'package:flutter/material.dart';

import '../models/item.dart';
import '../widgets/items/items.dart';




class ItemsPage extends StatelessWidget {
  final List<Item> items;


  ItemsPage(this.items);
  Widget _buildSideDrawer(BuildContext ctx)
{
  return Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false, //hides hamburger menu when expanded
              title: Text("Choose"),
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text("Manage Items"),
              onTap: () {
                Navigator.pushReplacementNamed(ctx, '/admin');
              },
            ),
          ],
        ),
      );
}

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      drawer: _buildSideDrawer(ctx),
      appBar: new AppBar(title: Text('Flutter-Organizer'),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.favorite),
        onPressed: () {},)
      ],),
      body: Items(items),
    );
  }
}
