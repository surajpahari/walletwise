import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:walletwise/data/graph_data.dart';

class WwCandleChart extends StatelessWidget {
  final List<OHLCdata> data;
  WwCandleChart({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 350),
      child: SfCartesianChart(
          primaryXAxis: const CategoryAxis(
              minimum: 0,
              maximum: 15,
              interval: 1,
              majorGridLines: MajorGridLines(width: 0)),
          primaryYAxis: const NumericAxis(
            minimum: 0,
            maximum: 40,
            interval: 2,
            majorGridLines: MajorGridLines(width: 0),
            minorGridLines: MinorGridLines(width: 0),
          ),
          series: <CartesianSeries<OHLCdata, String>>[
            CandleSeries<OHLCdata, String>(
              animationDuration: 1000.00,
              dataSource: data,
              bullColor: Colors.green,
              bearColor: Colors.red,
              xValueMapper: (data, _) => data.x,
              highValueMapper: (data, _) => data.high,
              lowValueMapper: (data, _) => data.low,
              openValueMapper: (data, _) => data.open,
              closeValueMapper: (data, _) => data.close,
              name: 'Gold',
              enableSolidCandles: true,
            )
          ]),
    );
  }
}
