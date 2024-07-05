import 'package:walletwise/models/bought_stock.dart';
import 'package:walletwise/models/stock.dart';

class BoughtStock {
  Stock stock;
  String boughtDate;
  double boughtUnit;
  double boughtPrice;
  BoughtStock(
      {required this.stock,
      required this.boughtDate,
      required this.boughtUnit,
      required this.boughtPrice});
}
