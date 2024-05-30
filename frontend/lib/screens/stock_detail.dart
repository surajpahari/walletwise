import 'package:flutter/material.dart';
import 'package:walletwise/constants/app_colors.dart';
import 'package:walletwise/models/stock.dart';
import 'package:walletwise/theme/theme_constant.dart';
import 'package:walletwise/utils/appbar/walletWiseBar.dart';
import 'package:walletwise/utils/cards/stock_card.dart';
import 'package:walletwise/utils/charts/candle_chart.dart';

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
              StockCard(),
              WwCandleChart(),
            ])),
          ),
        ));
  }
}
