import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:walletwise/utils/charts/chart_data.dart';

class MyPieChart extends StatelessWidget {
  final List<PieData> data;
  const MyPieChart(this.data, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: PieChart(
        swapAnimationDuration: Duration(milliseconds: 150), // Optional
        swapAnimationCurve: Curves.linear,
        PieChartData(
          sections: data
              .map((item) => PieChartSectionData(
                    titleStyle: const TextStyle(color: Colors.white),
                    value: item.value,
                    title: item.name,
                    color: getColor(data.indexOf(item) + 1),
                    radius: 50,
                  ))
              .toList(),
        ),
      ),
    );
  }

  Color getColor(int index) {
    switch (index % 4) {
      case 0:
        return const Color(0xFF1976D2); // Dark Blue
      case 1:
        return const Color(0xFF388E3C); // Dark Green
      case 2:
        return const Color(0xFF512DA8); // Deep Purple
      case 3:
        return const Color(0xFFE64A19); // Deep Orange
      default:
        return Colors.black;
    }
  }
}
