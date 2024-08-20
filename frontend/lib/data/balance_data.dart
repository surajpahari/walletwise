import 'package:walletwise/data/graph_data.dart';
import 'package:get/get.dart';

class BalanceData {
  static List<DateAmountGraphData> balanceHistory = <DateAmountGraphData>[
    DateAmountGraphData(date: '2023/02/03', amount: 2000),
    DateAmountGraphData(date: '2023/02/04', amount: 3000),
    DateAmountGraphData(date: '2023/02/05', amount: 5000),
    DateAmountGraphData(date: '2023/02/06', amount: 7000),
    DateAmountGraphData(date: '2023/02/07', amount: 6000),
    DateAmountGraphData(date: '2023/02/10', amount: 3000),
    DateAmountGraphData(date: '2023/02/16', amount: 13000)
  ].obs;
}
