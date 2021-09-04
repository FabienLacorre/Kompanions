import 'package:flutter/material.dart';
import "Pages/Login.dart";
import "Pages/Home.dart";

void main() {
  runApp(KompanionsApp());
}

class KompanionsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kompanions',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: Login(),
      home: Home(),
    );
  }
}
