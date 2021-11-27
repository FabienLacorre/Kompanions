import 'package:flutter/material.dart';

// GREEN
const greenHexaColor = 0xFF4ECCA3;
Color greenClassicColor = new Color(greenHexaColor);
Map<int, Color> greenColor = generateEmptyColor();
MaterialColor greenColorMaterial = MaterialColor(greenHexaColor, greenColor);

// GHOSTWHITE
const ghostWhiteHexaColor = 0xFFFBFBFF;
Color ghostWhiteClassicColor = new Color(ghostWhiteHexaColor);
Map<int, Color> ghostWhiteColor = generateEmptyColor();
MaterialColor ghostWhiteColorMaterial =
    MaterialColor(ghostWhiteHexaColor, ghostWhiteColor);

// LIGHTGRAY
const lightGrayHexaColor = 0xFFEEEEEE;
Color lightGrayClassicColor = new Color(lightGrayHexaColor);
Map<int, Color> lightGrayColor = generateEmptyColor();
MaterialColor lightGrayColorMaterial =
    MaterialColor(lightGrayHexaColor, lightGrayColor);

// DARK GRAY
const darkGrayHexaColor = 0xFF393E46;
Color darkGrayClassicColor = new Color(darkGrayHexaColor);
Map<int, Color> darkGrayColor = generateEmptyColor();
MaterialColor darkGrayColorMaterial =
    MaterialColor(darkGrayHexaColor, darkGrayColor);

// BLACK
const blackHexaColor = 0xFF000000;
Color blackClassicColor = new Color(blackHexaColor);
Map<int, Color> blackColor = generateEmptyColor();
MaterialColor blackColorMaterial = MaterialColor(blackHexaColor, blackColor);

final appTheme = ThemeData(
    fontFamily: 'Georgia',
    brightness: Brightness.light,
    primaryColor: greenColorMaterial,
    primarySwatch: greenColorMaterial,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: greenColorMaterial,
        onPrimary: Colors.white,
      ),
    ),
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      buttonColor: ghostWhiteColorMaterial,
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: darkGrayColorMaterial,
        foregroundColor: ghostWhiteColorMaterial));

Map<int, Color> generateEmptyColor() {
  return {
    50: Color.fromRGBO(0, 0, 0, .1),
    100: Color.fromRGBO(0, 0, 0, .2),
    200: Color.fromRGBO(0, 0, 0, .3),
    300: Color.fromRGBO(0, 0, 0, .4),
    400: Color.fromRGBO(0, 0, 0, .5),
    500: Color.fromRGBO(0, 0, 0, .6),
    600: Color.fromRGBO(0, 0, 0, .7),
    700: Color.fromRGBO(0, 0, 0, .8),
    800: Color.fromRGBO(0, 0, 0, .9),
    900: Color.fromRGBO(0, 0, 0, 1),
  };
}
