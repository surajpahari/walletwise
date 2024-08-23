import 'package:flutter/material.dart';
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
        color: Colors.white,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Container(
          constraints:
              BoxConstraints(maxWidth: 300), // Adjust the max width as needed
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Rs $amount",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: item.identifier == "income"
                        ? Colors.green
                        : Colors.red, // Use item.identifier here
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  date,
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
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
