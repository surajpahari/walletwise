import 'package:flutter/material.dart';

class StockRecord extends StatelessWidget {
  const StockRecord({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "No stock record is available to show",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
