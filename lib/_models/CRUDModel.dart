import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:einkaufszettel/_models/CustomListItemObject.dart';
import 'package:einkaufszettel/item_list/api/api.dart';
import 'package:einkaufszettel/locator.dart';
import 'package:flutter/material.dart';

class CRUDModel extends ChangeNotifier {
  Api _api = locator<Api>();

  List<CustomListItemObject> items;

  Future<List<CustomListItemObject>> fetchItems() async {
    var result = await _api.getDataCollection();
    items = result.documents
        .map((doc) => CustomListItemObject.fromMap(doc.data, doc.documentID))
        .toList();
    return items;
  }

  Stream<QuerySnapshot> fetchItemsAsStream() {
    return _api.streamDataCollection();
  }

  Future<CustomListItemObject> getItemById(String id) async {
    var doc = await _api.getDocumentById(id);
    return CustomListItemObject.fromMap(doc.data, doc.documentID);
  }

  Future removeItem(String id) async {
    await _api.removeDocument(id);
    return;
  }

  Future addItem(CustomListItemObject item) async {
    var result = await _api.addDocument(item.toJson());
    return;
  }

  Future updateItem(Map item, String id) async {
    await _api.updateDocument(item, id);
    return;
  }
}
