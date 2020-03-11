import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:einkaufszettel/_models/CustomListItemObject.dart';
import 'package:einkaufszettel/item_list/bloc/item_list_bloc.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:einkaufszettel/_models/CRUDModel.dart';

// class AddItemDialog extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       elevation: 10.0,
//       child: Container(
//         color: Colors.green.shade500,
//         width: MediaQuery.of(context).size.width * 0.9,
//         height: MediaQuery.of(context).size.height * 0.50,
//         child: Column(

//           children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.only(top: 8.0, right: 12.0, bottom: 8.0, left:12.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               // mainAxisSize: MainAxisSize.max,
//               children: <Widget>[
//                 Text("Add Item", style: TextStyle(
//                   fontSize: 20.0,
//                   fontWeight: FontWeight.bold
//                 )),
//                 Container(
//                   width: 60.0,
//                   // height: 50.0,
//                   child: RaisedButton(onPressed: null, child: Icon(Icons.close))),
//                 // FlatButton(onPressed: null, child: Icon(Icons.close))
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextFormField(
//               decoration: InputDecoration(
//                 labelText: "Product"
//               ),
//               autofocus: true,
//               validator: (value) {
//                 if (value.isEmpty) {
//                   return "Please enter some product name";
//                 }
//                 return null;
//               },

//             ),
//           )
//         ],)
//       )
//     );
//   }
// }

class EditItemDialog extends StatefulWidget {
  final CustomListItemObject item;

  const EditItemDialog({Key key, this.item}) : super(key: key);

  @override
  _EditItemDialogState createState() => _EditItemDialogState();
}

class _EditItemDialogState extends State<EditItemDialog> {
  final _formKey = GlobalKey<FormState>();
  String _productName;
  int _amount;
  String _company;

  @override
  Widget build(BuildContext context) {
    var itemsProvider = Provider.of<CRUDModel>(context);

    return Form(
      key: _formKey,
      child: Dialog(
          elevation: 10.0,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, right: 12.0, bottom: 8.0, left: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text("Edit Item",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold)),
                      Container(
                          width: 60.0,
                          // height: 50.0,
                          child: RaisedButton(
                              onPressed: () => Navigator.pop(context),
                              child: Icon(Icons.close))),
                      // FlatButton(onPressed: null, child: Icon(Icons.close))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    initialValue: widget.item.name,
                    decoration: InputDecoration(labelText: "Product Name"),
                    autofocus: true,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please enter some product name";
                      }
                      this._productName = value;
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    maxLength: 3,
                    initialValue: widget.item.amount.toString(),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Amount",
                    ),
                    onChanged: (value) {
                      print("amount: " + int.parse(value).toString());
                      if (value.isNotEmpty) {
                        this._amount = int.parse(value);
                      } else {
                        this._amount = 1;
                      }
                    },
                    onFieldSubmitted: (value) {
                      if (value.isNotEmpty) {
                        this._amount = int.parse(value);
                      } else {
                        this._amount = 1;
                      }
                    },
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    initialValue: widget.item.company,
                    decoration: InputDecoration(labelText: "Company Name"),
                    onChanged: (value) {
                      this._company = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        var newItem = new CustomListItemObject.fromMap({
                          "name": _productName,
                          "amount": _amount,
                          "company": _company,
                          "created": widget.item.created
                        }, widget.item.id);
                        // widget.parentAction(newItem);
                        // itemListBloc.addItemToList(newItem);
                        print(newItem.toJson());
                        itemsProvider.updateItem(newItem.toJson(), newItem.id);
                        Navigator.pop(context, newItem);
                      }
                    },
                    child: Text("Submit"),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
