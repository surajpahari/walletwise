import 'package:flutter/material.dart';
import 'package:walletwise/utils/cards/hero_card.dart';
import 'package:walletwise/utils/charts/bar_chart.dart';
import 'package:walletwise/utils/tabs/asset_debt.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BalanceCard(),
          SizedBox(
            height: 20,
          ),
          AssetDebt(),
          SizedBox(
            height: 20,
          ),
          Container(
            constraints: BoxConstraints(maxWidth: 500),
            child: MyLineChart(getChartData()), // Add the line chart here
          )
        ],
      ),
    );
  }
}
