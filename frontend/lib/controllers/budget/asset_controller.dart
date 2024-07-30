import 'dart:convert';
import "package:get/get.dart";
import 'package:flutter/material.dart';
import 'package:walletwise/controllers/modeloperation.dart';
import 'package:walletwise/data/asset_debt_data.dart';
import 'package:walletwise/data/graph_data.dart';
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

  static void update(response) async {
    try {
      final data = jsonDecode(response);
      if (data.containsKey('asset')) {
        Assets assets = Assets.fromJson(data['asset']);
        AssetDebtData.assetsData.add(assets);
        AssetDebtData.pieDataList
            .add(PieData(name: assets.name, value: assets.amount));
      } else {
        return;
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
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
            try {
              update(response);
            } catch (e) {
              throw Exception("Failed to update assets:$e");
            }
            Get.back();
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

//fetch the assets
  static Future<void> getAssets(BuildContext context) async {
    //formState.value = 1;
    try {
      ModelOperation.fetchFunction(ApiUrls.fetchAssets, Assets.fromJson,
          targetList: AssetDebtData.assetsData, successAction: (response) {
        try {
          //update(response);
        } catch (e) {
          throw Exception("Failed to update assets:$e");
        }
      });
      AssetDebtData.updateChart();
    } catch (e) {
      //formState.value = 0;
    }
  }
}
