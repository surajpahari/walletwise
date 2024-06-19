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
  final TextEditingController amount = TextEditingController();
  final TextEditingController endDate = TextEditingController();
  final TextEditingController title = TextEditingController();
  final TextEditingController note = TextEditingController();

  // Method to validate and create a Saving object
  Saving? createSaving() {
    if (!formKey.currentState!.validate()) {
      return null;
    }
    return Saving(
      amount: int.parse(amount.text),
      date: endDate.text,
      title: title.text,
      note: note.text,
    );
  }

  // Method to clear form fields
  @override
  void clearFields() {
    amount.clear();
    endDate.clear();
    title.clear();
    note.clear();
    formState.value = 0;
  }

  void onSucessfullAdd(String responseBody) {
    print("Hey Mama");
  }

  //Upload the saving

  // Method to submit form data
  Future<void> addSaving(BuildContext context) async {
    WwSnackbar.builder(context, "Waiting", WwSnackbartype.success);
    validateForm();
    formState.value = 1;
    ModelOperation().add(
      body: {"amount": "400", "fire": "fire"},
      url: ApiUrls.addSaving,
      successAction: (response) {
        WwSnackbar.builder(
            context, "SuccessFullyAddec", WwSnackbartype.success);
        clearFields();
      },
    );
  }

  static Future<void> fetchSaving() async {
    try {
      await ModelOperation.fetchFunction(
        ApiUrls.fetchSavingGoal,
        (json) => Saving.fromJson(json),
        targetList: SavingGoalData.savinglist,
      );
    } catch (e) {
      print('Error: $e');
    }
  }

  void delete() {
    print("Deleting");
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
