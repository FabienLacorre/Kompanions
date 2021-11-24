import 'package:flutter/material.dart';
import 'package:kompanions/Api/PetRequest.dart';
import 'package:kompanions/Classes/Pet.dart';
import 'package:kompanions/Widgets/CustomButton.dart';
import "package:kompanions/Components/KompanionCard.dart";
import "package:kompanions/Widgets/BottomBar.dart";
import 'package:kompanions/Widgets/CustomText.dart';
import 'package:kompanions/Widgets/TopBar.dart';
import "package:kompanions/Pages/AddKompanion.dart";

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  late Future<List<Pet>> futureAllPet;

  @override
  void initState() {
    super.initState();
    PetRequest petRequest = PetRequest();
    futureAllPet = petRequest.fetchPets();
  }

  handlerAddNewKompanion() async {
    Route route = MaterialPageRoute(builder: (context) => AddKompanion());
    Navigator.push(context, route);
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
      appBar: TopBar(
        title: "Home",
      ),
      bottomNavigationBar: BottomBar(),
      body: Center(
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  CustomButton(
                    content: "Ajouter un kompanion",
                    handler: this.handlerAddNewKompanion,
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
      ),
    );
  }
}
