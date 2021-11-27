import "package:flutter/material.dart";
import 'package:kompanions/Theme/CustomTheme.dart';

/* 

  MATERIAL TEXT FIELD

*/
class _CustomTextField extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: this.widget.placeHolder,
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  CustomTextField(
      {Key? key, required this.placeHolder, required this.controller})
      : super(key: key);
  final String placeHolder;
  final TextEditingController? controller;

  @override
  _CustomTextField createState() => _CustomTextField();
}

/* 

  ROUND TEXT FIELD

*/

class _RoundTextField extends State<RoundTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          color: ghostWhiteColorMaterial,
          borderRadius: BorderRadius.circular(100),
        ),
        child: TextField(
          controller: widget.controller,
          decoration: InputDecoration(
              hintText: widget.placeHolder,
              contentPadding: EdgeInsets.all(15),
              border: InputBorder.none),
        ),
      ),
    );
  }
}

class RoundTextField extends StatefulWidget {
  RoundTextField(
      {Key? key, required this.placeHolder, required this.controller})
      : super(key: key);
  final String placeHolder;
  final TextEditingController? controller;

  @override
  _RoundTextField createState() => _RoundTextField();
}
