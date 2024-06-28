import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:walletwise/api/urls/app_urls.dart";
import "package:walletwise/models/expense_category.dart";
import "package:walletwise/data/expense_data.dart";
import "package:walletwise/models/bank_account.dart";
import 'package:walletwise/controllers/modeloperation.dart';
import "package:walletwise/utils/forms/wwForm.dart";
import "package:walletwise/utils/snackbar.dart";

class StockAddController extends Wwform {
  static StockAddController get instance => Get.find();
  final TextEditingController boughtDate = TextEditingController();
  final TextEditingController cost = TextEditingController(text: "peroid");
  GlobalKey<FormState> addStockForm = GlobalKey<FormState>();
  void add() {}

//for fetching fetchExpenseCategories
  static Future<void> addStock() async {
    try {
      ModelOperation.fetchFunction(ApiUrls.fetchExpenseCategories,
          (json) => ExpenseCategory.fromJson(json),
          targetList: ExpenseData.categoryList, listKey: "expenses");
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> addRoutineExpense(BuildContext context) async {
    formState.value = 1;
    try {
      await ModelOperation().add(
        body: {},
        url: ApiUrls.addExpense,
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

  Future<void> addDailyExpense(BuildContext context) async {
    formState.value = 1;
    try {
      await ModelOperation().add(
        body: {
          'bank_balance_id': selectedBankAccount?.id.toString(),
          'name': item.text,
          'type': 'daily',
          'amount': amount.text,
          'date': date.text,
          'category_id': selectedCategory?.id.toString(),
        },
        url: ApiUrls.addExpense,
        successAction: (response) {
          //print("hey");
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
      //print('Error:$e');
    }
  }

  @override
  void clearFields() {}
}
