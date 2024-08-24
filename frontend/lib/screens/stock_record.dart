import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:walletwise/controllers/stocks/stock_add_controller.dart';
import 'package:walletwise/data/stock_data.dart';
import 'package:walletwise/utils/cards/stock_protfolio_card.dart';

class StockRecord extends StatefulWidget {
  const StockRecord({super.key});

  @override
  State<StockRecord> createState() => _StockRecordState();
}

class _StockRecordState extends State<StockRecord> {
  @override
  void initState() {
    super.initState();
    StockAddController.fetchBoughtStock();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      Obx(() => Wrap(
          alignment: WrapAlignment.center,
          children: UserStockData.boughtStockList.map((boughtStock) {
            return StockPortfolioCard(boughtStock: boughtStock);
          }).toList())),
    ]));
  }
}
