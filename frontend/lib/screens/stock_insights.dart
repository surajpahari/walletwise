import 'package:flutter/material.dart';
import 'package:walletwise/models/stock.dart';
import 'package:walletwise/utils/appbar/walletWiseBar.dart';
import 'package:walletwise/theme/theme_constant.dart';
import 'package:walletwise/utils/cards/warning_card.dart';

class StockInsights extends StatefulWidget {
  final Stock stock;
  const StockInsights({required this.stock, super.key});

  @override
  State<StockInsights> createState() => _StockInsightsState();
}

class _StockInsightsState extends State<StockInsights> {
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: myTheme,
        child: Scaffold(
          appBar: WalletWiseBar.normalPageBar("Insights"),
          body: SingleChildScrollView(
            child: Column(children: [
              const WarningCard(),
              Text(widget.stock.name, style: const TextStyle()),
            ]),
          ),
        ));
  }
}
