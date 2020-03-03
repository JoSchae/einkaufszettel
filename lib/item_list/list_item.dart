import 'package:einkaufszettel/_models/CustomListItemObject.dart';
import 'package:einkaufszettel/item_list/bloc/item_list_bloc.dart';
import 'package:flutter/material.dart';

class CustomListItem extends StatelessWidget {
  final CustomListItemObject itemObject;

  const CustomListItem({Key key, this.itemObject}) : super(key: key);

  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          contentPadding: EdgeInsets.all(0.0),
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    itemListBloc.removeItemFromList(this.itemObject.id);
                  }),
              Container(
                width: 60.0,
                height: 60.0,
                child: Image.asset(
                  "assets/images/hotdog.jpeg",
                  fit: BoxFit.fitHeight,
                ),
              ),
            ],
          ),
          title: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Text(itemObject.amount.toString() + "x"),
              ),
              Text(itemObject.name),
            ],
          ),
          subtitle: this.itemObject.company == null ? Container() : Text(itemObject.company),
          trailing: IconButton(
              icon: Icon(Icons.done),
              onPressed: () {
                itemListBloc.resolveItemAsBought(this.itemObject.id);
              }),
        ),
      );
}
