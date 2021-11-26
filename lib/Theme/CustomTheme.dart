import 'package:flutter/material.dart';

// PALETTE BLEU VERT FONCE
// #0B162C
// #1C2942
// #3B556D
// #5FC2BA
// #FFFFFF

// ORANGE
const mainHexaColor = 0xFF508991;
Color mainClassicColor = new Color(mainHexaColor);
Map<int, Color> mainColor = generateEmptyColor();
MaterialColor mainColorMaterial = MaterialColor(mainHexaColor, mainColor);

// GHOSTWHITE
const ghostWhiteHexaColor = 0xFFFBFBFF;
Color ghostWhiteClassicColor = new Color(ghostWhiteHexaColor);
Map<int, Color> ghostWhiteColor = generateEmptyColor();
MaterialColor ghostWhiteColorMaterial =
    MaterialColor(ghostWhiteHexaColor, ghostWhiteColor);

// BLACK
const blackHexaColor = 0xFF000000;
Color blackClassicColor = new Color(blackHexaColor);
Map<int, Color> blackColor = generateEmptyColor();
MaterialColor blackColorMaterial = MaterialColor(blackHexaColor, blackColor);

final appTheme = ThemeData(
    fontFamily: 'Georgia',
    brightness: Brightness.light,
    primaryColor: mainColorMaterial,
    primarySwatch: mainColorMaterial,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: mainColorMaterial,
        onPrimary: Colors.white,
      ),
    ),
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      buttonColor: ghostWhiteColorMaterial,
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ));

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
