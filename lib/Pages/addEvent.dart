import 'package:flutter/material.dart';
import 'package:kompanions/Router/Router.dart';
import 'package:kompanions/Widgets/CustomButton.dart';
import 'package:kompanions/Widgets/CustomTextField.dart';
import 'package:kompanions/Widgets/TopBar.dart';

class AddEventPage extends StatefulWidget {
  AddEventPage({Key? key}) : super(key: key);
  @override
  _AddEventPage createState() => _AddEventPage();
}

class _AddEventPage extends State<AddEventPage> {
  TextEditingController eventNameController = TextEditingController();

  @override
  initState() {
    super.initState();
    initDummyValues();
  }

  initDummyValues() {
    eventNameController.text = "Name test";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        title: "Ajouter un evenement",
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
                      placeHolder: "Nom de l'evenement",
                      controller: eventNameController),
                  SizedBox(height: 16),
                  CustomButton(
                    content: "Ajouter",
                    handler: () {
                      popCurrentPage(context);
                    },
                  )
                ],
              ),
            )),
      ),
    );
  }
}
