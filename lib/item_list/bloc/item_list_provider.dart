import 'package:einkaufszettel/_models/CustomListItemObject.dart';
import 'package:flutter/material.dart';

class ItemListProvider {
  List<CustomListItemObject> currentList = [
    new CustomListItemObject(
        id: new UniqueKey(), name: "test", amount: 1, created: DateTime.now()),
    new CustomListItemObject(
        id: new UniqueKey(), name: "test", amount: 1, created: DateTime.now()),
    new CustomListItemObject(
        id: new UniqueKey(), name: "test", amount: 1, created: DateTime.now()),
    new CustomListItemObject(
        id: new UniqueKey(), name: "test", amount: 1, created: DateTime.now()),
    new CustomListItemObject(
        id: new UniqueKey(), name: "test", amount: 1, created: DateTime.now()),
    new CustomListItemObject(
        id: new UniqueKey(), name: "test", amount: 1, created: DateTime.now()),
    new CustomListItemObject(
        id: new UniqueKey(), name: "test", amount: 1, created: DateTime.now()),
    new CustomListItemObject(
        id: new UniqueKey(), name: "test", amount: 1, created: DateTime.now()),
    new CustomListItemObject(
        id: new UniqueKey(), name: "test", amount: 1, created: DateTime.now()),
    new CustomListItemObject(
        id: new UniqueKey(), name: "test", amount: 1, created: DateTime.now()),
    new CustomListItemObject(
        id: new UniqueKey(), name: "test", amount: 1, created: DateTime.now()),
    new CustomListItemObject(
        id: new UniqueKey(), name: "test", amount: 1, created: DateTime.now()),
    new CustomListItemObject(
        id: new UniqueKey(), name: "test", amount: 1, created: DateTime.now()),
    new CustomListItemObject(
        id: new UniqueKey(), name: "test", amount: 1, created: DateTime.now()),
    new CustomListItemObject(
        id: new UniqueKey(), name: "test", amount: 1, created: DateTime.now())
  ];

  void addToCurrentList(CustomListItemObject item) {
    currentList.add(item);
  }

  void removeFromCurrentList(UniqueKey id) {
    currentList.removeWhere((item) => item.id == id);
  }
}
