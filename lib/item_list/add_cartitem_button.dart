import 'package:einkaufszettel/_models/CustomListItemObject.dart';
import 'package:einkaufszettel/item_list/add_dialog.dart';
import 'package:flutter/material.dart';

class AddCartItemButton extends StatefulWidget {
  final ValueChanged<CustomListItemObject> parentAction;

  const AddCartItemButton({Key key, this.parentAction}) : super(key: key);

  @override
  _AddCartItemButtonState createState() => _AddCartItemButtonState();
}

class _AddCartItemButtonState extends State<AddCartItemButton> {
  @override
  Widget build(BuildContext context) => FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) => AddItemDialog(parentAction: widget.parentAction));
          // widget.parentAction();
        },
        child: Icon(
          Icons.add,
          size: 50.0,
        ),
        backgroundColor: Colors.green.shade400,
      );
}
