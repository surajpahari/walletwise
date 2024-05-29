import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class _ChartData {
  _ChartData(this.x, this.high, this.low, this.open, this.close);
  final String x;
  final double high;
  final double low;
  final double open;
  final double close;
}

class WwCandleChart extends StatelessWidget {
  WwCandleChart({super.key});
  final data = [
    _ChartData('RUSo', 6, 7, 6, 24),
    _ChartData('BRZo', 34, 9, 10, 27),
    _ChartData('CHNo', 38, 10, 41, 29),
    _ChartData('CHN', 38, 10, 21, 29),
    _ChartData('GER', 32, 12, 19, 30),
    _ChartData('RUS', 37, 7, 27, 24),
    _ChartData('BRZ', 34, 9, 36, 27),
    _ChartData('BRZa', 34, 9, 16, 27),
    _ChartData('BRZb', 34, 9, 16, 27),
    _ChartData('BRZc', 34, 9, 16, 27),
    _ChartData('GERd', 32, 12, 19, 30),
    _ChartData('GERe', 32, 12, 39, 30),
    _ChartData('GERf', 32, 12, 19, 30),
    _ChartData('RUSg', 37, 7, 17, 24),
    _ChartData('RUSh', 37, 7, 17, 24),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 350),
      child: SfCartesianChart(
          primaryXAxis: CategoryAxis(
              minimum: 0,
              maximum: 15,
              interval: 1,
              majorGridLines: MajorGridLines(width: 0)),
          primaryYAxis: NumericAxis(
            minimum: 0,
            maximum: 40,
            interval: 2,
            majorGridLines: MajorGridLines(width: 0),
            minorGridLines: MinorGridLines(width: 0),
          ),
          series: <CartesianSeries<_ChartData, String>>[
            CandleSeries<_ChartData, String>(
              animationDuration: 1000.00,
              dataSource: data,
              bullColor: Colors.green,
              bearColor: Colors.red,
              xValueMapper: (_ChartData data, _) => data.x,
              highValueMapper: (_ChartData data, _) => data.high,
              lowValueMapper: (_ChartData data, _) => data.low,
              openValueMapper: (_ChartData data, _) => data.open,
              closeValueMapper: (_ChartData data, _) => data.close,
              name: 'Gold',
              enableSolidCandles: true,
            )
          ]),
    );
  }
}
