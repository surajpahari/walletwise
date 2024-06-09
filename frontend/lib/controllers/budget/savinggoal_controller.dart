import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletwise/utils/snackbar.dart';
import 'package:walletwise/api/fetcher.dart';
import 'package:walletwise/api/urls/app_urls.dart';
import 'package:walletwise/data/saving_goals.dart';
import 'package:walletwise/models/saving.dart';
import 'package:walletwise/utils/forms/wwForm.dart';
import 'package:http/http.dart' as http;

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
  }

  //Upload the saving
  Future<http.Response?> add() async {
    Saving? saving = createSaving();
    if (saving != null) {
      try {
        http.Response? response = await FetchAPI(
          ApiUrls.addSaving,
          HttpMethod.post,
          body: {
            'amount': saving.amount.toString(),
            'date': saving.date,
            'title': saving.title,
            'note': saving.note,
          },
        ).fetchAuthorizedAPI();
        if (response?.statusCode == 200) {
          updateSaving(saving);
          clearFields();
          return response;
        }
      } catch (e) {
        debugPrint(e.toString());
        return null;
      }
    }
  }

  // Method to submit form data
  @override
  Future<void> submitForm(BuildContext context) async {
    http.Response? response = await add();
    if (response?.statusCode == 200) {
      WwSnackbar.builder(
          context, 'Sucessfull submission', WwSnackbartype.success);
    }
  }
  //try {
  //formState.value = 1;
  //if saving cannot be created
  //if (saving == null) {
  //formState.value = 0;
  //return;
  //} else {}

  //send the saving
  //
  //var response = await uploadSaving(saving);
  //  print("hey");
  //  print(response?.body);
  //  if (response?.statusCode == 200) {
  //    print("teacher");
  //    handleSucess(context, "Sucessfully Added");
  //  } else {
  //    handleUploadError(context, "Internal Server Error");
  //  }
  //} catch (e) {
  //  formState.value = 0;
  //  WwSnackbar.builder(
  //      context, 'An error occurred: $e', WwSnackbartype.error);
  //}

  void updateSaving(Saving? saving) {
    if (saving != null) {
      SavingGoalData.savinglist.add(saving);
    }
  }

  static Future<void> fetchSaving() async {
    try {
      var response = await FetchAPI(ApiUrls.fetchSavingGoal,
              HttpMethod.get) // Ensure the correct HTTP method is used.
          .fetchAuthorizedAPI();
      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse =
            jsonDecode(response.body); // Ensure response is a list
        print(response.body);
        var savings = jsonResponse
            .map((item) => Saving.fromJson(item))
            .toList(); // Map JSON to Saving objects
        SavingGoalData.savinglist.assignAll(savings);
        print("Success: Savings fetched and updated.");
      } else {
        throw Exception('Failed to fetch savings: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching savings: $e');
      throw Exception('Failed to fetch savings: $e');
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
