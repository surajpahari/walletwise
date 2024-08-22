import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:walletwise/api/urls/app_urls.dart";
import "package:walletwise/models/expense_category.dart";
import "package:walletwise/data/expense_data.dart";
import "package:walletwise/models/bank_account.dart";
import 'package:walletwise/controllers/modeloperation.dart';
import "package:walletwise/utils/forms/wwForm.dart";
import "package:walletwise/utils/snackbar.dart";

class IncomeController extends Wwform {
  static IncomeController get instance => Get.find();
  final source = TextEditingController();
  final amount = TextEditingController();
  final category = TextEditingController();
  ExpenseCategory? selectedCategory;
  BankAccount? selectedBankAccount;
  final TextEditingController date = TextEditingController();
  final TextEditingController peroid = TextEditingController(text: "peroid");
  GlobalKey<FormState> expenseFormKey = GlobalKey<FormState>();

//for fetching fetchExpenseCategories
  static Future<void> fetchIncomeCategories() async {
    try {
      ModelOperation.fetchFunction(ApiUrls.fetchIncomeCategories,
          (json) => ExpenseCategory.fromJson(json),
          targetList: ExpenseData.categoryList, listKey: "expenses");
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addRoutineIncome(BuildContext context) async {
    formState.value = 1;
    try {
      await ModelOperation().add(
        body: {
          'bank_balance_id': selectedBankAccount?.id.toString(),
          'name': source.text,
          'type': 'period',
          'period': '2',
          'amount': amount.text,
          'date': date.text,
          'category_id': selectedCategory?.id.toString(),
        },
        url: ApiUrls.addExpense,
        successAction: (response) {
          formState.value = 0;
          WwSnackbar.builder(
              context, "Sucessfully Added", WwSnackbartype.success);
        },
        errorAction: () {
          formState.value = 0;
          WwSnackbar.builder(
              context, "Error Occured while Adding", WwSnackbartype.success);
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addDailyIncome(BuildContext context) async {
    formState.value = 1;
    try {
      await ModelOperation().add(
        body: {
          'bank_balance_id': selectedBankAccount?.id.toString(),
          'source': source.text,
          'type': 'daily',
          'amount': amount.text,
          'date': date.text,
          'category_id': selectedCategory?.id.toString(),
        },
        url: ApiUrls.addIncome,
        successAction: (response) {
          print("hey");
          formState.value = 0;
          WwSnackbar.builder(
              context, "Sucessfully Added", WwSnackbartype.success);
        },
        errorAction: () {
          formState.value = 0;
          WwSnackbar.builder(
              context, "Error Occured while Adding", WwSnackbartype.success);
        },
      );
    } catch (e) {
      print('Error:$e');
    }
  }

  @override
  void clearFields() {}
}
