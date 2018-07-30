import 'package:flutter/material.dart';



import '../models/item.dart';
import 'item_edit.dart';
import 'items_list.dart';

class ItemsAdminPage extends StatelessWidget {

final Function addProduct;
final Function deleteProduct;
final Function updateItem;
final List<Item> items;

ItemsAdminPage(this.addProduct,this.updateItem,this.deleteProduct,this.items); //these are functions that are received from main.dart

Widget _buildSideDrawer(BuildContext ctx)
{
  return Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                automaticallyImplyLeading:
                    false, //hides hamburger menu when expanded
                title: Text("Choose"),
              ),
              ListTile(
                leading: Icon(Icons.shop),
                title: Text("All items"),
                onTap: () {
                  Navigator.pushReplacementNamed(ctx, '/items');
                },
              ),
            ],
          ),
        );
}
  @override
  Widget build(BuildContext ctx) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: _buildSideDrawer(ctx),
        appBar: AppBar(
            title: Text("Manage items"),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.create),
                  text: 'Create product',
                ),
                Tab(
                  icon: Icon(Icons.list),
                  text: 'My products',
                ),
              ],
            ),),
        body: TabBarView(
          children: <Widget>[
            ItemEditPage(addProduct:addProduct),
            ItemsListPage(items,updateItem, deleteProduct),
          ],
        ),
      ),
    );
  }
}
