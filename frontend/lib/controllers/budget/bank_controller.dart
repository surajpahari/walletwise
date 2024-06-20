import 'package:flutter/material.dart';
import 'package:walletwise/controllers/modeloperation.dart';
import 'package:walletwise/api/urls/app_urls.dart';
import 'package:walletwise/utils/forms/wwForm.dart';
import 'package:walletwise/utils/snackbar.dart';

class BankAccController extends Wwform {
  //String name;
  //String? type;
  //String? accountNumber;
  //double amount;
  //
  final TextEditingController name = TextEditingController();
  final TextEditingController accountNumber = TextEditingController();
  final TextEditingController amount = TextEditingController();

  // Method to validate and create a Saving object

  // Method to clear form fields
  @override
  void clearFields() {
    name.clear();
    accountNumber.clear();
    amount.clear();
    formState.value = 0;
  }

  //Upload the saving
  Future<void> addBankAcc(BuildContext context) async {
    formState.value = 1;
    if (validateForm()) {
      try {
        await ModelOperation().add(
            body: {
              "name": "nic",
              "account_number": "1000",
              "amount": "1000.00",
            },
            url: ApiUrls.addBankAcc,
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
