import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:walletwise/constants/app_icons.dart';
import 'package:walletwise/models/budgets.dart';
import 'package:walletwise/screens/category_screen.dart';

class BudgetCard extends StatelessWidget {
  final Budget budget;

  const BudgetCard({Key? key, required this.budget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          // Navigate to the detail page when the card is tapped
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryScreen(
                id: budget.category.id,
                category: budget.category.category,
                total: budget.amount,
              ),
            ),
          );
        },
        child: Card(
          elevation: 4,
          color: Colors.white,
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 30,
                  child: Icon(
                    AppIcons.transportation,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  budget.category.category,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Rs ${budget.amount.toString()}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Duration: Oct01 to Oct10",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
