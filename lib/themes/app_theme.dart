import 'package:flutter/material.dart';

const brightness = Brightness.light;
const primaryColor = Color(0xFFfa4d73);
const accentColor = Color(0xFF000000);

ThemeData appTheme() {
  return ThemeData(
    brightness: brightness,
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        fontFamily: "Poppins",
      ),
      bodyMedium: TextStyle(
        fontFamily: "Poppins",
      ),
      labelLarge: TextStyle(
        fontFamily: "Poppins",
      ),
      displaySmall: TextStyle(
        fontFamily: "Poppins",
      ),
      displayLarge: TextStyle(
        fontFamily: "Poppins",
      ),
      displayMedium: TextStyle(
        fontFamily: "Poppins",
      ),
      headlineSmall: TextStyle(
        fontFamily: "Poppins",
      ),
      labelSmall: TextStyle(
        fontFamily: "Poppins",
      ),
      titleMedium: TextStyle(
        fontFamily: "Poppins",
      ),
      titleSmall: TextStyle(
        fontFamily: "Poppins",
      ),
    ),
    
    primaryColor: primaryColor,
    scaffoldBackgroundColor: const Color(0xFFFAFAFA),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor

    )
      );
}
