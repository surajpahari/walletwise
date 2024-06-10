import 'package:flutter/material.dart';
import 'package:walletwise/utils/cards/stock_protfolio_card.dart';

class StockRecord extends StatelessWidget {
  const StockRecord({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      StockPortfolioCard(
          stockName: "Shanti Cafe",
          currentPrice: 122.0,
          quantity: 20,
          buyingPrice: 120),
      StockPortfolioCard(
          stockName: "PFL", currentPrice: 12.0, quantity: 20, buyingPrice: 120),
    ]);
  }
}
