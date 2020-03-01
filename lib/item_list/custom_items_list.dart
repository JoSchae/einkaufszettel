import 'package:einkaufszettel/_models/CustomListItemObject.dart';
import 'package:einkaufszettel/item_list/add_cartitem_button.dart';
import 'package:einkaufszettel/item_list/list_item.dart';
import 'package:flutter/material.dart';

class CustomItemsList extends StatefulWidget {
  final ValueChanged<CustomListItemObject> parentAction;

  const CustomItemsList({Key key, this.parentAction}) : super(key: key);

  @override
  _CustomItemsListState createState() => _CustomItemsListState();
}

class _CustomItemsListState extends State<CustomItemsList> {
  List<CustomListItemObject> items;

  @override
  void initState() {
    this.items = [
      new CustomListItemObject(
          id: UniqueKey(),
          name: "product_name",
          amount: 3,
          company: "company",
          created: DateTime.now())
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) => CustomListItem(
              itemObject: items[index],
              removeItemAction: _removeItem,
              resolveItemAction: _resolveItem)),
      floatingActionButton: AddCartItemButton(
        parentAction: _addToList,
      ),
      backgroundColor: Colors.green.shade600,
    );
  }

  _removeItem(UniqueKey itemId) {
    setState(() {
      this.items.removeWhere((item) => item.id == itemId);
    });
  }

  _resolveItem(UniqueKey itemId) {
    setState(() {
      this.items.removeWhere((item) => item.id == itemId);
    });
  }

  _addToList(CustomListItemObject item) {
    setState(() {
      this.items.add(item);
    });
  }
}

// class CustomItemsList extends StatelessWidget {

//   final List<CustomListItemObject> items;

//   CustomItemsList({Key key, this.items}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemCount: items.length,
//         itemBuilder: (BuildContext context, int index) =>
//             CustomListItem(itemObject: items[index], parentAction: ,));
//   }

//   _removeItem(String itemId) {

//   }
// }
