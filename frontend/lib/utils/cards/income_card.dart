import 'package:flutter/material.dart';
import 'package:walletwise/constants/app_icons.dart';
import 'package:walletwise/models/income.dart';

class IncomeCard extends StatelessWidget {
  final Income income;
  String interval = "Oct01-Oct10";
  IncomeCard(this.interval, this.income);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.grey[800], // Adjusted card color to match background
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.green,
              radius: 30,
              child: Icon(
                AppIcons.government, // Assuming there's an income icon
                color: Colors.white,
                size: 30,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              income.category,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Text color adjusted for visibility
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Rs ${income.amount.toString()}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.green, // Change color to green for income
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Duration:  Oct01 to Oct10",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white), // Adjusted text color for visibility
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
