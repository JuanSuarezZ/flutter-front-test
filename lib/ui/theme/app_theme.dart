import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  backgroundColor: const Color(0xff212121),
  primaryColor: const Color(0xff4B4B4B),
  errorColor: Colors.red,
  //text Selection
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.black,
  ),
  //selector field color
  colorScheme: const ColorScheme.light(primary: Color(0xffB68D40)).copyWith(
    secondary: const Color(0xffB68D40),
  ),
  textTheme: const TextTheme(
    //titles
    headline1: TextStyle(
      color: Colors.white,
      fontSize: 26,
      fontFamily: "Roboto",
      fontWeight: FontWeight.w700,
    ),
    //others
    headline2: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontFamily: "Roboto",
      fontWeight: FontWeight.w700,
    ),
  ),
);

final lightTheme = ThemeData(
  backgroundColor: const Color(0xffF5F5F5),
  primaryColor: Colors.black,
  errorColor: Colors.red,

  //text Selection
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.black,
  ),
  //selector field color
  colorScheme: const ColorScheme.light(primary: Color(0xffB68D40)).copyWith(
    secondary: const Color(0xffB68D40),
  ),
  textTheme: const TextTheme(
    //titles
    headline1: TextStyle(
      color: Colors.black87,
      fontSize: 26,
      fontFamily: "Roboto",
      fontWeight: FontWeight.w700,
    ),
    //others
    headline2: TextStyle(
      color: Colors.black87,
      fontSize: 20,
      fontFamily: "Roboto",
      fontWeight: FontWeight.w700,
    ),
  ),
);
