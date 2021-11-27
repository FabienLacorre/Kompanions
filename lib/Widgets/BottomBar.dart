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
      backgroundColor: greenColorMaterial,
      buttonBackgroundColor: darkGrayColorMaterial,
      color: darkGrayColorMaterial,
      height: 50,
      items: <Widget>[
        Icon(
          Icons.add,
          size: 30,
          color: ghostWhiteColorMaterial,
        ),
        Icon(
          Icons.list,
          size: 30,
          color: ghostWhiteColorMaterial,
        ),
        Icon(
          Icons.compare_arrows,
          size: 30,
          color: ghostWhiteColorMaterial,
        ),
        Icon(
          Icons.compare_arrows,
          size: 30,
          color: ghostWhiteColorMaterial,
        ),
      ],
      onTap: (index) {
        //Handle button tap
      },
    );
  }
}

class BottomBar extends StatefulWidget {
  BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBar createState() => _BottomBar();
}
