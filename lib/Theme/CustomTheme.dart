import 'package:flutter/material.dart';

const mainColor = 0xFF582900;

Map<int, Color> color = {
  50: Color.fromRGBO(88, 41, 0, .1),
  100: Color.fromRGBO(88, 41, 0, .2),
  200: Color.fromRGBO(88, 41, 0, .3),
  300: Color.fromRGBO(88, 41, 0, .4),
  400: Color.fromRGBO(88, 41, 0, .5),
  500: Color.fromRGBO(88, 41, 0, .6),
  600: Color.fromRGBO(88, 41, 0, .7),
  700: Color.fromRGBO(88, 41, 0, .8),
  800: Color.fromRGBO(88, 41, 0, .9),
  900: Color.fromRGBO(88, 41, 0, 1),
};
MaterialColor mainColorMaterial = MaterialColor(0xFF582900, color);

final appTheme = ThemeData(
    fontFamily: 'Georgia',
    primaryColor: new Color(0xFF582900),
    primarySwatch: mainColorMaterial,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: new Color(0xFF582900),
        onPrimary: Colors.white,
      ),
    ),
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      buttonColor: Colors.white,
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ));
