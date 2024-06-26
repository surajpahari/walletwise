import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:walletwise/controllers/modeloperation.dart';
import 'package:walletwise/api/fetcher.dart';
import 'package:walletwise/api/urls/app_urls.dart';
import 'package:walletwise/data/saving_goals.dart';
import 'package:walletwise/models/saving.dart';
import 'package:walletwise/utils/forms/wwForm.dart';
import 'package:http/http.dart' as http;
import 'package:walletwise/utils/snackbar.dart';

class SavinggoalController extends Wwform {
  final TextEditingController name = TextEditingController();
  final TextEditingController amount = TextEditingController();
  final TextEditingController endDate = TextEditingController();
  final TextEditingController note = TextEditingController();

  // Method to validate and create a Saving object
  Saving? createSaving() {
    if (!formKey.currentState!.validate()) {
      return null;
    }
    return Saving(
      amount: int.parse(amount.text),
      date: endDate.text,
      name: name.text,
      note: note.text,
    );
  }

  // Method to clear form fields
  @override
  void clearFields() {
    amount.clear();
    endDate.clear();
    name.clear();
    note.clear();
    formState.value = 0;
  }

  void updateSaving(response) async {
    try {
      final data = jsonDecode(response);
      if (data.containsKey('saving')) {
        Saving saving = Saving.fromJson(data['saving']);
        SavingGoalData.savinglist.add(saving);
      } else {}
    } catch (e) {
      throw Exception(e);
    }
  }

  // Method to submit form data
  Future<void> addSaving(BuildContext context) async {
    WwSnackbar.builder(context, "Waiting", WwSnackbartype.success);
    validateForm();
    formState.value = 1;
    ModelOperation().add(
        body: {
          "amount": "50000",
          "category_id": "1",
          "date": '2024/06/20',
          "bank_balance_id": '1',
          "period": '20',
          "type": 'routine',
          "name": "chocofun",
        },
        url: ApiUrls.addExpense,
        //body: {"amount": "400", "fire": "fire"},
        //url: ApiUrls.addSaving,
        successAction: (response) {
          WwSnackbar.builder(
              context, "SuccessFullyAddec", WwSnackbartype.success);
          clearFields();
        },
        errorAction: () {
          formState.value = 0;
        });
  }

  static Future<void> fetchSaving() async {
    try {
      await ModelOperation.fetchFunction(
        ApiUrls.fetchSavingGoal,
        (json) => Saving.fromJson(json),
        targetList: SavingGoalData.savinglist,
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<http.Response?> edit() async {
    try {
      return await FetchAPI(
        ApiUrls.editSaving,
        HttpMethod.post,
        body: {},
      ).fetchUnauthorizedAPI();
    } catch (e) {
      return null;
    }
  }
}
