import 'package:flutter/material.dart';

class _CustomText extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    var fontStyle = widget.fontFamily;
    var otherStyle = TextStyle(
        color: widget.color,
        fontSize: widget.size,
        fontWeight: widget.fontWeight,
        decoration: widget.underline);
    return Text(widget.content, style: otherStyle.merge(fontStyle));
  }
}

class CustomText extends StatefulWidget {
  CustomText({
    Key? key,
    this.content = "",
    this.size = 20,
    this.fontWeight = FontWeight.normal,
    this.underline = TextDecoration.none,
    this.color = Colors.black,
    this.fontFamily,
  }) : super(key: key);

  final String content;
  final double size;
  final FontWeight fontWeight;
  final TextDecoration underline;
  final Color color;
  final fontFamily;

  @override
  _CustomText createState() => _CustomText();
}
