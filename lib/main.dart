import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
import 'package:flutter_ogranizer/pages/item.dart';


import 'pages/auth.dart';
import 'pages/item_admin.dart';
import 'pages/items.dart';
import './models/item.dart';



void main() 
{
  //debugPaintSizeEnabled = true;
  // debugPaintBaselinesEnabled = true;
  // debugPaintPointersEnabled = true; 
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
  
}
class _MyAppState extends State<MyApp> {

  List<Item> _items = [];

    void _addItem(Item item) {
    setState(() {
      _items.add(item);
    });
  }

  void _deleteItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  void _updateItem(int index, Item item){
    setState(() {
        _items[index] = item;
        });
  }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.deepOrange,
            brightness: Brightness.light,
            accentColor: Colors.deepPurple,
            buttonColor: Colors.deepPurple),
        home: AuthPage(),
        routes: {
          //'/'     :  (ctx) => ItemsPage(_items), //since slash is reserved for root, I had to comment "home: AuthPage()" line to get rid of error. Thanks to that, I do not have to press login button over and over.
          '/admin': (ctx) => ItemsAdminPage(_addItem,_updateItem,_deleteItem,_items), //this is named route
        },
        onGenerateRoute: (RouteSettings settings)
        {
          final List<String> pathElements = settings.name.split('/');
          if(pathElements[0] != '')
          {
            return null;
          }
          if(pathElements[1] == 'product')
          {
            final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(
                        builder: (ctx) => ItemPage(
                          _items[index].title,
                          _items[index].image,
                          _items[index].price,
                          _items[index].description)
                      );
          }
          return null;
        }
        ,
        onUnknownRoute: (RouteSettings settings){
          return MaterialPageRoute(builder: (ctx) => ItemsPage(_items));
        },
        );
  }
}
