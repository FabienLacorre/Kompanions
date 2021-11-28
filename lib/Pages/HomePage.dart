import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:kompanions/Pages/AddKompanionPage.dart';
import 'package:kompanions/Pages/SchedulePage.dart';
import 'package:kompanions/Pages/UserPage.dart';
import 'package:kompanions/Theme/CustomTheme.dart';
import 'package:kompanions/Widgets/TopBar.dart';
import 'KompanionsPage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int page = 0;
  String title = "Kompanions";
  final pages = [
    SchedulePage(),
    KompanionsPage(),
    UserPage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  buildBottomBar() {
    return CurvedNavigationBar(
        backgroundColor: greenColorMaterial,
        buttonBackgroundColor: darkGrayColorMaterial,
        color: darkGrayColorMaterial,
        height: 50,
        index: page,
        letIndexChange: (index) {
          if (index == page) {
            return false;
          }
          return true;
        },
        items: <Widget>[
          Icon(
            Icons.calendar_today,
            size: 30,
            color: ghostWhiteColorMaterial,
          ),
          Icon(
            Icons.pets_outlined,
            size: 30,
            color: ghostWhiteColorMaterial,
          ),
          Icon(
            Icons.account_circle,
            size: 30,
            color: ghostWhiteColorMaterial,
          ),
        ],
        onTap: (index) {
          String tmpTitle = "";
          if (index == 0) {
            tmpTitle = "Agenda";
          }
          if (index == 1) {
            tmpTitle = "Kompanions";
          }
          if (index == 2) {
            tmpTitle = "Profil";
          }
          setState(() {
            page = index;
            title = tmpTitle;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: darkGrayColorMaterial,
        child: SafeArea(
          top: false,
          child: Scaffold(
            appBar: TopBar(
              title: title,
            ),
            bottomNavigationBar: buildBottomBar(),
            body: pages[page],
          ),
        ));
  }
}
