import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:walletwise/api/urls/app_urls.dart";
import 'package:walletwise/controllers/modeloperation.dart';
import "package:walletwise/models/bought_stock.dart";
import "package:walletwise/utils/forms/wwForm.dart";
import "package:walletwise/utils/snackbar.dart";

class StockAddController extends Wwform {
  static StockAddController get instance => Get.find();
  final TextEditingController boughtDate = TextEditingController();
  final TextEditingController unit = TextEditingController();
  final TextEditingController cost = TextEditingController(text: "peroid");
  final int? stockId = null;
  GlobalKey<FormState> addStockForm = GlobalKey<FormState>();

//for fetching fetchExpenseCategories
  Future<void> addStock(context) async {
    try {
      if (stockId != null) {
        ModelOperation().add(
            body: {"id": stockId, "buy_at": cost, "date": boughtDate},
            successAction: (response) {
              WwSnackbar.builder(
                  context, "SuccessFullyAddec", WwSnackbartype.success);
              clearFields();
            },
            url: ApiUrls.addStocks);
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> fetchBoughtStock() async {
    try {
      ModelOperation.fetchFunction(
          ApiUrls.fetchBoughtStocks, (json) => BoughtStock.fromJson(json));
    } catch (e) {
      print('Error: $e');
    }
  }

  static Future<void> deleteStock() async {}
  @override
  void clearFields() {}
}
