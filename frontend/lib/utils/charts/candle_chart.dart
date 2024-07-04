import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:walletwise/data/graph_data.dart';

class WwCandleChart extends StatefulWidget {
  final List<OHLCdata> data;
  WwCandleChart({required this.data, super.key});

  @override
  _WwCandleChartState createState() => _WwCandleChartState();
}

class _WwCandleChartState extends State<WwCandleChart> {
  late TrackballBehavior _trackballBehavior;

  @override
  void initState() {
    _trackballBehavior = TrackballBehavior(
      enable: true,
      activationMode: ActivationMode.singleTap,
      tooltipDisplayMode: TrackballDisplayMode.groupAllPoints,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 350),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          width: 800, // Set a larger width to make the chart scrollable
          child: SfCartesianChart(
            trackballBehavior: _trackballBehavior,
            indicators: [
              RsiIndicator<OHLCdata, String>(
                dataSource: widget.data,
                xValueMapper: (data, _) => data.x,
                closeValueMapper: (data, _) => data.close,
                period: 14, // Default period for RSI
                yAxisName: 'rsiAxis', // Optional: name the axis if needed
              ),
            ],
            primaryXAxis: const CategoryAxis(
              minimum: 0,
              maximum: 40,
              interval: 1,
              majorGridLines: MajorGridLines(width: 0),
            ),
            primaryYAxis: const NumericAxis(
              minimum: 0,
              maximum: 40,
              interval: 2,
              majorGridLines: MajorGridLines(width: 0),
              minorGridLines: MinorGridLines(width: 0),
            ),
            axes: <ChartAxis>[
              NumericAxis(
                name: 'rsiAxis',
                minimum: 0,
                maximum: 100,
                interval: 20,
                majorGridLines: MajorGridLines(width: 0),
              ),
            ],
            series: <CartesianSeries<OHLCdata, String>>[
              CandleSeries<OHLCdata, String>(
                trendlines: [
                  Trendline(type: TrendlineType.movingAverage),
                ],
                animationDuration: 1000.00,
                dataSource: widget.data,
                bullColor: Colors.blue,
                bearColor: Colors.pink,
                xValueMapper: (data, _) => data.x,
                highValueMapper: (data, _) => data.high,
                lowValueMapper: (data, _) => data.low,
                openValueMapper: (data, _) => data.open,
                closeValueMapper: (data, _) => data.close,
                name: 'Gold',
                enableSolidCandles: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
