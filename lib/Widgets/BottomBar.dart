import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:kompanions/Theme/CustomTheme.dart';
// import 'package:kompanions/Constants/Colors.dart';

class _BottomBar extends State<BottomBar> {
  // int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: mainColorMaterial,
      buttonBackgroundColor: ghostWhiteColorMaterial,
      color: ghostWhiteColorMaterial,
      height: 50,
      items: <Widget>[
        Icon(
          Icons.add,
          size: 30,
          color: mainColorMaterial,
        ),
        Icon(
          Icons.list,
          size: 30,
          color: mainColorMaterial,
        ),
        Icon(
          Icons.compare_arrows,
          size: 30,
          color: mainColorMaterial,
        ),
        Icon(
          Icons.compare_arrows,
          size: 30,
          color: mainColorMaterial,
        ),
      ],
      onTap: (index) {
        //Handle button tap
      },
    );

    // return BottomNavigationBar(
    //   items: const <BottomNavigationBarItem>[
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.schedule),
    //       label: 'Agenda',
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.pets),
    //       label: 'Kompanions',
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.settings),
    //       label: 'Paramètres',
    //     ),
    //   ],
    //   currentIndex: 1,
    //   // selectedItemColor: Color(mainColor),
    //   onTap: (int index) {},
    // );
  }
}

class BottomBar extends StatefulWidget {
  BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBar createState() => _BottomBar();
}
