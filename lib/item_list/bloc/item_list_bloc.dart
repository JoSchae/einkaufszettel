import 'dart:async';

import 'package:einkaufszettel/_models/CustomListItemObject.dart';
import 'package:einkaufszettel/item_list/bloc/item_list_provider.dart';
import 'package:flutter/cupertino.dart';

class ItemListBloc {
  final itemListController = StreamController<List<CustomListItemObject>>();
  ItemListProvider provider = new ItemListProvider();

  Stream<List<CustomListItemObject>> get getList => itemListController.stream;

  removeItemFromList(UniqueKey id) {
    provider.removeFromCurrentList(id);
    itemListController.sink.add(provider.currentList);
  }

  addItemToList(CustomListItemObject item) {
    provider.addToCurrentList(item);
    itemListController.sink.add(provider.currentList);
  }

  // void updateList(CustomListItemObject item) {
  //   itemListController.sink.add(item);
  // }

  void dispose() {
    itemListController.close();
  }
}

final itemListBloc = ItemListBloc();
