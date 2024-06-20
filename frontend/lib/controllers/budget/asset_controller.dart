import 'package:flutter/material.dart';
import 'package:walletwise/controllers/modeloperation.dart';
import 'package:walletwise/models/assets.dart';
import 'package:walletwise/api/urls/app_urls.dart';
import 'package:walletwise/utils/forms/wwForm.dart';
import 'package:walletwise/utils/snackbar.dart';

class AssetController extends Wwform {
  final TextEditingController title = TextEditingController();
  final TextEditingController amount = TextEditingController();

  // Method to validate and create a Saving object
  Assets? createAsset() {
    if (!formKey.currentState!.validate()) {
      return null;
    }
    return Assets(
      amount: int.parse(amount.text).toDouble(),
      name: title.text,
    );
  }

  // Method to clear form fields
  @override
  void clearFields() {
    amount.clear();
    title.clear();
    formState.value = 0;
  }

  //Upload the saving
  Future<void> addAssets(BuildContext context) async {
    formState.value = 1;
    try {
      await ModelOperation().add(
          body: {
            "amount": int.parse(amount.text).toString(),
            "name": title.text
          },
          url: ApiUrls.addAssets,
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
  }
}
