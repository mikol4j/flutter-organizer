import 'package:flutter/material.dart';

import '../models/item.dart';
import 'item_edit.dart';

class ItemsListPage extends StatelessWidget {
  final Function updateItem;
  final Function deleteItem;
  final List<Item> items;
  ItemsListPage(this.items, this.updateItem, this.deleteItem);

  Widget _buildEditButton(BuildContext ctx, int index) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        Navigator.of(ctx).push(
          MaterialPageRoute(
            builder: (ctx) {
              return ItemEditPage(
                item: items[index],
                updateProduct: updateItem,
                itemIndex: index,
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext ctx) {
    return ListView.builder(
        itemBuilder: (BuildContext ctx, int index) {
          return Dismissible(
            key: Key(items[index].title),
            onDismissed: (DismissDirection direction) {
              if (direction == DismissDirection.endToStart) {
                deleteItem(index);
              }
            },
            background: Container(color: Colors.red),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                      backgroundImage: AssetImage(items[index].image)),
                  title: Text(items[index].title),
                  subtitle: Text(items[index].price.toString()),
                  trailing: _buildEditButton(ctx, index),
                ),
                Divider(),
              ],
            ),
          );
        },
        itemCount: items.length);
  }
}
