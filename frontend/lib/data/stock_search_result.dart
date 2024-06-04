import "package:get/get.dart";
import "package:walletwise/models/stock.dart";

class StockSearchResult {
  static RxList<Stock> searchList = <Stock>[].obs;
  static List<Stock> hotStock = <Stock>[];
}
