import "package:flutter/material.dart";
import "package:get/get.dart";
import "dart:convert";
import "package:walletwise/api/urls/app_urls.dart";
import 'package:walletwise/controllers/modeloperation.dart';
import "package:walletwise/data/stock_data.dart";
import "package:walletwise/data/stock_search_result.dart";
import "package:walletwise/models/bought_stock.dart";
import "package:walletwise/utils/forms/wwForm.dart";
import "package:walletwise/utils/snackbar.dart";

class StockAddController extends Wwform {
  static StockAddController get instance => Get.find();
  final TextEditingController boughtDate = TextEditingController();
  final TextEditingController unit = TextEditingController();
  final TextEditingController price = TextEditingController();
  final int stockId;
  GlobalKey<FormState> addStockForm = GlobalKey<FormState>();
  StockAddController({required this.stockId});

//for fetching fetchExpenseCategories
  Future<void> addStock(context) async {
    try {
      ModelOperation().add(
          body: {
            "id": stockId,
            "boughtAt_at": price.text,
            "date": boughtDate.text
          },
          successAction: (response) {
            WwSnackbar.builder(
                context, "SuccessFullyAddec", WwSnackbartype.success);
            clearFields();
          },
          url: ApiUrls.addStocks);
    } catch (e) {
      print('Error: $e');
    }
  }

  static Future<void> fetchBoughtStock() async {
    print('hi');
    //try {
    //  ModelOperation.fetch(ApiUrls.fetchBoughtStocks,
    //      successAction: (response) {
    //    var body = jsonDecode(response.body);
    //    print(body);
    //  });
    //} catch (e) {
    //  print('Error: $e');
    //}
    try {
      ModelOperation.fetchFunction(
          ApiUrls.fetchBoughtStocks, (json) => BoughtStock.fromJson(json),
          listKey: 'stocks',
          targetList: UserStockData.boughtStockList, successAction: (response) {
        print(jsonDecode(response));
      });
    } catch (e) {
      print(e);
    }
    ;
  }

//addStock to the  userProfile
  Future<void> addBoughtStock(context) async {
    //print(stockId.toString());
    formState.value = 1;
    try {
      ModelOperation().add(
          body: {
            'stock_id': stockId.toString(),
            'no_of_units': unit.text,
            'price': price.text,
            'bought_at': boughtDate.text,
          },
          url: ApiUrls.addStocks,
          successAction: (response) {
            formState.value = 0;
            WwSnackbar.builder(
                context, "SuccessFully Added", WwSnackbartype.success);
          },
          errorAction: () {
            formState.value = 0;
          });
    } catch (e) {
      formState.value = 0;
      rethrow;
    }
  }

  //Future void

  static Future<void> deleteStock() async {}
  @override
  void clearFields() {}
}
