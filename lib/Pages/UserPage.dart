import 'package:flutter/material.dart';
import 'package:kompanions/Router/Router.dart';
import 'package:kompanions/Widgets/CustomButton.dart';

class UserPage extends StatefulWidget {
  UserPage({Key? key}) : super(key: key);
  @override
  _UserPage createState() => _UserPage();
}

class _UserPage extends State<UserPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  CustomButton(
                    content: "Deconnexion",
                    handler: () {
                      loginRedirection(context);
                    },
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
