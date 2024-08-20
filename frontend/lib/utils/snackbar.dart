import 'package:flutter/material.dart';

enum WwSnackbartype { success, error }

class WwSnackbar {
  static void builder(
      BuildContext context, String message, WwSnackbartype type) {
    if (type == WwSnackbartype.success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(milliseconds: 20000),
          backgroundColor: Colors.green,
          content: Center(
              child: Text(
            message,
            style: TextStyle(color: Colors.white),
          )),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(milliseconds: 500),
          backgroundColor: Colors.red,
          content: Center(
              child: Text(
            message,
            style: TextStyle(color: Colors.white),
          )),
        ),
      );
    }
  }
}
