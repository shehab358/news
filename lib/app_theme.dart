import 'package:flutter/material.dart';

class AppTheme {
  static Color primary = const Color(0xff39A552);
  static Color black = const Color(0xff303030);
  static Color navy = const Color(0xff4F5A69);
  static Color white = const Color(0xffffffff);
  static Color red = const Color(0xffC91C22);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primary,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      color: primary,
      foregroundColor: white,
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          32,
        ),
      ),
      titleTextStyle: TextStyle(
        fontSize: 22,
        color: white,
        fontWeight: FontWeight.w400,
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
}
