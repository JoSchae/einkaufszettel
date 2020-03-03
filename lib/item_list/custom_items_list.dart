import 'package:einkaufszettel/_models/CustomListItemObject.dart';
import 'package:einkaufszettel/item_list/add_cartitem_button.dart';
import 'package:einkaufszettel/item_list/bloc/item_list_bloc.dart';
import 'package:einkaufszettel/item_list/list_item.dart';
import 'package:flutter/material.dart';

// class CustomItemsList extends StatefulWidget {
//   final ValueChanged<CustomListItemObject> parentAction;

//   const CustomItemsList({Key key, this.parentAction}) : super(key: key);

//   @override
//   _CustomItemsListState createState() => _CustomItemsListState();
// }

// class _CustomItemsListState extends State<CustomItemsList> {
//   List<CustomListItemObject> items;

//   @override
//   void initState() {
//     this.items = [
//       new CustomListItemObject(
//           id: UniqueKey(),
//           name: "product_name",
//           amount: 3,
//           company: "company",
//           created: DateTime.now())
//     ];
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<List<CustomListItemObject>>(
//           stream: itemListBloc.getList,
//           initialData: itemListBloc.provider.currentList,
//           builder: (BuildContext context,
//               AsyncSnapshot<List<CustomListItemObject>> snapshot) {
//             return _getListView(snapshot.data);
//           }),
//       floatingActionButton: AddCartItemButton(),
//       backgroundColor: Colors.green.shade600,
//     );
//   }

//   _getListView(List<CustomListItemObject> data) {
//     return ListView.builder(
//         itemCount: data.length,
//         itemBuilder: (BuildContext context, int index) =>
//             CustomListItem(itemObject: data[index]));
//   }
// }

class CustomItemsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<CustomListItemObject>>(
          stream: itemListBloc.getList,
          initialData: itemListBloc.provider.currentList,
          builder: (BuildContext context,
              AsyncSnapshot<List<CustomListItemObject>> snapshot) {
            return _getListView(snapshot.data);
          }),
      floatingActionButton: AddCartItemButton(),
      backgroundColor: Colors.green.shade600,
    );
  }

  _getListView(List<CustomListItemObject> data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) =>
            CustomListItem(itemObject: data[index]));
  }
}
