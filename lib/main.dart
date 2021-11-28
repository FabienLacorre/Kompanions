import 'package:flutter/material.dart';
import 'package:kompanions/Pages/HomePage.dart';
import 'Pages/LoginPage.dart';
import 'Theme/CustomTheme.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(KompanionsApp()));
}

class KompanionsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kompanions',
      theme: appTheme,
      home: HomePage(),
    );
  }
}
