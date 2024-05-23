import "dart:convert";
import "package:flutter/material.dart";
import "package:walletwise/api/fetcher.dart";
import "package:walletwise/api/urls/app_urls.dart";
import "package:walletwise/models/income.dart";
import 'package:get/get.dart';

class IncomeController {
  final item = TextEditingController();
  final amount = TextEditingController();
  final category = TextEditingController();
  final date = TextEditingController();
  GlobalKey<FormState> incomeFormKey = GlobalKey<FormState>();

  final RxString submitState = "Add".obs;
  Future<dynamic> addIncome(Income income) async {
    submitState.value = "Loading";
    String incomeJson = jsonEncode(income.toJson());
    if (incomeFormKey.currentState == null ||
        !incomeFormKey.currentState!.validate()) {
      submitState.value = "Error";
      return;
    }

    var response = await FetchAPI(ApiUrls.addIncome, HttpMethod.post,
        body: {'income': incomeJson}).fetchAuthorizedAPI();
    if (response.statusCode == 200) {
      print(response.body);
      print("Adding Income");
      submitState.value = "Add";
    } else {
      throw Exception('Failed to load budgets');
    }
  }
}
