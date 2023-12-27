import 'package:flutter/material.dart';
import 'package:walletwise/controllers/budget/budget_controller.dart';
import 'package:walletwise/utils/cards/budget_card.dart';

class BudgetScreen extends StatefulWidget {
  const BudgetScreen({super.key});

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
          return ListView.builder(
            shrinkWrap: true,
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
