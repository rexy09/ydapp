import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text,
    {Color backgroundColor = Colors.black}) {
  final snackBar = SnackBar(
    backgroundColor: backgroundColor,
    elevation: 0.0,
    padding: const EdgeInsets.all(
      10.0, // Inner padding for SnackBar content.
    ),
    behavior: SnackBarBehavior.floating,
    content: Text(
      text,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
