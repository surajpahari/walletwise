import 'package:get/get.dart';
import 'package:walletwise/models/stock.dart';
import 'package:walletwise/models/bought_stock.dart';

class UserStockData {
  static RxList<BoughtStock> boughtStockList = <BoughtStock>[
    BoughtStock(
        date: '10/2023/5',
        stock: Stock(
          name: "Pokhara Finance",
          securityName: "Pokhara Finance ",
          symbol: "PFl",
          id: 23,
        ),
        unit: 100,
        boughtAmount: 100)
  ].obs;
}
