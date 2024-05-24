import 'package:flutter/material.dart';

class WwSackbar {
  static void builder(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.green,
        content: Center(
            child: Text(
          "Sucessfully added",
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
