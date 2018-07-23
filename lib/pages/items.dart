import 'package:flutter/material.dart';

import '../items_manager.dart';
import 'item_add.dart';

class ItemsPage extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false, //hides hamburger menu when expanded
              title: Text("Choose"),
            ),
            ListTile(
              title: Text("Manage Items"),
              onTap: () {
                Navigator.pushReplacement(ctx, MaterialPageRoute(builder: (ctx) => ItemAdd()));
              },
            ),
          ],
        ),
      ),
      appBar: new AppBar(title: Text('Flutter-Organizer')),
      body: ItemsManager(),
    );
  }
}
