import 'package:flutter/material.dart';

class PriceTag extends StatelessWidget {
  final String price;

PriceTag(this.price);

  @override
  Widget build(BuildContext ctx) {
    return                   Container(
                    decoration: BoxDecoration(
                        color: Theme.of(ctx).accentColor,
                        borderRadius: BorderRadius.circular(5.0)),
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
                    child: Text(
                      '\$$price',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
  }
}
