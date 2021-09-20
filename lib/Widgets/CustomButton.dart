import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:kompanions/Constants/Colors.dart';

class _CustomButton extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          fontSize: 20,
        ),
        primary: Color(mainColor),
        minimumSize: Size(double.infinity, 60));
    return ElevatedButton(
      style: style,
      onPressed: widget.handler,
      child: Text(this.widget.content),
    );
  }
}

class CustomButton extends StatefulWidget {
  CustomButton({Key? key, required this.content, this.handler})
      : super(key: key);
  final String content;
  final handler;

  @override
  _CustomButton createState() => _CustomButton();
}
