import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PieData {
  final String name;
  final double value;
  PieData({required this.name, required this.value});
}

class MyPieChart extends StatelessWidget {
  final List<PieData> data;
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
                    title: item.name,
                    color: Colors.red,
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
