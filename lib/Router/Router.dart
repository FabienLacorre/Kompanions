import 'package:flutter/material.dart';
import 'package:kompanions/Pages/Register.dart';
import 'package:kompanions/Pages/Home.dart';

homeRedirection(context) {
  Route route = MaterialPageRoute(builder: (context) => Home());
  Navigator.pushReplacement(context, route);
}

registerRedirection(context) {
  Route route = MaterialPageRoute(builder: (context) => Register());
  Navigator.pushReplacement(context, route);
}
