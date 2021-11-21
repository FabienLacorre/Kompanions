import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kompanions/Classes/Pets.dart';
import 'package:kompanions/Widgets/CustomButton.dart';
import "package:kompanions/Components/KompanionCard.dart";
import "package:kompanions/Pages/AddKompanion.dart";
import "package:kompanions/Widgets/BottomBar.dart";
import 'package:kompanions/Widgets/TopBar.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  late Future<Animal> futureAnimal;

  handlerAddNewKompanion() {
    Route route = MaterialPageRoute(builder: (context) => AddKompanion());
    Navigator.push(context, route);
  }

  Future<Animal> fetchAnimal() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
    if (response.statusCode == 200) {
      return Animal.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    futureAnimal = fetchAnimal();
    print(futureAnimal);
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
                  KompanionCard(
                      title: "Capuche",
                      subtitle: "Lapin bélier",
                      photoSrc: "assets/capuche.jpg"),
                  KompanionCard(
                      title: "Hoddie",
                      subtitle: "Chat Européen",
                      photoSrc: "assets/hoddie.jpg"),
                  KompanionCard(
                      title: "P'tit pote",
                      subtitle: "Poisson rouge",
                      photoSrc: "assets/ptipote.jpg"),
                ],
              ),
            )),
      ),
    );
  }
}
