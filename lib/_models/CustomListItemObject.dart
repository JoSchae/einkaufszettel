import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CustomListItemObject {
  String id;
  final String name;
  final int amount;
  String company;
  final Timestamp created;
  Timestamp bought;

  // CustomListItemObject(
  //     {this.id,
  //     @required this.name,
  //     @required this.amount,
  //     this.company,
  //     this.created,
  //     this.bought});

  CustomListItemObject.fromMap(Map snapshot, [String id])
      : id = id ?? '',
        name = snapshot['name'] ?? '',
        amount = snapshot['amount'] ?? 1,
        company = snapshot['company'] ?? '',
        created = snapshot['created'] ?? Timestamp.now(),
        bought = snapshot['bought'] ?? null;

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
