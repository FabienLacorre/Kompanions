import 'package:flutter/material.dart';
import 'package:kompanions/Pages/AddKompanionPage.dart';
import 'package:kompanions/Pages/LoginPage.dart';
import 'package:kompanions/Pages/RegisterPage.dart';
import 'package:kompanions/Pages/HomePage.dart';
import 'package:kompanions/Pages/addEvent.dart';

popCurrentPage(context) {
  Navigator.pop(context);
}

replacePage(context, page) {
  Route route = MaterialPageRoute(builder: (context) => page);
  Navigator.pushReplacement(context, route);
}

pushPage(context, page) {
  Route route = MaterialPageRoute(builder: (context) => page);
  Navigator.push(context, route);
}

loginRedirection(context) {
  replacePage(context, LoginPage());
}

registerRedirection(context) {
  replacePage(context, RegisterPage());
}

homeRedirection(context) {
  replacePage(context, HomePage());
}

addKompanionsRedirection(context) {
  pushPage(context, AddKompanionPage());
}

addEventRedirection(context) {
  pushPage(context, AddEventPage());
}
