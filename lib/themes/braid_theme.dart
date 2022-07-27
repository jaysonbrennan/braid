import 'package:flutter/material.dart';

import 'bottom_bar_theme.dart';
import 'text_button_theme.dart';

final braidLightTheme = ThemeData(
  bottomNavigationBarTheme: navigationBarTheme,
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Colors.blue,
    onPrimary: Colors.yellow,
    secondary: Colors.yellow,
    onSecondary: Colors.blue,
    background: Colors.blue,
    onBackground: Colors.yellow,
    surface: Colors.blue,
    onSurface: Colors.yellow,
    error: Colors.red,
    onError: Colors.white,
  ),
  scaffoldBackgroundColor: Colors.white,
  textButtonTheme: textButtonTheme,
);
