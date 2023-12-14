import 'package:flutter/material.dart';

class WalletWiseTheme {
  WalletWiseTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
  );
  static ThemeData darkTheme = ThemeData();
}
