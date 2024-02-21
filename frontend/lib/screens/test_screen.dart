import 'package:flutter/material.dart';
import 'package:walletwise/controllers/budget/budget_controller.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            _fetchAndPrintCategories();
          },
          child: Text('Fetch and Print Categories'),
        ),
      ],
    );
  }

  void _fetchAndPrintCategories() async {
    try {
      await BudgetController.getFullBudgets(2);
      // Print all categories
      for (var category in BudgetController.categories) {
        print('Category Title: ${category.category}');
        for (var item in category.items) {
          print('Item Name: ${item.name}, Amount: ${item.amount}');
        }
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
