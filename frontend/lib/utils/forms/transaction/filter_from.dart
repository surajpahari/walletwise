import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletwise/data/transaction_data.dart';
import 'package:walletwise/models/bank_account.dart';
import 'package:walletwise/data/bank_account.dart';
import 'package:walletwise/utils/inputs/search_input.dart';
import 'package:walletwise/controllers/budget/transaction_record_controller.dart';
import 'package:walletwise/utils/date_picker.dart';

class FilterForm extends StatefulWidget {
  const FilterForm({super.key});

  @override
  State<FilterForm> createState() => _FilterFormState();
}

class _FilterFormState extends State<FilterForm> {
  bool isExpense = false;
  bool isIncome = false;
  @override
  Widget build(BuildContext context) {
    final controller = TransactionRecordController();
    return Container(
        constraints: BoxConstraints(maxWidth: 300),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                      child: DatePicker(
                          label: 'from',
                          controller: controller.from,
                          lastDate: DateTime.now(),
                          firstDate: DateTime(2023))),
                  Expanded(
                      child: DatePicker(
                          label: 'to',
                          controller: controller.to,
                          lastDate: DateTime.now(),
                          firstDate: DateTime(2023)))
                ],
              ),
              SizedBox(
                height: 10,
              ),
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
                              controller.isExpense = isExpense;
                            });
                            print(value);
                          },
                        ),
                        const Text("Expense"),
                        Checkbox(
                          value: isIncome,
                          onChanged: (value) {
                            setState(() {
                              isIncome = value!;
                            });
                            print(value);
                          },
                        ),
                        const Text("income"),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: SearchInput(
                      searchList: BankAccountData.bankAccountList,
                      searchKeyExtractor: (items) =>
                          (items as BankAccount).name,
                      onSelection: (bank) {
                        controller.selectedBankAccount =
                            bank is BankAccount ? bank : null;
                        print(bank.amount);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                onPressed: () {
                  showFilterOptions.toggle();
                  controller.filter(expense: isExpense, income: isIncome);
                },
                child: const Text("Apply"),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ));
  }
}
