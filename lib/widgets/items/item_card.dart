import 'package:flutter/material.dart';

import '../../models/item.dart';
import '../ui_elements/title_default.dart';
import 'address_tag.dart';
import 'price_tag.dart';

class ItemCard extends StatelessWidget {
  final Item item;
  final int itemIndex;

  ItemCard(this.item, this.itemIndex);

Widget _buildTitlePriceRow()
{
  return           Container(
              padding: EdgeInsets.only(top: 10.0),
              //Container(padding:EdgeInsets.only(top:10.0, left:10.0),color: Colors.red,child:Text(item['title'])),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TitleDefault(item.title),
                  SizedBox(width: 8.0),
                  PriceTag(item.price.toString()),
                ],
              ));
}
Widget _buildActionButtons(BuildContext ctx)
{
            return ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.info),
                  color: Theme.of(ctx).accentColor,
                  onPressed: () => Navigator.pushNamed<bool>(
                      ctx, '/product/' + itemIndex.toString())),
              IconButton(
                color: Colors.red,
                icon: Icon(Icons.favorite_border),
                onPressed: () {},
              ),
            ],
          );
}
  @override
  Widget build(BuildContext ctx) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(item.image),
          //SizedBox(height: 50.0),
          //Container(margin:EdgeInsets.all(10.0)),
          _buildTitlePriceRow(),
                AddressTag('Truskaw, mazowieckie'),
              _buildActionButtons(ctx),

        ],
      ),
    );
  }
}
