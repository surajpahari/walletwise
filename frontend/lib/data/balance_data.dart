import 'package:walletwise/data/graph_data.dart';

class BalanceData {
  static List<XYGraphData> balanceRecord = [
    XYGraphData(x: 20, y: 20),
    XYGraphData(x: 25, y: 50),
    XYGraphData(x: 28, y: 90)
  ];
  static List<DateAmountGraphData> balanceHistory = [
    DateAmountGraphData(date: '2023/02/03', amount: 2000),
    DateAmountGraphData(date: '2023/02/04', amount: 3000),
    DateAmountGraphData(date: '2023/02/05', amount: 5000),
    DateAmountGraphData(date: '2023/02/06', amount: 8000),
  ];
}
