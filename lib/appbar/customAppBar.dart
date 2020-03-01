import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) => AppBar(
        leading: IconButton(icon: Icon(Icons.person), onPressed: () => {}),
        title: Text("Einkaufszettel",
            style: TextStyle(fontWeight: FontWeight.bold)),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () => {}),
          IconButton(icon: Icon(Icons.add_shopping_cart), onPressed: () => {}),
        ],
        backgroundColor: Colors.green.shade400,
      );

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
