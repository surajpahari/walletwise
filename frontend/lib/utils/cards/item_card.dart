import 'package:flutter/material.dart';
import 'package:walletwise/constants/app_colors.dart';
import 'package:walletwise/models/item.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final int amount;
  final String date;
  final Item item;

  const ItemCard({
    Key? key,
    required this.title,
    required this.item,
    required this.amount,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(
      this.title,
    );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        elevation: 4,
        color: Colors.grey[850], // Dark grey color for the card
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: Container(
          constraints: BoxConstraints(maxWidth: 280), // Slimmer card
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18, // Slightly smaller font
                        fontWeight: FontWeight.w600,
                        color: Colors.white, // Softer black color
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Rs $amount",
                          style: TextStyle(
                            fontSize: 16, // Smaller font for amount
                            fontWeight: FontWeight.w700,
                            color: item.identifier == "income"
                                ? Colors.green[700] // Softer green
                                : Colors.red[600], // Softer red
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          date,
                          style: TextStyle(
                            //fontStyle: FontStyle.italic,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[300], // Softer grey color
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
