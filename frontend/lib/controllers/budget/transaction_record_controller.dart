import "package:flutter/material.dart";
import "package:walletwise/api/urls/app_urls.dart";
import "package:walletwise/models/bank_account.dart";
import "package:walletwise/controllers/modeloperation.dart";
import "package:walletwise/data/transaction_data.dart";
import "package:walletwise/models/transactionCard.dart";

class TransactionRecordController {
  final TextEditingController to = TextEditingController();
  final TextEditingController from = TextEditingController();
  BankAccount? selectedBankAccount;
  bool isIncome = false;
  bool isExpense = false;

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

  Future<void> filter() async {
    String fromDate = from.text;
    String toDate = to.text;
    String type = '';
    String bank = selectedBankAccount?.id.toString() ?? '';
    String searchValue = '';
    if (to.text == from.text) {
      fromDate = '';
      toDate = '';
    }
    if (isExpense) {
      type = "expense";
    }
    if (isIncome) {
      type = "expense";
    }
    Url fetch = ApiUrls.getTransactionRecords(
        fromDate, toDate, type, bank, searchValue);
    await ModelOperation.fetchFunction(
        fetch, (json) => TransactionCardData.fromJson(json),
        listKey: 'transaction', targetList: transactionRecord);
  }
}
