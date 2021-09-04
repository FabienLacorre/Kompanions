import 'package:flutter/material.dart';
import 'package:kompanions/Widgets/CustomButton.dart';
import 'package:kompanions/Widgets/CustomText.dart';

class AddKompanion extends StatefulWidget {
  AddKompanion({Key? key}) : super(key: key);
  @override
  _AddKompanion createState() => _AddKompanion();
}

class _AddKompanion extends State<AddKompanion> {
  handlerAddNewKompanion() {
    Route route = MaterialPageRoute(builder: (context) => AddKompanion());
    Navigator.pushReplacement(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.more_vert),
        ],
        title: Text("Ajouter un kompanion"),
      ),
      body: Center(
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                CustomText(content: "Ajouter votre kompanion !"),
                Padding(padding: EdgeInsets.all(16), child: null),
                SizedBox(height: 16),
              ],
            )),
      ),
    );
  }
}
