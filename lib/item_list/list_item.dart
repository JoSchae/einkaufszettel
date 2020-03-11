import 'package:einkaufszettel/_models/CustomListItemObject.dart';
import 'package:einkaufszettel/item_list/bloc/item_list_bloc.dart';
import 'package:einkaufszettel/item_list/edit_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:einkaufszettel/_models/CRUDModel.dart';

class CustomListItem extends StatelessWidget {
  final CustomListItemObject itemObject;

  const CustomListItem({Key key, this.itemObject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var itemsProvider = Provider.of<CRUDModel>(context);

    return Card(
      // color: Colors.grey.shade300,
      elevation: 4.0,
      child: ListTile(
        contentPadding: EdgeInsets.all(0.0),
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.clear, color: Colors.green.shade500, size: 24.0,),
                onPressed: () {
                  itemsProvider.removeItem(itemObject.id);
                }),
            // Container(
            //   width: 60.0,
            //   height: 60.0,
            //   child: Image.asset(
            //     "assets/images/hotdog.jpeg",
            //     fit: BoxFit.fitHeight,
            //   ),
            // ),
          ],
        ),
        title: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Text(itemObject.amount.toString() + "x"),
            ),
            Expanded(
              child: Text(
                itemObject.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              itemObject.company,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(itemObject.created.toDate().toString())
          ],
        ),
        trailing: IconButton(
            icon: Icon(Icons.done, color: Colors.green.shade500, size: 24.0,),
            onPressed: () {
              itemsProvider.resolveItem(itemObject);
            }),
        onTap: () => editItem(context, this.itemObject),
      ),
    );
  }

  editItem(BuildContext context, CustomListItemObject item) {
    showDialog(
        context: context,
        builder: (BuildContext context) => EditItemDialog(item: itemObject));
  }
}
