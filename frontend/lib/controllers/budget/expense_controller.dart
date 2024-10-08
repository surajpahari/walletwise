import "package:walletwise/controllers/budget/balance_card_controller.dart";
import "package:walletwise/controllers/budget/bank_controller.dart";
import "package:walletwise/controllers/sheetController.dart";
import "package:walletwise/models/item.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:walletwise/api/urls/app_urls.dart";
import "package:walletwise/controllers/budget/payment_controller.dart";
import "package:walletwise/models/category.dart";
import "package:walletwise/models/expense_category.dart";
import "package:walletwise/data/expense_data.dart";
import "package:walletwise/models/bank_account.dart";
import 'package:walletwise/controllers/modeloperation.dart';
import "package:walletwise/utils/forms/wwForm.dart";
import "package:walletwise/utils/snackbar.dart";

class ExpenseController extends Wwform {
  static ExpenseController get instance => Get.find();
  final item = TextEditingController();
  final amount = TextEditingController();
  final category = TextEditingController();
  final sheetController = Get.put(SheetController());
  ExpenseCategory? selectedCategory;
  BankAccount? selectedBankAccount;
  final TextEditingController date = TextEditingController();
  final TextEditingController period = TextEditingController();
  GlobalKey<FormState> expenseFormKey = GlobalKey<FormState>();
  void add() {
    //print(date.text.toString());
    //print(item.text);
    //print(amount.text);
  }

//for fetching fetchExpenseCategories
  static Future<void> fetchExpenseCategories() async {
    try {
      ModelOperation.fetchFunction(ApiUrls.fetchExpenseCategories,
          (json) => ExpenseCategory.fromJson(json),
          targetList: ExpenseData.categoryList, listKey: "categories");
    } catch (e) {
      print('Error: $e');
    }
  }

//for fetching the user category
  static Future<void> fetchUserCategories() async {
    String duration = '30';
    Url fetchUrl = ApiUrls.fetchExpense(duration);
    print(fetchUrl.value);

    try {
      ModelOperation.fetchFunction(
          fetchUrl, (json) => Category.fromAmountJson(json),
          listKey: 'expenses', targetList: ExpenseData.userCategoryList);
    } catch (e) {
      print("Error:$e");
    }
  }

//to add the routine Expenses
  Future<void> addRoutineExpense(BuildContext context) async {
    print(selectedBankAccount?.id.toString());
    formState.value = 1;
    try {
      await ModelOperation().add(
        body: {
          'bank_balance_id': selectedBankAccount?.id.toString(),
          'name': item.text,
          'type': 'period',
          'period': period.text,
          'amount': amount.text,
          'date': date.text,
          'category_id': selectedCategory?.id.toString(),
        },
        url: ApiUrls.addExpense,
        successAction: (response) {
          print("hey");
          formState.value = 0;
          sheetController.expenseSheetDismiss.value = true;
          WwSnackbar.builder(
              context, "Sucessfully Added", WwSnackbartype.success);
          PaymentController.fetchPayment();
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

// to add the daily expenses
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
          print("hey");
          sheetController.expenseSheetDismiss.value = true;
          fetchUserCategories();
          BankAccController.fetchBankAccount();
          BalanceCardController.fetchBalanceCardData();
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

//fetch the item form the category

  static Future<void> fetchItemForCategory(id) async {
    Url url = ApiUrls.fetchExpenseItem(id.toString(), '30');
    try {
      ModelOperation.fetchFunction(url, (json) => Item.fromJson(json),
          targetList: ExpenseData.fetchedItem, successAction: (response) {
        ExpenseData.updateChart();
        print(ExpenseData.fetchedItem.length);
      });
    } catch (e) {
      print(e);
    }
  }
  //ModelOperation.fetchFunction(url, (json) => Category.fromItemsJson(json),
  //    targetList: ExpenseData.userCategoryList);
  ////var response = await FetchAPI(
  //        url, HttpMethod.get) // Ensure the correct HTTP method is used.
  //    .fetchAuthorizedAPI();
  //print(response.body);
  //
  //ModelOperation.fetch(url,f, successAction: (response) {
  //var decodedResponse = response;
  //try {
  //print("response is ");
  //print(response[0]);
  //return;
  //ExpenseData.detailedCategory.value = expenses
  //    .map((item) => Category.fromItemsJson(item as Map<String, dynamic>))
  //    .toList();
  //print("decoded response");
  //print(decodedResponse);
  //  } catch (e) {
  //    print(e);
  //  }
  //});
  //ModelOperation.fetchWithId(ApiUrls.fetchExpenseItem(categoryId.toString()),
  //id: categoryId, successAction: (response) {
  //print(jsonResponse[0]);
  //var jsonResponse = jsonDecode(response) as List<dynamic>;
  //print("decode is $jsonResponse");
  //ExpenseData.detailedCategory.value = jsonResponse
  //    .map((item) => Category.fromItemsJson(item as Map<String, dynamic>))
  //    .toList();
  ////ExpenseData.detailedCategory.value = (jsonResponse as List<dynamic>)
  //    .map((item) => Category.fromItemsJson(item as Map<String, dynamic>))
  //    .toList();
  //ExpenseData.detailedCategory = jsonResponse.map((item) {
  //  Category.fromItemsJson(jsonResponse);
  //}).toList();
  //print("mapped ExpenseData.detailedCategory");
  //});

  @override
  void clearFields() {}
}
