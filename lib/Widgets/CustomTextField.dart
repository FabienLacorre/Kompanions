import "package:flutter/material.dart";

class _CustomTextField extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: false,
      decoration: InputDecoration(
        labelText: this.widget.placeHolder,
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  CustomTextField({Key? key, required this.placeHolder}) : super(key: key);
  final String placeHolder;

  @override
  _CustomTextField createState() => _CustomTextField();
}
