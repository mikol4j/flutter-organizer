import 'package:flutter/material.dart';

import 'pages/item.dart';

class Items extends StatelessWidget {
  final List<Map<String, String>> items;
  final Function deleteItem;

  Items(this.items, {this.deleteItem});

  Widget _buildItem(BuildContext ctx, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(items[index]['image']),
          Text(items[index]['title']),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text("Details"),
                onPressed: () => Navigator.push<bool>(
                      ctx,
                      MaterialPageRoute(
                        builder: (ctx) => ItemPage(items[index]['title'], items[index]['image'])
                      ),
                    ).then((bool value)
                    {if(value)
                    {
                      deleteItem(index);
                    }}),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _buildItem,
      itemCount: items.length,
    );
  }
}
