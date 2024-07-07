import "package:get/get.dart";
import "package:walletwise/data/graph_data.dart";
import "package:walletwise/models/stock.dart";

class StockData {
  static RxList<Stock> searchList = <Stock>[].obs;
  static List<Stock> hotStock = <Stock>[];
  static List<OHLCdata> currentOHLCData = [
    OHLCdata('may-1', 34, 9, 10, 27),
    OHLCdata('may-2', 38, 10, 41, 29),
    OHLCdata('may-3', 38, 10, 21, 29),
    OHLCdata('may-4', 6, 7, 6, 24),
    OHLCdata('may-6', 34, 9, 10, 27),
  ];
}
