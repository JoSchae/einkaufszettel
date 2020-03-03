import 'package:einkaufszettel/_models/CustomListItemObject.dart';
import 'package:einkaufszettel/appbar/customAppBar.dart';
import 'package:einkaufszettel/item_list/custom_items_list.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: <Widget>[
                Text(
                  "Zettel Name",
                  style:
                      TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(child: CustomItemsList())
        ],
      ),
      backgroundColor: Colors.green.shade600,
    );
  }
}

// class MainPage extends StatefulWidget {
//   @override
//   _MainPageState createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   List<CustomListItemObject> items;

//   // @override
//   // void initState() {
//   //   super.initState();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(),
//       body: Card(
//         color: Colors.green.shade600,
//         child: Column(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Row(
//                 children: <Widget>[
//                   Text(
//                     "Zettel Name",
//                     style:
//                         TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(child: CustomItemsList())
//           ],
//         ),
//       ),
//       backgroundColor: Colors.green.shade600,
//     );
//   }

//   // _addToList(CustomListItemObject item) {
//   //   setState(() {
//   //     this.items.add(item);
//   //   });
//   // }

//   // removeFromList(int itemIndex) {
//   //   setState(() {
//   //     items.removeAt(itemIndex);
//   //   });
//   // }
// }

// class MainPage extends StatelessWidget {
//   final List<CustomListItemObject> items = [
//     new CustomListItemObject("1", "something", 3, "rewe")
//   ];

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         appBar: CustomAppBar(),
//         body: Card(
//           color: Colors.green.shade500,
//           child: Column(
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Row(
//                   children: <Widget>[
//                     Text(
//                       "Zettel Name",
//                       style: TextStyle(
//                           fontSize: 24.0, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(child: CustomItemsList(items: this.items))
//             ],
//           ),
//         ),
//         floatingActionButton: AddCartItemButton(
//           parentAction: _updateItemList,
//         ),
//         backgroundColor: Colors.green.shade600,
//       );

//   _updateItemList(CustomListItemObject item) {
//     items.add(item);
//   }

//   List<CustomListItemObject> _getItemsList() {
//     print(items);
//     return this.items;
//   }
// }
