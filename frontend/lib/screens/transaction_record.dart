import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:walletwise/controllers/budget/transaction_record_controller.dart';
import 'package:walletwise/data/transaction_data.dart';
import 'package:walletwise/utils/cards/transaction_card.dart';
import 'package:walletwise/utils/forms/transaction/filter_from.dart';
import 'package:walletwise/utils/forms/transaction/filter_transaction.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  bool showsFilterOption = false;
  @override
  void initState() {
    super.initState();
    TransactionRecordController.fetchRecords();
  }

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
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      filled: true,
                      fillColor: Colors.grey[800],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: const Icon(Icons.search, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showFilterOptions.value = !showFilterOptions.value;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Icon(Icons.filter_list,
                        color: showFilterOptions.value == true
                            ? Colors.blue
                            : Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Obx(() => showFilterOptions.value == true
              ? FilterForm()
              : const SizedBox.shrink()),
          Expanded(child: Obx(() {
            // Ensure detailedCategory and items are not empty
            return ListView(
              children: transactionRecord
                  .map((transaction) => TransactionCard(
                        title: transaction.title,
                        amount: transaction.amount.toString(),
                        td: transaction,
                        date: transaction.date,
                        type: transaction.type,
                      ))
                  .toList(),
            );
          })),
        ],
      ),
    );
  }
}
