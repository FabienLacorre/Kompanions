import 'package:flutter/material.dart';
import "Pages/Login.dart";
import 'Theme/CustomTheme.dart';

void main() {
  runApp(KompanionsApp());
}

class KompanionsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kompanions',
      theme: appTheme,
      home: Login(),
    );
  }
}
