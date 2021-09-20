import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:kompanions/Constants/Colors.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const TopBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(mainColor),
      actions: [
        Icon(Icons.more_vert),
      ],
      title: Text(this.title),
    );
  }

  static final _appBar = AppBar();
  @override
  Size get preferredSize => _appBar.preferredSize;
}
