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
    OHLCdata('may-7', 38, 10, 41, 29),
    OHLCdata('may-8', 38, 10, 21, 29),
    OHLCdata('may-9', 6, 7, 6, 24),
    OHLCdata('may-10', 34, 9, 10, 27),
    OHLCdata('may-11', 38, 10, 41, 29),
    OHLCdata('may-23', 38, 10, 21, 29),
    OHLCdata('may-24', 34, 9, 10, 27),
    OHLCdata('may-25', 38, 10, 41, 29),
    OHLCdata('may-26', 38, 10, 21, 29),
    OHLCdata('may-27', 6, 7, 6, 24),
    OHLCdata('may-28', 34, 9, 10, 27),
    OHLCdata('may-29', 38, 10, 41, 29),
    OHLCdata('may-30', 38, 10, 21, 29),
    OHLCdata('may-49', 6, 7, 6, 24),
    OHLCdata('may-61', 34, 9, 10, 27),
    OHLCdata('may-71', 38, 10, 41, 29),
    OHLCdata('may-81', 38, 10, 21, 29),
    OHLCdata('may-91', 6, 7, 6, 24),
    OHLCdata('may-110', 34, 9, 10, 27),
    OHLCdata('may-1121', 38, 10, 41, 29),
    OHLCdata('may-213', 38, 10, 21, 29),
    OHLCdata('may-2124', 34, 9, 10, 27),
    OHLCdata('may-2w5', 38, 10, 41, 29),
    OHLCdata('may-2w6', 38, 10, 21, 29),
    OHLCdata('may-2e7', 6, 7, 6, 24),
    OHLCdata('may-2e8', 34, 9, 10, 27),
  ];
}
