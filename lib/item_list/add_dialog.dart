import 'package:einkaufszettel/_models/CustomListItemObject.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

class AddItemDialog extends StatefulWidget {
  final ValueChanged<CustomListItemObject> parentAction;

  const AddItemDialog({Key key, this.parentAction}) : super(key: key);

  @override
  _AddItemDialogState createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<AddItemDialog> {
  final _formKey = GlobalKey<FormState>();
  String _productName;
  int _amount = 1;
  String _company = "";

  @override
  Widget build(BuildContext context) {
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
                      Text("Add Item",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold)),
                      Container(
                          width: 60.0,
                          // height: 50.0,
                          child: RaisedButton(
                              onPressed: () => Navigator.pop(context), child: Icon(Icons.close))),
                      // FlatButton(onPressed: null, child: Icon(Icons.close))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(labelText: "Product Name"),
                    // autofocus: true,
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
                    initialValue: this._amount.toString(),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Amount",
                    ),
                    onChanged: (value) {
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
                        var newItem = new CustomListItemObject(
                            id: UniqueKey(),
                            name: _productName,
                            amount: _amount,
                            company: _company,
                            created: DateTime.now());
                        widget.parentAction(newItem);
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
