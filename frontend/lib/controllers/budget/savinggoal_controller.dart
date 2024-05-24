import 'package:flutter/material.dart';
import "dart:convert";
import 'package:get/get.dart';
import "package:walletwise/api/fetcher.dart";
import "package:walletwise/api/urls/app_urls.dart";
import "package:walletwise/data/balance_card.dart";
import 'package:walletwise/models/saving.dart';
import "package:walletwise/utils/forms/pages/saving_goal.dart";
import "package:walletwise/utils/snackbar.dart";

class SavinggoalController {
  final amount = TextEditingController();
  final endDate = TextEditingController();
  final title = TextEditingController();
  final note = TextEditingController();
  GlobalKey<FormState> savingFormKey = GlobalKey<FormState>();
  final RxInt formState = 0.obs;

  Future<dynamic> addSaving(Saving saving, BuildContext context) async {
    if (!savingFormKey.currentState!.validate()) {
      return;
    }

    print("hello");
    formState.value = 1;
    await Future.delayed(Duration(seconds: 2));
    formState.value = 2;
    BalanceCardData.balance += 20;
    WwSackbar.builder(context, "New Saving Goal Added");
    return;

    String incomeJson = jsonEncode(saving.toJson());
    if (savingFormKey.currentState == null ||
        !savingFormKey.currentState!.validate()) {
      return;
    }

    var response = await FetchAPI(ApiUrls.addIncome, HttpMethod.post,
        body: {'income': incomeJson}).fetchAuthorizedAPI();
    if (response.statusCode == 200) {
      print(response.body);
      print("Adding Income");
      formState.value = 2;
    } else {
      throw Exception('Failed to load budgets');
    }
  }
}
