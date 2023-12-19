import 'package:flutter/material.dart';
import 'package:walletwise/models/budgets.dart';

class BudgetCard extends StatelessWidget {
  final Budget budget;

  const BudgetCard({super.key, required this.budget});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(budget.category),
              Text(budget.amount.toString()),
            ],
          )),
    );
  }
}
