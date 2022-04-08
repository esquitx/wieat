import 'package:flutter/material.dart';

// Import FONTS
import 'package:google_fonts/google_fonts.dart';

var appTheme = ThemeData(
  primaryColor: Colors.orange[300],
  scaffoldBackgroundColor: Colors.orange[300],
  backgroundColor: Colors.orange[300],
  appBarTheme: AppBarTheme(color: Colors.orange[300]),
  bottomAppBarTheme: BottomAppBarTheme(
    color: Colors.orange[300],
  ),
  brightness: Brightness.dark,
  fontFamily: GoogleFonts.nunito().fontFamily,
  textTheme: const TextTheme(
    bodyText1: TextStyle(fontSize: 18),
    bodyText2: TextStyle(fontSize: 16),
    button: TextStyle(
      letterSpacing: 1.5,
      fontWeight: FontWeight.bold,
    ),
    headline1: TextStyle(
      color: Colors.blue,
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
    headline2: TextStyle(
        height: 1.5,
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 14),
    subtitle1: TextStyle(
      height: 1.5,
      color: Colors.blue,
      fontWeight: FontWeight.w500,
      fontSize: 12,
    ),
  ),
  buttonTheme: const ButtonThemeData(),
);
