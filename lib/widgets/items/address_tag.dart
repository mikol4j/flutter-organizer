import 'package:flutter/material.dart';

class AddressTag extends StatelessWidget {
  final String address;

AddressTag(this.address);

  @override
  Widget build(BuildContext ctx) {
    return                            Container(
            // here I would use DecoratedBox with Padding() inside, but instead of that I used Container with the padding property, it is just another way to achive the same
            padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(4.0),
            ),

            child: Text(address),
          );
  }
}
