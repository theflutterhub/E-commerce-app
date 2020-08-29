import 'package:flutter/material.dart';

import 'package:flutter_material_pickers/flutter_material_pickers.dart';

class Test extends StatelessWidget {
  
  Widget buildScrollRow(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 150.0,
          child: RaisedButton(
            child: Text("Scroll Picker"),
            onPressed: () => showMaterialScrollPicker(
              context: context,
              title: "Pick Your City",
              showDivider: false,
              items: ["asd","asdas","asdas"],
              selectedItem: "asd",
            
              onCancelled: () => print("Scroll Picker cancelled"),
              onConfirmed: () => print("Scroll Picker confirmed"),
            ),
          ),
        ),
       
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        child: buildScrollRow(context),
      ),
    );
  }
}
