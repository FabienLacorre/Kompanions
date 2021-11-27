import 'package:flutter/material.dart';
import 'package:kompanions/Widgets/CustomButton.dart';
import 'package:kompanions/Widgets/CustomTextField.dart';
import 'package:kompanions/Widgets/TopBar.dart';

class AddKompanion extends StatefulWidget {
  AddKompanion({Key? key}) : super(key: key);
  @override
  _AddKompanion createState() => _AddKompanion();
}

class _AddKompanion extends State<AddKompanion> {
  TextEditingController nameController = TextEditingController();
  TextEditingController raceController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController numPuceController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController placeController = TextEditingController();

  @override
  initState() {
    super.initState();
    initDummyValues();
  }

  initDummyValues() {
    nameController.text = "Name test";
    raceController.text = "Race test";
    dateController.text = "01.01.2020";
    numPuceController.text = "012345";
    weightController.text = "5";
    placeController.text = "SPA RENNES";
  }

  handlerAddNewKompanion() {
    Route route = MaterialPageRoute(builder: (context) => AddKompanion());
    Navigator.pushReplacement(context, route);
  }

  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        title: "Ajouter un Kompanion",
      ),
      body: Container(
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  SizedBox(height: 16),
                  CustomTextField(
                      placeHolder: "Nom", controller: nameController),
                  SizedBox(height: 16),
                  CustomTextField(
                      placeHolder: "Race", controller: raceController),
                  SizedBox(height: 16),
                  CustomTextField(
                      placeHolder: "Date de naissance",
                      controller: dateController),
                  SizedBox(height: 16),
                  CustomButton(
                    content: "Changer la date",
                    handler: () => _selectDate(context),
                  ),
                  SizedBox(height: 16),
                  CustomTextField(
                      placeHolder: "Numéro puce / tatouage",
                      controller: numPuceController),
                  SizedBox(height: 16),
                  CustomTextField(
                      placeHolder: "Poid (kg)", controller: weightController),
                  SizedBox(height: 16),
                  CustomTextField(
                      placeHolder: "Lieu de l'adoption",
                      controller: placeController),
                ],
              ),
            )),
      ),
    );
  }
}
