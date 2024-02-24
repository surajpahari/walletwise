import 'package:flutter/material.dart';
import 'package:walletwise/constants/app_icons.dart';

class IncomeCard extends StatelessWidget {
  const IncomeCard({Key? key}) : super(key: key);

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
              "Income Category",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Text color adjusted for visibility
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Rs 1000",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.green, // Change color to green for income
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Duration: Oct01 to Oct10",
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
