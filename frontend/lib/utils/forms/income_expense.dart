import 'package:flutter/material.dart';

class IncomeExpenseSelect extends StatelessWidget {
  const IncomeExpenseSelect({Key? key}) : super(key: key);

  void test() {
    print("testing");
  }

  void submit() {
    print("submitting");
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Align buttons evenly
      children: [
        ElevatedButton(
          onPressed: test,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green, // Background color
            foregroundColor: Colors.white, // Text color
            padding: const EdgeInsets.symmetric(
                horizontal: 20, vertical: 15), // Button padding
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Button border radius
            ),
          ),
          child: const Text("Income"),
        ),
        ElevatedButton(
          onPressed: test,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, // Background color
            backgroundColor: Colors.red, // Text color
            padding: const EdgeInsets.symmetric(
                horizontal: 20, vertical: 15), // Button padding
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Button border radius
            ),
          ),
          child: const Text("Expense"),
        ),
      ],
    );
  }
}
