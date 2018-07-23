import 'package:flutter/material.dart';
import './items.dart';
import 'item_control.dart';

class ItemsManager extends StatefulWidget {
  final Map<String, String> startingItems;

  ItemsManager({this.startingItems});
  @override
  State<StatefulWidget> createState() {
    return _ItemsManagerState();
  }
}

class _ItemsManagerState extends State<ItemsManager> {
  List<Map<String, String>> _items = [];

  @override
  void initState() {
    if (widget.startingItems != null) {
      _items.add(widget.startingItems);
    }

    super.initState();
  }

  void _deleteItem(int index)
  {
    setState(() {
          _items.removeAt(index);
        });
  }

  @override
  void didUpdateWidget(ItemsManager oldWidget) {
    print("cl didUpdateWidget()");
    super.didUpdateWidget(oldWidget);
  }

  void _addItem(Map<String, String> item) {
    setState(() {
      _items.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(1.0),
          child: ItemControl(_addItem),
        ),
        Expanded(child: Items(_items, deleteItem: _deleteItem))
      ],
    );
  }
}
