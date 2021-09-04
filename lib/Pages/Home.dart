import 'package:flutter/material.dart';
import 'package:kompanions/Widgets/CustomButton.dart';
import "../Components/KompanionCard.dart";
// import '../Widgets/CustomText.dart';
// import './Login.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  handlerAddNewKompanion() {
    Route route = MaterialPageRoute(builder: (context) => Home());
    Navigator.pushReplacement(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.more_vert),
        ],
        title: Text("Home"),
      ),
      body: Center(
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.all(16),
                    child: CustomButton(
                      content: "Ajouter un kompanion",
                      handler: this.handlerAddNewKompanion,
                    )),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  child: KompanionCard(
                      title: "Capuche",
                      subtitle: "Lapin bélier",
                      photoSrc: "assets/capuche.jpg"),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  child: KompanionCard(
                      title: "Hoddie",
                      subtitle: "Chat Européen",
                      photoSrc: "assets/hoddie.jpg"),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  child: KompanionCard(
                      title: "P'tit pote",
                      subtitle: "Poisson rouge",
                      photoSrc: "assets/ptipote.jpg"),
                ),
              ],
            )),
      ),
    );
  }
}
