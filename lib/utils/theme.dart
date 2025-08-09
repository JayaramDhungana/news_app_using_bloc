import 'package:flutter/material.dart';

ThemeData darkThemeData = ThemeData(
  appBarTheme: AppBarTheme(
    color: Colors.black,
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
  ),
  brightness: Brightness.dark,
);

ThemeData lightThemeData = ThemeData(
  appBarTheme: AppBarTheme(
    color: Colors.white,
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 25),
  ),
  brightness: Brightness.light,
);
