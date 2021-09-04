import 'package:flutter/material.dart';
import 'package:kompanions/Widgets/CustomText.dart';
import 'package:kompanions/Widgets/CustomTextField.dart';

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
      body: Container(
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  CustomText(content: "Ajouter votre kompanion !"),
                  SizedBox(height: 16),
                  CustomTextField(placeHolder: "Nom"),
                  SizedBox(height: 16),
                  CustomTextField(placeHolder: "Race"),
                  SizedBox(height: 16),
                  CustomTextField(placeHolder: "Date de naissance"),
                  SizedBox(height: 16),
                  CustomTextField(placeHolder: "Numéro puce / tatouage"),
                  SizedBox(height: 16),
                  SizedBox(height: 16),
                ],
              ),
            )),
      ),
    );
  }
}
