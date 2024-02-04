import 'package:flutter/material.dart';
import 'package:walletwise/controllers/budget/budget_controller.dart';
import 'package:walletwise/utils/cards/budget_card.dart';

class BudgetScreen extends StatefulWidget {
  const BudgetScreen({Key? key}) : super(key: key);

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: BudgetController.getBudgets(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return const Text("Error loading budget");
        } else {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 350, // Maximum width of each item
              mainAxisExtent: 300,
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
            ),
            itemCount: BudgetController.budgets.length,
            itemBuilder: (context, index) {
              return BudgetCard(budget: BudgetController.budgets[index]);
            },
          );
        }
      },
    );
  }
}
