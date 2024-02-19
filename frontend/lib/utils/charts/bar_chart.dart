import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ChartData {
  final double x;
  final double y;

  ChartData({required this.x, required this.y});
}

List<ChartData> getChartData() {
  final data = <double>[10, 30, 23, 41, 581, 100];
  return data.asMap().entries.map((entry) {
    final index = entry.key.toDouble();
    final value = entry.value;
    return ChartData(x: index, y: value);
  }).toList();
}

class MyLineChart extends StatelessWidget {
  final List<ChartData> points;
  const MyLineChart(this.points, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: LineChart(LineChartData(lineBarsData: [
        LineChartBarData(
            barWidth: 5,
            color: Colors.green,
            spots: points.map((point) => FlSpot(point.x, point.y)).toList(),
            dotData: const FlDotData(show: true)),
      ])),
    );
  }
}
