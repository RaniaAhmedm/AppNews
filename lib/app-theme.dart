import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
      appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(
      color: Color.fromRGBO(57, 165, 82, 1.0),
    ),
    backgroundColor: Color.fromRGBO(57, 165, 82, 1.0),
    elevation: 0.0,
    shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(120),
    ),
  ));
}
