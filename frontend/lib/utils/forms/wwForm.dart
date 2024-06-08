import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletwise/utils/snackbar.dart';

abstract class Wwform {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final formState = 0.obs;
  void clearFields();

//validate the form
  bool validateForm() {
    return formKey.currentState!.validate();
  }

  void handleUploadError(context, message) {
    formState.value = 0;
    WwSnackbar.builder(context, message, WwSnackbartype.error);
    return;
  }

  void handleSucess(context, message) {
    formState.value = 0;
    WwSnackbar.builder(context, message, WwSnackbartype.error);
    clearFields();
    return;
  }

  // Clear all fields

  Future<void> submitForm(BuildContext context);
}
