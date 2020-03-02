import 'package:einkaufszettel/_models/CustomListItemObject.dart';
import 'package:flutter/material.dart';

class ItemListProvider {
  List<CustomListItemObject> currentList = [];

  void addToCurrentList(CustomListItemObject item) {
    currentList.add(item);
  }

  void removeFromCurrentList(UniqueKey id) {
    currentList.removeWhere((item) => item.id == id);
  }
}
