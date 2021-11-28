import 'package:flutter/material.dart';
import 'package:kompanions/Pages/AddKompanionPage.dart';
import 'package:kompanions/Pages/LoginPage.dart';
import 'package:kompanions/Pages/RegisterPage.dart';
import 'package:kompanions/Pages/HomePage.dart';

loginRedirection(context) {
  Route route = MaterialPageRoute(builder: (context) => LoginPage());
  Navigator.pushReplacement(context, route);
}

registerRedirection(context) {
  Route route = MaterialPageRoute(builder: (context) => RegisterPage());
  Navigator.pushReplacement(context, route);
}

homeRedirection(context) {
  Route route = MaterialPageRoute(builder: (context) => HomePage());
  Navigator.pushReplacement(context, route);
}

addKompanionsRedirection(context) {
  Route route = MaterialPageRoute(builder: (context) => AddKompanionPage());
  Navigator.push(context, route);
}
