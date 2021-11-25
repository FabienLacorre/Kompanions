import 'package:flutter/material.dart';

errorSnackBar(context, content) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}
