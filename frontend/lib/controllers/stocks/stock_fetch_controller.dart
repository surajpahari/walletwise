import "dart:convert";
import "dart:convert";
import "package:walletwise/data/stock_data.dart";
import "package:walletwise/models/lstm.dart";
import "package:walletwise/constants/app_constant.dart";
import "package:walletwise/controllers/modeloperation.dart";
import "package:walletwise/data/graph_data.dart";
import 'package:http/http.dart' as http;
import "package:walletwise/api/fetcher.dart";
import "package:walletwise/api/urls/app_urls.dart";
import "package:walletwise/data/stock_search_result.dart";
import "package:walletwise/models/stock.dart";
import "package:get/get.dart";

class StockFetchController extends GetxController {
  Future<dynamic> getTechnicalInsights(Stock stock) async {
    try {
      http.Response? response = await FetchAPI(
              ApiUrls.getStockInsights(stock.id, stock.symbol), HttpMethod.get,
              baseUrl: ApiUrls.pythonBaseUrl)
          .fetchUnauthorizedAPI();
      if (response != null && response.statusCode == 200) {
        dynamic finalResponse = jsonDecode(response.body);
        return finalResponse;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<OHLCdata>> getStockChart(Stock stock) async {
    try {
      http.Response? response = await FetchAPI(
              ApiUrls.getStockChart(stock.id, stock.symbol), HttpMethod.get,
              baseUrl: ApiUrls.pythonBaseUrl)
          .fetchUnauthorizedAPI();
      if (response != null && response.statusCode == 200) {
        try {
          dynamic decodedJson = jsonDecode(response.body);
          //print(decodedJson);
          if (decodedJson is List) {
            List<OHLCdata> ohlcDataList =
                decodedJson.map((json) => OHLCdata.fromJson(json)).toList();
            StockData.currentOHLCData = ohlcDataList;

            print(ohlcDataList);
            return ohlcDataList;
          } else if (decodedJson is Map<String, dynamic>) {
            OHLCdata ohlcData = OHLCdata.fromJson(decodedJson);
            //print([ohlcData][0]);
            return ([ohlcData]);
          } else {
            print('Unexpected JSON format');
            return [];
          }
        } catch (e) {
          print('Error decoding JSON: $e');
          rethrow;
        }
      } else {
        print('Request failed with status: ${response?.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error making API call: $e');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getCurrentData(Stock stock) async {
    try {
      http.Response? response = await FetchAPI(
              ApiUrls.getCurrentStockData(stock.id, stock.symbol),
              HttpMethod.get,
              baseUrl: ApiUrls.pythonBaseUrl)
          .fetchUnauthorizedAPI();
      print(response?.body);

      if (response != null) {
        var decodedResponse = jsonDecode(response.body);

        if (decodedResponse is List &&
            decodedResponse.isNotEmpty &&
            decodedResponse[0] is Map<String, dynamic>) {
          return decodedResponse[0] as Map<String, dynamic>;
        }
      }

      return {}; // Return an empty map if the response is null or not as expected
    } catch (e) {
      rethrow;
    }
  }

  Future<List<double>> getLstmData(Stock stock) async {
    Url url = ApiUrls.getLSTMChart(stock.id, stock.symbol);
    http.Response? response =
        await FetchAPI(url, HttpMethod.get, baseUrl: ApiUrls.pythonBaseUrl)
            .fetchUnauthorizedAPI();

    if (response?.statusCode == 200 && response != null) {
      var finalResponse = jsonDecode(response.body);
      List<dynamic> lstmData = finalResponse[0]['lstm'] ?? [];

      // Explicitly casting each element to double
      List<double> listofDouble = lstmData.map((e) => e as double).toList();
      return listofDouble; // Return the correctly typed list
    }

    return []; // Return an empty list of doubles if the API call fails
  }

  Future<Map<String, dynamic>> getForecastData(Stock stock) async {
    try {
      http.Response? response = await FetchAPI(
              ApiUrls.getForecastData(stock.id, stock.symbol), HttpMethod.get,
              baseUrl: ApiUrls.pythonBaseUrl)
          .fetchUnauthorizedAPI();
      //print(response?.body);

      if (response != null) {
        var decodedResponse = jsonDecode(response.body);
        if (decodedResponse is Map<String, dynamic>) {
          return decodedResponse;
        }
      }
      return {}; // Return an empty map if the response is null or not as expected
    } catch (e) {
      rethrow;
    }
  }
}
