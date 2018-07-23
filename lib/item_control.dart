import 'package:flutter/material.dart';

class ItemControl extends StatelessWidget {
  final Function addItem;

  ItemControl(this.addItem);
  @override
  Widget build(BuildContext ctx) {
    return RaisedButton(
      color: Theme.of(ctx).primaryColor,
      onPressed: () {
        addItem({'title': 'muscular man', 'image': 'assets/bb.jpg'});
      },
      child: Text('Add item'),
    );
  }
}
