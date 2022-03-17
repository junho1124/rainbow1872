import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      appBarTheme: const AppBarTheme(
          color: mainAppColor,
          iconTheme: IconThemeData(color: Colors.white),
          foregroundColor: Colors.white,
          elevation: 0.5
      ),
      splashColor: Colors.transparent,
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.transparent,
      ),
    );
  }

  static const Color mainAppColor = Color(0xFF46767A);
  static const Color mainTextColor = Color(0xFF46597A);
  static const Color stateGreen = Color(0xFFAADA6A);

}