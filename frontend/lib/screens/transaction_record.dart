import 'package:flutter/material.dart';
import 'package:walletwise/utils/cards/transaction_card.dart';

class TransactionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900], // Dark background color
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      filled: true,
                      fillColor: Colors.grey[800],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(Icons.search, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      dropdownColor: Colors.grey[800],
                      icon: Icon(Icons.filter_list, color: Colors.white),
                      hint: Text(
                        'Filter',
                        style: TextStyle(color: Colors.white),
                      ),
                      items: <String>['All', 'Income', 'Expense']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        // Handle change
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                TransactionCard(
                  title: 'Groceries',
                  amount: '1500',
                  date: '2024-06-01',
                  type: '1',
                ),
                TransactionCard(
                  title: 'Rent',
                  amount: '12000',
                  date: '2024-06-01',
                  type: '2',
                ),
                // Add more TransactionCard widgets here
              ],
            ),
          ),
        ],
      ),
    );
  }
}
