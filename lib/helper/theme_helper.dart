import 'package:flutter/material.dart';

class ThemeHelper {
  static ThemeHelper themeHelper = ThemeHelper();
  ThemeData darkThemeData = ThemeData.dark().copyWith(
      primaryColor: Colors.black,
      scaffoldBackgroundColor: Colors.black,
      textTheme:
          TextTheme(bodyText1: TextStyle(fontSize: 20, color: Colors.white)));
  ThemeData lightThemeData = ThemeData.light().copyWith(
      primaryColor: Colors.green,
      scaffoldBackgroundColor: Colors.green,
      textTheme:
          TextTheme(bodyText1: TextStyle(fontSize: 20, color: Colors.blue)));
  ThemeData kidsThemeData = ThemeData.light().copyWith(
      primaryColor: Colors.yellow,
      scaffoldBackgroundColor: Colors.yellow,
      textTheme:
          TextTheme(bodyText1: TextStyle(fontSize: 20, color: Colors.black)));
}
