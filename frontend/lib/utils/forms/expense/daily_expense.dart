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

class DailyExpenseForm extends StatelessWidget {
  const DailyExpenseForm({Key? key}) : super(key: key);

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
                  label: "Source of expense",
                  searchKeyExtractor: (items) => (items as BankAccount).name,
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
                  label: "Spent date",
                  controller:
                      controller.date, // Ensure this is a TextEditingController
                  firstDate: DateTime(2023),
                  lastDate: DateTime.now(),
                ),
                gapY("md"),
                WwSubmit(
                  onPressed: () {
                    controller.addDailyExpense(context);
                  },
                  child: Obx(
                    () => controller.formState.value == 1
                        ? const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Adding...",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 2),
                              CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth:
                                    3, // Thinner progress indicator for a sleeker look
                              ),
                            ],
                          )
                        : const Text(
                            "Add",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
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
