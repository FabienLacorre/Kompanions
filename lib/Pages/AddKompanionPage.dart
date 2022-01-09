import 'package:flutter/material.dart';
import 'package:kompanions/Api/PetRequest.dart';
import 'package:kompanions/Classes/Pet.dart';
import 'package:kompanions/Router/Router.dart';
import 'package:kompanions/Widgets/CustomButton.dart';
import 'package:kompanions/Widgets/CustomTextField.dart';
import 'package:kompanions/Widgets/ErrorSnackBar.dart';
import 'package:kompanions/Widgets/TopBar.dart';

class AddKompanionPage extends StatefulWidget {
  AddKompanionPage({Key? key}) : super(key: key);
  @override
  _AddKompanionPage createState() => _AddKompanionPage();
}

class _AddKompanionPage extends State<AddKompanionPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController raceController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController numPuceController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  DateTime selectedDate = DateTime.now();

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

  selectDate(BuildContext context) async {
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

  addKompanion() async {
    try {
      PetRequest petRequest = new PetRequest();
      Pet inCreationPet = new Pet(name: nameController.text);
      await petRequest.add(inCreationPet);
    } catch (error) {
      errorSnackBar(context, error.toString());
    }
    homeRedirection(context);
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
                    handler: () => selectDate(context),
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
                  SizedBox(height: 16),
                  CustomButton(
                    content: "Ajouter",
                    handler: () {
                      addKompanion();
                    },
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
