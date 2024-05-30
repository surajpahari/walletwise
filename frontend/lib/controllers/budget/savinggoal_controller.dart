import 'package:flutter/material.dart';
import "dart:convert";
import 'package:get/get.dart';
import "package:walletwise/api/fetcher.dart";
import "package:walletwise/api/urls/app_urls.dart";
import "package:walletwise/data/asset_debt_data.dart";
import "package:walletwise/data/balance_card.dart";
import "package:walletwise/data/graph_data.dart";
import "package:walletwise/data/saving_goals.dart";
import "package:walletwise/models/assets.dart";
import 'package:walletwise/models/saving.dart';
import "package:walletwise/utils/forms/pages/saving_goal.dart";
import "package:walletwise/utils/snackbar.dart";

//user inputs the saving;
//validate the saving
//create saving model form the input
//on sucess
//display the sucess  snackbar
// update the ui
class SavinggoalController {
  final amount = TextEditingController();
  final endDate = TextEditingController();
  final title = TextEditingController();
  final note = TextEditingController();
  GlobalKey<FormState> savingFormKey = GlobalKey<FormState>();
  final RxInt formState = 0.obs;

//Validate the input and create  saving
  Saving? createSaving() {
    if (!savingFormKey.currentState!.validate()) {
      return null;
    }
    return Saving(
      amount: int.parse(amount.text),
      date: endDate.text.toString(),
      title: title.text.toString(),
      note: note.text.toString(),
    );
  }

  Future<dynamic> addSaving(BuildContext context) async {
    Saving? saving = createSaving();
    if (saving == null) {
      return;
    } else {
      formState.value = 1;
      var response = await FetchAPI(ApiUrls.addSaving, HttpMethod.post,
          body: {'saving': '1000'}).fetchUnauthorizedAPI();
      if (response.statusCode == 200) {
        formState.value = 2;
        WwSackbar.builder(context, "New Saving Goal Added");
        updateSaving(saving);
        clearInputField();
      } else {
        throw Exception('Failed to load budgets');
      }

      BalanceCardData.balance += 20;
      AssetDebtData.pieDataList.add(PieData(name: "valentina", value: 2000));
      //add to the server
      //update the saving
    }
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

  void updateSaving(saving) {
    SavingGoalData.savinglist.add(saving);
    AssetDebtData.addAsset(Assets(Name: "real state", Amount: 1000.00));
  }

  void clearInputField() {
    amount.clear();
    title.clear();
    note.clear();
    endDate.clear();
  }
}
