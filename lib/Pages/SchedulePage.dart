import 'package:flutter/material.dart';
import 'package:kompanions/Router/Router.dart';
import 'package:kompanions/Widgets/CustomButton.dart';

class SchedulePage extends StatefulWidget {
  SchedulePage({Key? key}) : super(key: key);
  @override
  _SchedulePage createState() => _SchedulePage();
}

class _SchedulePage extends State<SchedulePage> {
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
                    content: "Redirect kompanions page",
                    handler: () {
                      homeRedirection(context);
                    },
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
