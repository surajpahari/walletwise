import 'package:flutter/material.dart';
import 'package:walletwise/utils/charts/pie_char.dart';

class CategoryScreen extends StatelessWidget {
  final String category;
  final int total;

  const CategoryScreen({Key? key, required this.category, required this.total})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Call getChartData function to get chart data
    final List<ChartData> chartData = getChartData();

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      backgroundColor: Colors.grey[900],
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Padding(
            padding: const EdgeInsets.all(50), child: MyPieChart(chartData)),
        Text(
          "Total:Rs $total",
          style: const TextStyle(color: Colors.white, fontSize: 30.0),
        )
      ]),
    );
  }
}
