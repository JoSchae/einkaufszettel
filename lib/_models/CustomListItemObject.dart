import 'package:flutter/material.dart';

class CustomListItemObject {
  final String id;
  final String name;
  final int amount;
  String company;
  final DateTime created;
  DateTime bought;

  CustomListItemObject(
      {@required this.id,
      @required this.name,
      @required this.amount,
      this.company,
      @required this.created,
      this.bought});

  CustomListItemObject.fromMap(Map snapshot, String id)
      : id = id ?? '',
        name = snapshot[''] ?? '',
        amount = snapshot[''] ?? 1,
        company = snapshot[''] ?? '',
        created = snapshot[''] ?? DateTime.now(),
        bought = snapshot[''] ?? null;

  toJson() {
    return {
      "id": id,
      "name": name,
      "amount": amount,
      "company": company,
      "created": created,
      "bought": bought
    };
  }
}
