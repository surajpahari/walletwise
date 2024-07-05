import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:walletwise/data/stock_data.dart';
import 'package:walletwise/utils/cards/stock_protfolio_card.dart';

class StockRecord extends StatelessWidget {
  const StockRecord({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Obx(() => Wrap(
          alignment: WrapAlignment.center,
          children: UserStockData.boughtStockList.map((boughtStock) {
            return StockPortfolioCard(boughtStock: boughtStock);
          }).toList())),
    ]);
  }
}
