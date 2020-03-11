import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:einkaufszettel/_models/CRUDModel.dart';
import 'package:einkaufszettel/_models/CustomListItemObject.dart';
import 'package:einkaufszettel/item_list/add_cartitem_button.dart';
import 'package:einkaufszettel/item_list/bloc/item_list_bloc.dart';
import 'package:einkaufszettel/item_list/bloc/item_list_provider.dart';
import 'package:einkaufszettel/item_list/list_item.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  const CustomItemsList({Key key, this.analytics, this.observer})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<CustomListItemObject> items;
    final itemsProvider = Provider.of<CRUDModel>(context);
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: itemsProvider.fetchItemsAsStream(),
          // initialData: itemListBloc.provider.currentList,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              items = snapshot.data.documents.map((doc) {
                return CustomListItemObject.fromMap(doc.data, doc.documentID);
              }).toList();
              items.removeWhere((item) => item.bought != null);
              return _getListView(items);
            } else {
              return Text("Something doesn't work correctly");
            }
            // return _getListView(snapshot.data);
          }),
      floatingActionButton: AddCartItemButton(
        analytics: analytics,
        observer: observer,
      ),
      backgroundColor: Colors.grey.shade200,
    );
  }

  _getListView(List<CustomListItemObject> data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) =>
            CustomListItem(itemObject: data[index]));
  }
}
