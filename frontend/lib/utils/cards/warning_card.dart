import 'package:flutter/material.dart';

class WarningCard extends StatelessWidget {
  const WarningCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
        shadowColor: Colors.yellow,
        child: Padding(
            padding: EdgeInsets.all(4),
            child: Wrap(children: [
              Icon(Icons.warning),
              Text(
                  "This app is not viable for your loss or profit , this just gives the insights depending on the stock history"),
            ])));
  }
}
