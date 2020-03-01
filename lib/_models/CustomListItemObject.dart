import 'package:flutter/material.dart';

class CustomListItemObject {
  final UniqueKey id;
  final String name;
  final int amount;
  String company;
  final DateTime created;
  DateTime bought;

  CustomListItemObject({
    @required this.id,
    @required this.name,
    this.amount,
    this.company,
    @required this.created
    });
}
