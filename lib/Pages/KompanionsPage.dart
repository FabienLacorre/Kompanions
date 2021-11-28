import 'package:flutter/material.dart';
import 'package:kompanions/Api/PetRequest.dart';
import 'package:kompanions/Classes/Pet.dart';
import 'package:kompanions/Router/Router.dart';
import 'package:kompanions/Widgets/CustomButton.dart';
import 'package:kompanions/Widgets/KompanionCard.dart';
import 'package:kompanions/Widgets/CustomText.dart';

class KompanionsPage extends StatefulWidget {
  KompanionsPage({Key? key}) : super(key: key);
  @override
  _KompanionsPage createState() => _KompanionsPage();
}

class _KompanionsPage extends State<KompanionsPage> {
  late Future<List<Pet>> futureAllPet;

  @override
  void initState() {
    super.initState();
    PetRequest petRequest = PetRequest();
    futureAllPet = petRequest.fetchPets();
  }

  handlerAddNewKompanion(context) {
    addKompanionsRedirection(context);
  }

  buildPetList(BuildContext context, AsyncSnapshot snapshot) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, int index) {
        Pet pet = snapshot.data[index];
        return KompanionCard(
            title: pet.name, subtitle: pet.race!.name, photoSrc: pet.img);
      },
    );
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
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                CustomButton(
                  content: "Ajouter un kompanion",
                  handler: () {
                    this.handlerAddNewKompanion(context);
                  },
                ),
                SizedBox(height: 8),
                FutureBuilder(
                    future: futureAllPet,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return buildPetList(context, snapshot);
                      } else {
                        return buildNoPetsFound();
                      }
                    }),
              ],
            ),
          )),
    );
  }
}
