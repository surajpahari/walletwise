import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TestScreen extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  TestScreen({Key? key}) : super(key: key);
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;
  @override
  void initState() {
    data = [
      _ChartData('GERo', 32, 12, 19, 30),
      _ChartData('RUSo', 37, 7, 17, 24),
      _ChartData('BRZo', 34, 9, 16, 27),
      _ChartData('CHNo', 38, 10, 21, 29),
      _ChartData('CHi', 39, 10, 21, 29),
      _ChartData('GERi', 32, 12, 19, 30),
      _ChartData('RUSi', 37, 7, 17, 24),
      _ChartData('BRZi', 34, 9, 16, 27),
      _ChartData('CHN', 38, 10, 21, 29),
      _ChartData('GER', 32, 12, 19, 30),
      _ChartData('RUS', 37, 7, 17, 24),
      _ChartData('BRZ', 34, 9, 16, 27),
      _ChartData('GERa', 32, 12, 19, 30),
      _ChartData('RUSa', 37, 7, 17, 24),
      _ChartData('BRZa', 34, 9, 16, 27),
      _ChartData('CHNa', 38, 10, 21, 29),
      _ChartData('CHi', 39, 10, 21, 29),
      _ChartData('GERi', 32, 12, 19, 30),
      _ChartData('RUSi', 37, 7, 17, 24),
      _ChartData('BRZi', 34, 9, 16, 27),
      _ChartData('CHN', 38, 10, 21, 29),
      _ChartData('GER', 32, 12, 19, 30),
      _ChartData('RUS', 37, 7, 17, 24),
      _ChartData('BRZ', 34, 9, 16, 27),
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter chart'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(
              minimum: 0,
              maximum: 10,
              interval: 3,
            ),
            primaryYAxis: NumericAxis(minimum: 0, maximum: 40, interval: 2),
            tooltipBehavior: _tooltip,
            series: <CartesianSeries<_ChartData, String>>[
              CandleSeries<_ChartData, String>(
                animationDuration: 1000.00,
                dataSource: data,
                bullColor: Colors.yellow,
                xValueMapper: (_ChartData data, _) => data.x,
                highValueMapper: (_ChartData data, _) => data.high,
                lowValueMapper: (_ChartData data, _) => data.low,
                openValueMapper: (_ChartData data, _) => data.open,
                closeValueMapper: (_ChartData data, _) => data.close,
                name: 'Gold',
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.high, this.low, this.open, this.close);
  final String x;
  final double high;
  final double low;
  final double open;
  final double close;
}
