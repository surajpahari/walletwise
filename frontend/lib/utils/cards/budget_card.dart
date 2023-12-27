import 'package:flutter/material.dart';
import 'package:walletwise/models/budgets.dart';

class BudgetCard extends StatelessWidget {
  final Budget budget;

  const BudgetCard({super.key, required this.budget});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green[100],
      shadowColor: Colors.blue,
      child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                budget.category,
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                budget.amount.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ],
          )),
    );
  }
}
