import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletwise/controllers/budget/expense_controller.dart';
import 'package:walletwise/data/bank_account.dart';
import 'package:walletwise/data/expense_data.dart';
import 'package:walletwise/models/bank_account.dart';
import 'package:walletwise/models/expense_category.dart';
import 'package:walletwise/utils/date_picker.dart';
import 'package:walletwise/utils/gaps/Xgap.dart';
import 'package:walletwise/utils/inputs/search_input.dart';
import 'package:walletwise/utils/texfields/ww_submit.dart';
import 'package:walletwise/utils/texfields/ww_textfield.dart';

class RoutineExpenseForm extends StatelessWidget {
  const RoutineExpenseForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = ExpenseController();

    return Builder(
      builder: (context) {
        return Form(
          key: controller.expenseFormKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                WwTextfield(
                  controller: controller.item,
                  icon: const Icon(Icons.title),
                  validator: (value) {
                    return null;
                  },
                  label: 'Item',
                ),
                gapY("md"),
                WwTextfield(
                  label: "period",
                  controller: controller.period,
                  icon: const Icon(Icons.title),
                  validator: (value) {
                    return null;
                  },
                ),
                gapY("md"),
                SearchInput(
                  searchList: ExpenseData.categoryList,
                  searchKeyExtractor: (items) =>
                      (items as ExpenseCategory).name,
                  label: "Category",
                  onSelection: (category) {
                    controller.selectedCategory =
                        category is ExpenseCategory ? category : null;
                    print(category.id);
                  },
                ),
                gapY("md"),
                SearchInput(
                  searchList: BankAccountData.bankAccountList,
                  searchKeyExtractor: (items) => (items as BankAccount).name,
                  label: "Source of expense",
                  onSelection: (bank) {
                    controller.selectedBankAccount =
                        bank is BankAccount ? bank : null;
                    print(bank.amount);
                  },
                ),
                gapY("md"),
                WwTextfield(
                  controller: controller.amount,
                  icon: const Icon(Icons.title),
                  validator: (value) {
                    return null;
                  },
                  label: 'Amount',
                ),
                gapY("md"),
                DatePicker(
                  label: "Last Paid at",
                  controller:
                      controller.date, // Ensure this is a TextEditingController
                  firstDate: DateTime(2023),
                  lastDate: DateTime.now(),
                ),
                gapY("md"),
                WwSubmit(
                  onPressed: () {
                    controller.addRoutineExpense(context);
                  },
                  child: Obx(
                    () => controller.formState.value == 1
                        ? const Column(
                            children: [
                              Text(
                                "Adding",
                                style: TextStyle(
                                    fontSize: 24, color: Colors.white),
                              ),
                              LinearProgressIndicator(color: Colors.white),
                            ],
                          )
                        : const Text(
                            "Add",
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
