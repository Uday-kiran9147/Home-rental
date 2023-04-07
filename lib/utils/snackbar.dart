import 'package:flutter/material.dart';

void showSnackbarCustom(BuildContext context, String text, Color color) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    duration: Duration(milliseconds: 3000),
    content: Text(text),
    backgroundColor: color,
  ));
}
