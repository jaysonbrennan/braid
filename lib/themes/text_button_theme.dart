import 'package:flutter/material.dart';

final textButtonTheme = TextButtonThemeData(
  style: TextButton.styleFrom(
    backgroundColor: Colors.yellow,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
    elevation: 4.0,
  ),
);
