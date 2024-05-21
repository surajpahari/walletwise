import 'package:flutter/material.dart';

//defining the color
//for the main background
//main color
const blueColor = Color(0xff004D40);
//for the buttom navigationbar
const glassWhite = Color(0x99FFFFFF);
//light green(used in hero card)
const lightgreen = Color(0xff8BC34A);

final ThemeData myTheme = ThemeData(
  colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: blueColor,
      onPrimary: Colors.white,
      secondary: glassWhite,
      onSecondary: Colors.white,
      error: Colors.white,
      onError: Colors.white,
      surface: Colors.blue,
      onSurface: Colors.white),
  primarySwatch: Colors.blue,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: glassWhite,
      selectedItemColor: blueColor,
      unselectedItemColor: Color(0xff000000)),
  scaffoldBackgroundColor: blueColor,
);
