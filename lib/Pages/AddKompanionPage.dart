import 'package:flutter/material.dart';
import 'package:kompanions/Api/PetRequest.dart';
import 'package:kompanions/Api/RaceRequest.dart';
import 'package:kompanions/Classes/Pet.dart';
import 'package:kompanions/Classes/Race.dart';
import 'package:kompanions/Router/Router.dart';
import 'package:kompanions/Widgets/CustomButton.dart';
import 'package:kompanions/Widgets/CustomText.dart';
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

  late Future<List<Race>> futureAllRaces;
  List<String> racesString = [];
  String selectedRace = '';

  @override
  initState() {
    super.initState();
    initDummyValues();
    RaceRequest raceRequest = RaceRequest();
    futureAllRaces = raceRequest.fetch();
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

  initDummyValues() {
    nameController.text = "Name test";
    raceController.text = "";
    dateController.text = "";
    numPuceController.text = "";
    weightController.text = "";
    placeController.text = "";
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

  buildRaceDropdown(BuildContext context, AsyncSnapshot snapshot) {
    print(snapshot.data);
    selectedRace = snapshot.data[0].name;
    for (final race in snapshot.data) {
      print(race.name);
      racesString.add(race.name);
    }
    return DropdownButton<String>(
        value: selectedRace,
        isExpanded: true,
        icon: const Icon(Icons.arrow_downward),
        onChanged: (String? newValue) {
          print("SET STATE RACE");
          setState(() {
            selectedRace = newValue!;
          });
        },
        items: racesString.map<DropdownMenuItem<String>>((String value) {
          print("VALUE");
          print(value);
          return DropdownMenuItem<String>(
            value: value,
            child: CustomText(content: value),
          );
        }).toList());
  }

  buildNoPetsFound() {
    return CustomText(
      content: 'Aucun kompanions',
      size: 16,
      fontWeight: FontWeight.bold,
    );
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
                  FutureBuilder(
                      future: futureAllRaces,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return buildRaceDropdown(context, snapshot);
                        } else {
                          return buildNoPetsFound();
                        }
                      }),
                  SizedBox(height: 16),
                  CustomTextField(
                      placeHolder: "Nom", controller: nameController),
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
