import 'package:flutter/material.dart';

abstract class AppThemes {
  static ThemeData get lightTheme {
    return ThemeData(
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.purple[300],
      ),
    );
  }
}
