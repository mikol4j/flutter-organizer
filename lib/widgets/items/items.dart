import 'package:flutter/material.dart';

import '../../models/item.dart';
import 'item_card.dart';



class Items extends StatelessWidget {
  final List<Item> items;

  Items(this.items);

  @override
  Widget build(BuildContext ctx) {
    return ListView.builder(
      itemBuilder: (ctx, int index)  =>ItemCard(items[index],index),
      itemCount: items.length,
    );
  }
}
