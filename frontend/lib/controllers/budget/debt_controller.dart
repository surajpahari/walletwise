import 'package:flutter/material.dart';
import 'package:walletwise/controllers/modeloperation.dart';
import 'package:walletwise/api/urls/app_urls.dart';
import 'package:walletwise/utils/forms/wwForm.dart';
import 'package:walletwise/utils/snackbar.dart';

class DebtController extends Wwform {
  final TextEditingController title = TextEditingController();
  final TextEditingController amount = TextEditingController();

  // Method to validate and create a Saving object

  // Method to clear form fields
  @override
  void clearFields() {
    amount.clear();
    title.clear();
    formState.value = 0;
  }

  //Upload the saving
  Future<void> addDebts(BuildContext context) async {
    formState.value = 1;
    if (validateForm()) {
      try {
        await ModelOperation().add(
            body: {
              "amount": int.parse(amount.text).toString(),
              "title": title.text
            },
            url: ApiUrls.addDebt,
            successAction: (response) {
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
}
