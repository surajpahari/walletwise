import 'package:flutter/material.dart';
import 'package:walletwise/data/bank_account.dart';
import 'package:walletwise/models/bank_account.dart';
import 'package:walletwise/utils/inputs/search_input.dart';
import 'package:walletwise/controllers/budget/transaction_record_controller.dart';
import 'package:walletwise/utils/date_picker.dart';

class FilterTransaction extends StatefulWidget {
  const FilterTransaction({super.key});

  @override
  State<FilterTransaction> createState() => _FilterTransactionState();
}

class _FilterTransactionState extends State<FilterTransaction> {
  bool isIncome = false;
  bool isExpense = true;

  @override
  Widget build(BuildContext context) {
    final controller =
        TransactionRecordController(); // Use the controller passed to the widget

    return Container(
      constraints: BoxConstraints(
          maxWidth: 300), // Set a maximum width for the container
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: DatePicker(
                  controller: controller.to,
                  firstDate: DateTime(2020),
                  label: 'From',
                  lastDate: DateTime.now(),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: DatePicker(
                  controller: controller.from,
                  firstDate: DateTime(2020),
                  lastDate: DateTime.now(),
                  label: 'To',
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Checkbox(
                      value: isExpense,
                      onChanged: (value) {
                        setState(() {
                          isExpense = value!;
                        });
                        controller.isIncome = value!;
                        // Inverse logic to keep one selected
                      },
                    ),
                    const Text("Expense"),
                    const SizedBox(width: 20), // Space between checkboxes
                    Checkbox(
                      value: isIncome,
                      onChanged: (value) {
                        setState(() {
                          isIncome = value!;
                        });
                        controller.isIncome = value!;
                        print(controller.isIncome);
                        print(controller.isExpense);
                        print(controller.to.text);
                        print(controller.from.text);
                      },
                    ),
                    const Text("Income"),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 200, // Set the desired width for the SearchInput
            child: SearchInput(
              searchList: BankAccountData.bankAccountList,
              label: "Bank.",
              searchKeyExtractor: (items) => (items as BankAccount).name,
              onSelection: (bank) {
                controller.selectedBankAccount =
                    bank is BankAccount ? bank : null;
                print(bank.amount);
              },
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
            ),
            onPressed: () {
              controller.filter();
            },
            child: const Text("Apply"),
          )
        ],
      ),
    );
  }
}
