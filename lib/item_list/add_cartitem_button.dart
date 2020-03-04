import 'package:einkaufszettel/_models/CustomListItemObject.dart';
import 'package:einkaufszettel/item_list/add_dialog.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';

class AddCartItemButton extends StatelessWidget {

      final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  const AddCartItemButton({Key key, this.analytics, this.observer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) => AddItemDialog(
                analytics: analytics,
                observer: observer
              ));
          // widget.parentAction();
        },
        child: Icon(
          Icons.add,
          size: 50.0,
        ),
        backgroundColor: Colors.green.shade400,
      );
  }
}

// class AddCartItemButton extends StatefulWidget {

//     final FirebaseAnalytics analytics;
//   final FirebaseAnalyticsObserver observer;

//   const AddCartItemButton({Key key, this.analytics, this.observer}) : super(key: key);
//   // final ValueChanged<CustomListItemObject> parentAction;

//   // const AddCartItemButton({Key key, this.parentAction}) : super(key: key);

//   @override
//   _AddCartItemButtonState createState() => _AddCartItemButtonState();
// }

// class _AddCartItemButtonState extends State<AddCartItemButton> {
//   @override
//   Widget build(BuildContext context) => FloatingActionButton(
//         onPressed: () {
//           showDialog(
//               context: context,
//               builder: (BuildContext context) => AddItemDialog(
//                 analytics: widget.analytics,
//                 observer: widget.observer
//               ));
//           // widget.parentAction();
//         },
//         child: Icon(
//           Icons.add,
//           size: 50.0,
//         ),
//         backgroundColor: Colors.green.shade400,
//       );
// }
