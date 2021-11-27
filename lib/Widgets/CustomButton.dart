import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
// import 'package:kompanions/Constants/Colors.dart';

class _CustomButton extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        shape: new RoundedRectangleBorder(
          borderRadius: widget.radius != null
              ? new BorderRadius.circular(widget.radius)
              : new BorderRadius.circular(10.0),
        ),
        textStyle: const TextStyle(
          fontSize: 20,
        ),
        minimumSize: Size(double.infinity, 60));
    return ElevatedButton(
      style: style,
      onPressed: widget.handler,
      child: Text(this.widget.content),
    );
  }
}

class CustomButton extends StatefulWidget {
  CustomButton({Key? key, required this.content, this.handler, this.radius})
      : super(key: key);
  final String content;
  final handler;
  final radius;

  @override
  _CustomButton createState() => _CustomButton();
}
