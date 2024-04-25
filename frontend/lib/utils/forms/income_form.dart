import 'package:flutter/material.dart';
import 'package:walletwise/controllers/budget/income_contorller.dart';
import 'package:walletwise/models/income.dart';

class IncomeForm extends StatelessWidget {
  const IncomeForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Income",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Amount",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the amount';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Item",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the item';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Category",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the category';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Date",
                border: OutlineInputBorder(),
              ),
              readOnly: true,
              onTap: () {},
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select the date';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                IncomeContorller.addIncome(Income(
                    amount: 1500, date: "today", category: "incomeCategory"));
                // Implement form submission functionality
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Background color of the button
                padding: const EdgeInsets.symmetric(
                    vertical: 15), // Padding around the button content
                elevation: 4, // Elevation of the button
                shape: RoundedRectangleBorder(
                  // Rounded corners for the button
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Add",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white), // Text style of the button text
              ),
            ),
          ],
        ),
      ),
    );
  }
}
