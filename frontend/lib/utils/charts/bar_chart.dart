import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ChartData {
  final double x;
  final double y;

  ChartData({required this.x, required this.y});
}

List<ChartData> getChartData() {
  final data = <double>[
    100,
    30,
    50,
    40,
    20,
    40,
    30,
    50,
    200,
    20,
    20,
    30,
    90,
    100,
    300,
    100,
    30,
    50,
    40,
    20,
    40,
    30,
    50,
    200,
    20,
    20,
    30,
    90,
    100,
    300,
    1100,
    300,
    00,
    300
  ];
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
          barWidth: 3,
          color: Colors.pink,
          spots: points.map((point) => FlSpot(point.x, point.y)).toList(),
        ),
      ])),
    );
  }
}
