import 'package:flutter/material.dart';

final textButtonTheme = TextButtonThemeData(
  style: TextButton.styleFrom(
    primary: Colors.yellow,
    backgroundColor: Colors.blue,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25),
    ),
    padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
    elevation: 4.0,
  ),
);
