import 'package:flutter/material.dart';

class HeroText {
  static Widget red(String text) {
    return Container(
      color: Colors.red,
      padding: const EdgeInsets.all(4),
      child: Text(text),
    );
  }

  static Widget technicalSummary(String signal) {
    Color color;

    if (signal == "Strong Bullish") {
      color = Colors.green;
    } else if (signal == "Medium Bullish") {
      color = Colors.blue;
    } else {
      color = Colors.black; // Default color or handle other cases
    }

    return Container(
      constraints: const BoxConstraints(maxWidth: 200),
      padding: const EdgeInsets.all(6),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(4)),
      child: Text(signal),
    );
  }

  static Widget signal(String signal) {
    Color color;

    if (signal == "High Risk") {
      color = Colors.red;
    } else if (signal == "Medium Risk") {
      color = Colors.blue;
    } else if (signal == "Low Risk") {
      color = Colors.green;
    } else {
      color = Colors.black; // Default color or handle other cases
    }

    return Container(
      constraints: const BoxConstraints(maxWidth: 200),
      padding: const EdgeInsets.all(6),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(4)),
      child: Text(signal),
    );
  }
}
