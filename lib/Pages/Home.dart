import 'package:flutter/material.dart';
import 'package:kompanions/Constants/Colors.dart';
import 'package:kompanions/Widgets/CustomButton.dart';
import "package:kompanions/Components/KompanionCard.dart";
import "package:kompanions/Pages/AddKompanion.dart";
import "package:kompanions/Widgets/BottomBar.dart";
import 'package:kompanions/Widgets/TopBar.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  handlerAddNewKompanion() {
    Route route = MaterialPageRoute(builder: (context) => AddKompanion());
    Navigator.push(context, route);
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
