import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ChartData {
  final String category;
  final double value;

  ChartData({required this.category, required this.value});
}

List<ChartData> getChartData() {
  return [
    ChartData(category: 'Category A', value: 30),
    ChartData(category: 'Category B', value: 40),
    ChartData(category: 'Category C', value: 20),
    ChartData(category: 'Category D', value: 10),
  ];
}

class MyPieChart extends StatelessWidget {
  final List<ChartData> data;

  const MyPieChart(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: PieChart(
        PieChartData(
          sections: data
              .map((item) => PieChartSectionData(
                    value: item.value,
                    title: item.category,
                    color: getColor(data.indexOf(item)),
                    radius: 100,
                  ))
              .toList(),
        ),
      ),
    );
  }

  Color getColor(int index) {
    switch (index % 4) {
      case 0:
        return Colors.red;
      case 1:
        return Colors.blue;
      case 2:
        return Colors.green;
      case 3:
        return Colors.orange;
      default:
        return Colors.black;
    }
  }
}
