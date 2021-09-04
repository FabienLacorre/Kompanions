import 'package:flutter/material.dart';

class _CustomText extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.content,
        style: TextStyle(
            fontSize: widget.size,
            fontWeight: widget.fontWeight,
            decoration: widget.underline));
  }
}

class CustomText extends StatefulWidget {
  CustomText(
      {Key? key,
      this.content = "",
      this.size = 20,
      this.fontWeight = FontWeight.normal,
      this.underline = TextDecoration.none})
      : super(key: key);

  final String content;
  final double size;
  final FontWeight fontWeight;
  final TextDecoration underline;

  @override
  _CustomText createState() => _CustomText();
}
