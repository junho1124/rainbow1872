import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      appBarTheme: const AppBarTheme(
          color: Color(0xD0F8F8F8),
          iconTheme: IconThemeData(color: Colors.black),
          foregroundColor: Colors.black,
          elevation: 0.5
      ),
      splashColor: Colors.transparent
    );
  }
}