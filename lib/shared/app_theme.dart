import 'package:flutter/material.dart';

class AppTheme {
  static Color primary = const Color(0xff39A552);
  static Color black = const Color(0xff303030);
  static Color navy = const Color(0xff4F5A69);
  static Color white = const Color(0xffffffff);
  static Color red = const Color(0xffC91C22);
  static Color grey = const Color(0xff798288);
  static Color blue = const Color(0xff003E90);
  static Color pink = const Color(0xffED1E79);
  static Color brown = const Color(0xffCF7E48);
  static Color lightBlue = const Color(0xff4882CF);
  static Color yellow = const Color(0xffF2D352);

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
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: white,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: black,
      ),
    ),
  );
}
