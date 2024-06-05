import "package:flutter/material.dart";
import 'dart:convert';
import "package:get/get.dart";
import "package:walletwise/api/fetcher.dart";
import "package:walletwise/api/urls/app_urls.dart";
import "package:walletwise/models/stock.dart";
import 'dart:async';
import "package:walletwise/data/stock_search_result.dart";

class StockController {
  Timer? searchFetchTimer;
  static StockController get instance => Get.find();
  final searchQuery = TextEditingController();

//fetch the query from the server
  Future<dynamic> fetchSearchQuery(query) async {
    Object body = {'key': query};
    await FetchAPI(ApiUrls.searchStocks, HttpMethod.post, body: body)
        .fetchUnauthorizedAPI()
        .then((response) => {updateSuggestion(response.body)});
  }

  //add the response to the data
  void updateSuggestion(responseBody) {
    final List<dynamic> jsonResponse = jsonDecode(responseBody);
    StockData.searchList.clear(); // Clear the existing list before updating
    // Convert each item in jsonResponse to a Stock object and add it to the RxList
    for (var item in jsonResponse) {
      StockData.searchList.add(Stock.fromJson(item));
    }
  }

//handle the change of the input
  void onChange(string) {
    searchFetchTimer?.cancel();
    searchFetchTimer = Timer(Duration(milliseconds: 200), () {
      if (searchQuery.text.trim().isNotEmpty) {
        fetchSearchQuery(string);
      } else {
        StockData.searchList.clear();
      }
    });
  }
}
