import 'package:flutter/material.dart';

import '../models/item.dart';

class ItemEditPage extends StatefulWidget {
  final Function addProduct;
  final Function updateProduct;
  final Item item;
  final int itemIndex;

  ItemEditPage(
      {this.addProduct,
      this.updateProduct,
      this.item,
      this.itemIndex}); // this is received from admin. admin receives it from main. this is func ofcourse... and through this ctor is assigned to the above final func variable.

  @override
  State<StatefulWidget> createState() {
    return _ItemEditPage();
  }
}

class _ItemEditPage extends State<ItemEditPage> {
  final Map<String, dynamic> _formData = {
    'title': null,
    'description': null,
    'price': null,
    'image': 'assets/bb.jpg'
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTitleTextField() {
    return TextFormField(
        decoration: InputDecoration(labelText: 'Item Title'),
        //autovalidate: true,
        initialValue: widget.item == null ? '' : widget.item.title.toString(),
        validator: (String value) {
          // if(value.trim().length <= 0)
          if (value.isEmpty || value.length < 5) {
            return 'Title is required and should be 5+ characters long.';
          }
        },
        onSaved: (String value) {
          _formData['title'] = value;
        });
  }

  Widget _buildDescriptionTextField() {
    return TextFormField(
        maxLines: 4,
        decoration: InputDecoration(labelText: 'Item description'),
        initialValue:
            widget.item == null ? '' : widget.item.description.toString(),
        validator: (String value) {
          // if(value.trim().length <= 0)
          if (value.isEmpty || value.length < 10) {
            return 'Description is required and should be 10+ characters long.';
          }
        },
        onSaved: (String value) {
          _formData['description'] = value;
        });
  }

  Widget _buildPriceTextField() {
    return TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText: 'Item price'),
        initialValue: widget.item == null ? '' : widget.item.price.toString(),
        validator: (String value) {
          // if(value.trim().length <= 0)
          if (value.isEmpty ||
              !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
            return 'Price is required and should a number.';
          }
        },
        onSaved: (String value) {
          _formData['price'] = double.parse(value);
        });
  }

  void _submitForm() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    if (widget.item == null) // add mode
    {
      widget.addProduct(Item(title: _formData['title'], description: _formData['description'], image: _formData['image'], price: _formData['price']));
    } else {
      widget.updateProduct(widget.itemIndex, Item(title: _formData['title'], description: _formData['description'], image: _formData['image'], price: _formData['price']));
    }

    Navigator.pushReplacementNamed(context, '/items');
  }

  Widget _buildPageContent(BuildContext ctx) {
    final double deviceWidth = MediaQuery.of(ctx).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;
    return GestureDetector(
      onTap: () {
        FocusScope.of(ctx).requestFocus(FocusNode());
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
            children: <Widget>[
              _buildTitleTextField(),
              _buildDescriptionTextField(),
              _buildPriceTextField(),
              SwitchListTile(
                  value: true,
                  onChanged: (bool value) {},
                  title: Text('Accept terms')),
              SizedBox(height: 10.0),
              RaisedButton(
                  child: Text("Save"),
                  textColor: Colors.white,
                  onPressed:
                      _submitForm //<- without calling it, it is just a referance

                  )
              // GestureDetector(
              // onTap:  _submitForm,
              // child:Container(color: Colors.green,
              // padding: EdgeInsets.all(5.0),
              // child: Text('MyButton'),)

              // )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext ctx) {
    final Widget pageContent = _buildPageContent(ctx);

    return widget.item == null
        ? pageContent
        : Scaffold(
            appBar: AppBar(
              title: Text('Edit Product'),
            ),
            body: pageContent,
          );
  }
}
