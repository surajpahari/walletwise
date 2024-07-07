import "dart:convert";
import "package:walletwise/data/graph_data.dart";
import 'package:http/http.dart' as http;
import "package:walletwise/api/fetcher.dart";
import "package:walletwise/api/urls/app_urls.dart";
import "package:walletwise/data/stock_search_result.dart";
import "package:walletwise/models/stock.dart";

class StockFetchController {
  Future<void> getStockInsights(Stock stock) async {
    try {
      http.Response? response = await FetchAPI(
              ApiUrls.getStockInsights(stock.id, stock.symbol), HttpMethod.get,
              baseUrl: ApiUrls.pythonBaseUrl)
          .fetchUnauthorizedAPI();
      print(response?.body);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<OHLCdata>> getStockChart(Stock stock) async {
    //return Future<List<OHLCdata>>.delayed(
    //  const Duration(seconds: 2),
    //  () => StockData.currentOHLCData,
    //);
    try {
      http.Response? response = await FetchAPI(
              ApiUrls.getCurrentStockData(stock.id, stock.symbol),
              HttpMethod.get,
              baseUrl: ApiUrls.pythonBaseUrl)
          .fetchUnauthorizedAPI();
      if (response != null && response.statusCode == 200) {
        try {
          dynamic decodedJson = jsonDecode(response.body);
          print(decodedJson);
          if (decodedJson is List) {
            List<OHLCdata> ohlcDataList =
                decodedJson.map((json) => OHLCdata.fromJson(json)).toList();
            StockData.currentOHLCData = ohlcDataList;

            print(ohlcDataList);
            return ohlcDataList;
          } else if (decodedJson is Map<String, dynamic>) {
            OHLCdata ohlcData = OHLCdata.fromJson(decodedJson);
            print([ohlcData][0]);
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

  Future<void> getCurrentData(Stock stock) async {
    try {
      http.Response? response = await FetchAPI(
              ApiUrls.getCurrentStockData(stock.id, stock.symbol),
              HttpMethod.get,
              baseUrl: ApiUrls.pythonBaseUrl)
          .fetchUnauthorizedAPI();
      print(response?.body);
    } catch (e) {
      rethrow;
    }
  }
}
