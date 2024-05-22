import 'package:flutter/material.dart';

//defining the color
//for the main background
//main color
const darkGreen = Color(0xff244c14);
const blueColor = Color(0xff004D40);
//for the buttom navigationbar
const glassWhite = Color(0x99FFFFFF);
const darkReed = Color(0xff712b1f);
//light green(used in hero card)
const lightgreen = Color(0xff8BC34A);

const dark = Color(0xff040404);
const grey = Color(0x5c5b4a);

//green shade for appBar
//#800020?
//800020
//#8B6B61
//#3E2723.
const greenShade = Color(0xff3E2723);

final ThemeData myTheme = ThemeData(
  colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: darkGreen,
      onPrimary: Colors.white,
      secondary: glassWhite,
      onSecondary: Colors.white,
      error: Colors.white,
      onError: Colors.white,
      surface: darkReed,
      onSurface: Colors.white),
  primarySwatch: Colors.blue,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: glassWhite,
      selectedItemColor: blueColor,
      unselectedItemColor: Color(0xff000000)),
  scaffoldBackgroundColor: blueColor,
);
final ThemeData wwTheme = ThemeData(
  colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: darkGreen,
      onPrimary: Colors.white,
      secondary: glassWhite,
      onSecondary: Colors.white,
      error: Colors.white,
      onError: Colors.white,
      surface: darkReed,
      onSurface: Colors.white),
  primarySwatch: Colors.blue,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: glassWhite,
      selectedItemColor: blueColor,
      unselectedItemColor: Color(0xff000000)),
  scaffoldBackgroundColor: blueColor,
);
