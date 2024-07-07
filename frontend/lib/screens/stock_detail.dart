import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletwise/constants/app_colors.dart';
import 'package:walletwise/controllers/stocks/stock_fetch_controller.dart';
import 'package:walletwise/data/stock_search_result.dart';
import 'package:walletwise/models/stock.dart';
import 'package:walletwise/screens/stock_insights.dart';
import 'package:walletwise/theme/theme_constant.dart';
import 'package:walletwise/utils/appbar/walletWiseBar.dart';
import 'package:walletwise/utils/cards/stock_card.dart';
import 'package:walletwise/utils/charts/candle_chart.dart';
import 'package:walletwise/utils/dialogs/DialogBuilder.dart';

class StockDetail extends StatelessWidget {
  const StockDetail({required this.stock, super.key});
  final Stock stock;

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: myTheme,
        child: Scaffold(
          appBar: WalletWiseBar.normalPageBar(stock.name),
          body: Container(
            color: AppColors.black,
            child: SingleChildScrollView(
                child: Column(children: [
              StockCard(stock: stock),
              WwCandleChart(
                stock: stock,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          StockFetchController controller =
                              StockFetchController();
                          controller.getStockInsights(stock);
                          controller.getStockChart(stock);
                          controller.getCurrentData(stock);
                          Get.to(StockInsights(stock: stock));
                        },
                        child: const Text(
                          "Insights",
                          style: TextStyle(color: Colors.white),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Dialogbuilder.stockForm(context, stock.id);
                        },
                        child: const Text(
                          "Add",
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                ),
              )
            ])),
          ),
        ));
  }
}
