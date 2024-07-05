import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:walletwise/controllers/budget/balance_card_controller.dart';
import 'package:walletwise/controllers/modeloperation.dart';
import 'package:walletwise/api/urls/app_urls.dart';
import 'package:walletwise/data/bank_account.dart';
import 'package:walletwise/models/bank_account.dart';
import 'package:walletwise/utils/forms/wwForm.dart';
import 'package:walletwise/utils/snackbar.dart';

class BankAccController extends Wwform {
  final TextEditingController name = TextEditingController();
  final TextEditingController accountNumber = TextEditingController();
  final TextEditingController amount = TextEditingController();

  // Method to clear form fields
  @override
  void clearFields() {
    name.clear();
    accountNumber.clear();
    amount.clear();
    formState.value = 0;
  }

  //function update the bank form response

  void update(response) async {
    try {
      print('Response: $response');
      final data = jsonDecode(response);
      print('Data: $data');
      print('Data type: ${data.runtimeType}');

      if (data.containsKey('bank_balance')) {
        BankAccount bankAccount = BankAccount.fromJson(data['bank_balance']);
        BankAccountData.bankAccountList.add(bankAccount);
        print('Bank Account Name: ${bankAccount.name}');
      } else {
        print('Error: bank_balance not found in the response');
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }

  //Upload the saving
  Future<void> addBankAcc(BuildContext context) async {
    formState.value = 1;
    if (validateForm()) {
      try {
        await ModelOperation().add(
            body: {
              "name": name.text,
              "account_number": accountNumber.text,
              "amount": amount.text
            },
            url: ApiUrls.addBankAcc,
            successAction: (response) {
              update(response);
              //refetching the updated balance
              BalanceCardController.fetchBalanceCardData();
              clearFields();
              WwSnackbar.builder(
                  context, "Sucesssfully Added", WwSnackbartype.success);
            },
            errorAction: () {
              formState.value = 0;
            });
      } catch (e) {
        formState.value = 0;
      }
    } else {
      WwSnackbar.builder(context, "Invalid Inputs", WwSnackbartype.error);
    }
  }

  //for fetching the bank Accounts
  static Future<void> fetchBankAccount() async {
    try {
      ModelOperation.fetchFunction(
          ApiUrls.fetchBankAcc, (json) => BankAccount.fromJson(json),
          targetList: BankAccountData.bankAccountList,
          listKey: "bank_balances");
    } catch (e) {
      print('Error: $e');
    }
  }
}
