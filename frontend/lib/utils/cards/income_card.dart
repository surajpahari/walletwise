import 'package:flutter/material.dart';
import 'package:walletwise/constants/app_icons.dart';
import 'package:walletwise/models/category.dart';
import 'package:walletwise/screens/category_screen.dart';

class IncomeCard extends StatelessWidget {
  final Category category;

  const IncomeCard({Key? key, required this.category}) : super(key: key);

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
                id: category.id,
                category: category.category,
                total: category.amount.toInt(),
              ),
            ),
          );
        },
        child: Card(
          elevation: 4,
          color: Colors.grey[800], // Adjusted card color to match background
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 30,
                  child: Icon(
                    AppIcons.transportation,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        category.category,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors
                              .white, // Text color adjusted for visibility
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Rs ${category.amount.toString()}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Duration: Oct01 to Oct10",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors
                              .white, // Adjusted text color for visibility
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
