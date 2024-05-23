import 'package:flutter/material.dart';
import 'package:walletwise/controllers/budget/income_contorller.dart';
import 'package:walletwise/models/income.dart';
import 'package:get/get.dart';
import 'package:walletwise/utils/date_picker.dart';

class IncomeForm extends StatelessWidget {
  final controller = IncomeController();

  @override
  Widget build(BuildContext context) {
    final controller = IncomeController();
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
              controller: controller.amount,
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
              controller: controller.item,
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
              controller: controller.category,
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
            DatePicker(
              controller: controller.date,
              firstDate: DateTime(2023),
              lastDate: DateTime.now(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => controller.addIncome(
                  Income(amount: 100, category: "fitness", date: '1010100')),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 15),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Obx(
                () => Text(controller.submitState.value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
