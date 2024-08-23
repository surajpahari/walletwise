import "package:flutter/material.dart";
import "package:walletwise/api/urls/app_urls.dart";
import "package:walletwise/models/bank_account.dart";
import "package:walletwise/controllers/modeloperation.dart";
import "package:walletwise/data/transaction_data.dart";
import "package:walletwise/models/transactionCard.dart";
import "package:walletwise/utils/forms/wwForm.dart";

class TransactionRecordController extends Wwform {
  final TextEditingController to = TextEditingController(text: "");
  final TextEditingController from = TextEditingController(text: "");
  BankAccount? selectedBankAccount;
  bool isIncome = false;
  bool isExpense = false;

  @override
  void clearFields() {
    to.clear();
    from.clear();
    formState.value = 0;
  }

  static Future<void> fetchRecords() async {
    Url url = ApiUrls.getTransactionRecord('1');
    try {
      await ModelOperation.fetchFunction(
          url, (json) => TransactionCardData.fromJson(json),
          targetList: transactionRecord);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> filter({required bool expense, required bool income}) async {
    String type = "";
    if (expense == true && income == false) {
      type = "expense";
    } else if (income == true && expense == false) {
      type = "income";
    } else if (expense == true && income == true) {
      type = "both";
    }
    //return;
    String fromDate = from.text;
    String toDate = to.text;
    String searchValue = '';
    String bankAccount = selectedBankAccount?.id.toString() ?? '';
    Url fetch = ApiUrls.getTransactionRecords(
        fromDate, toDate, type, bankAccount, searchValue);
    try {
      await ModelOperation.fetchFunction(
          fetch, (json) => TransactionCardData.fromJson(json),
          listKey: 'transaction', targetList: transactionRecord);
    } catch (e) {
      print(e);
    }
  }
}
//import "package:flutter/material.dart";
//import "package:walletwise/api/urls/app_urls.dart";
//import "package:walletwise/models/bank_account.dart";
//import "package:walletwise/controllers/modeloperation.dart";
//import "package:walletwise/data/transaction_data.dart";
//import "package:walletwise/models/transactionCard.dart";
//
//class TransactionRecordController {
//  final TextEditingController to = TextEditingController();
//  final TextEditingController from = TextEditingController();
//  BankAccount? selectedBankAccount;
//  bool isIncome = false;
//  bool isExpense = false;
//
//  static Future<void> fetchRecords() async {
//    Url url = ApiUrls.getTransactionRecord('1');
//    try {
//      await ModelOperation.fetchFunction(
//          url, (json) => TransactionCardData.fromJson(json),
//          targetList: transactionRecord);
//    } catch (e) {
//      throw Exception(e);
//    }
//  }
//
//  Future<void> filter() async {
//    print(to.text);
//    print(from.text);
//    return;
//    String fromDate = from.text;
//    String toDate = to.text;
//    String type = '';
//    String bank = selectedBankAccount?.id.toString() ?? '';
//    String searchValue = '';
//    if (to.text == from.text) {
//      fromDate = '';
//      toDate = '';
//    }
//    if (isExpense == true) {
//      type = "expense";
//    }
//    if (isIncome == true) {
//      type = "income";
//    }
//    Url fetch = ApiUrls.getTransactionRecords(
//        fromDate, toDate, type, bank, searchValue);
//    try {
//      await ModelOperation.fetch(fetch, successAction: (response) {
//        print(response.body);
//      });
//    } catch (e) {
//      print(e);
//    }
//  }
//}
