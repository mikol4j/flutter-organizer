import 'package:flutter/material.dart';

import 'items.dart';

class ItemAdd extends StatelessWidget {
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
              title: Text("All items"),
              onTap: () {
                Navigator.pushReplacement(ctx, MaterialPageRoute(builder: (ctx)=>ItemsPage()));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Manage items"),
      ),
      body: Center(
        child: Text("Manage your items"),
      ),
    );
  }
}
