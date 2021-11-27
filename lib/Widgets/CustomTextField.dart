import "package:flutter/material.dart";

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
