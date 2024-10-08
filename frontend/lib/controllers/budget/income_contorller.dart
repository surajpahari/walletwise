import "package:flutter/material.dart";
import "package:walletwise/models/income_category.dart";
import "package:walletwise/controllers/sheetController.dart";
import "package:walletwise/models/item.dart";
import "package:get/get.dart";
import "package:walletwise/data/income_data.dart";
import "package:walletwise/models/category.dart";
import "package:walletwise/api/urls/app_urls.dart";
import "package:walletwise/models/expense_category.dart";
import "package:walletwise/data/expense_data.dart";
import "package:walletwise/models/bank_account.dart";
import 'package:walletwise/controllers/modeloperation.dart';
import "package:walletwise/utils/forms/wwForm.dart";
import "package:walletwise/utils/snackbar.dart";

class IncomeController extends Wwform {
  static IncomeController get instance => Get.find();
  final sheetController = Get.put(SheetController());
  final source = TextEditingController();
  final amount = TextEditingController();
  final category = TextEditingController();
  IncomeCategory? selectedCategory;
  BankAccount? selectedBankAccount;
  final TextEditingController date = TextEditingController();
  final TextEditingController peroid = TextEditingController(text: "peroid");
  GlobalKey<FormState> expenseFormKey = GlobalKey<FormState>();

//for fetching fetchExpenseCategories
  static Future<void> fetchIncomeCategories() async {
    try {
      ModelOperation.fetchFunction(ApiUrls.fetchIncomeCategories,
          (json) => IncomeCategory.fromJson(json),
          targetList: IncomeData.allCategories,
          listKey: "categories", successAction: (response) {
        //print(response);
      });
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
        successAction: (response) async {
          formState.value = 0;
          WwSnackbar.builder(
              context, "Sucessfully Added", WwSnackbartype.success);
          sheetController.incomeShouldDismiss.value = true;
          fetchIncomes();
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

          sheetController.incomeShouldDismiss.value = true;
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

  static Future<void> fetchIncomes() async {
    String duration = '7';
    Url fetchUrl = ApiUrls.fetchIncome(duration);
    print(fetchUrl.value);
    //try {
    //  ModelOperation.fetch(fetchUrl, successAction: (response) {
    //    print(response.body);
    //  });
    //} catch (e) {}
    //return;

    try {
      ModelOperation.fetchFunction(
          fetchUrl, (json) => Category.fromAmountJson(json),
          listKey: 'incomes',
          targetList: IncomeData.userCategoryList, successAction: (response) {
        print(response);
      });
    } catch (e) {
      print("Error:$e");
    }
  }

  static Future<void> fetchItemForCategory(id) async {
    Url url = ApiUrls.fetchIncomeItem(id, '30');
    try {
      ModelOperation.fetchFunction(url, (json) => Item.fromJson(json),
          targetList: IncomeData.fetchedItem, successAction: (response) {
        IncomeData.updateChart();
        print(ExpenseData.fetchedItem.length);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void clearFields() {}
}
