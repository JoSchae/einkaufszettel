import 'dart:async';

import 'package:einkaufszettel/_models/CustomListItemObject.dart';
import 'package:einkaufszettel/item_list/bloc/item_list_provider.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';

class ItemListBloc {
  final FirebaseAnalytics analytics = FirebaseAnalytics();
  final itemListController = StreamController<List<CustomListItemObject>>();
  ItemListProvider provider = new ItemListProvider();

  Stream<List<CustomListItemObject>> get getList => itemListController.stream;

  removeItemFromList(UniqueKey id) {
    analytics.logEvent(name: "removeItem");
    provider.removeFromCurrentList(id);
    itemListController.sink.add(provider.currentList);
  }

  resolveItemAsBought(UniqueKey id) {
    analytics.logEvent(name: "resolveItem");
    provider.removeFromCurrentList(id);
    itemListController.sink.add(provider.currentList);
  }

  addItemToList(CustomListItemObject item) {
    analytics.logEvent(name: "addItem");
    provider.addToCurrentList(item);
    itemListController.sink.add(provider.currentList);
  }

  void dispose() {
    itemListController.close();
  }
}

final itemListBloc = ItemListBloc();
