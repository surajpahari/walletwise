import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ForecastGraph extends StatelessWidget {
  final List<double> ltpData; // Dynamic LTP data
  final double yLine1; // y value for the first line
  final double yLine2; // y value for the second line

  ForecastGraph(
      {required this.ltpData,
      required this.yLine1,
      required this.yLine2,
      Key? key});

  @override
  Widget build(BuildContext context) {
    final double chartWidth = ltpData.length * 10.0 * 0.9; // Adjusted width

    // Create a TooltipBehavior instance
    final TooltipBehavior tooltipBehavior = TooltipBehavior(
      enable: true,
      canShowMarker: true,
      tooltipPosition:
          TooltipPosition.pointer, // Position tooltip at the pointer
      format: 'point.y', // Show only y value in the tooltip
    );

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        reverse: true,
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: chartWidth, // Apply the adjusted width
          child: SfCartesianChart(
            primaryXAxis: const NumericAxis(
              edgeLabelPlacement: EdgeLabelPlacement.shift,
              interval: 10, // Adjust interval for readability
              majorGridLines: MajorGridLines(width: 0), // Hide grid lines
            ),
            primaryYAxis: const NumericAxis(
              edgeLabelPlacement: EdgeLabelPlacement.shift,
              interval: 50,
              majorGridLines: MajorGridLines(width: 0), // Hide grid lines
            ),
            tooltipBehavior: tooltipBehavior, // Set tooltip behavior
            series: <CartesianSeries>[
              // Line series for LTP data
              LineSeries<_ChartData, int>(
                dataSource: List.generate(
                  ltpData.length,
                  (index) => _ChartData(index, ltpData[index]),
                ),
                xValueMapper: (_ChartData data, _) => data.x,
                yValueMapper: (_ChartData data, _) => data.y,
                name: 'LTP Data',
                color: Colors.blue,
                enableTooltip: true, // Enable tooltip for this series
              ),
              // Dotted line for y = yLine1
              LineSeries<_ChartData, int>(
                dataSource: [
                  _ChartData(0, yLine1),
                  _ChartData(ltpData.length - 1, yLine1),
                ],
                xValueMapper: (_ChartData data, _) => data.x,
                yValueMapper: (_ChartData data, _) => data.y,
                name: 'y = $yLine1',
                color: Colors.red,
                width: 2,
                dashArray: const <double>[5, 5],
              ),
              // Dotted line for y = yLine2
              LineSeries<_ChartData, int>(
                dataSource: [
                  _ChartData(0, yLine2),
                  _ChartData(ltpData.length - 1, yLine2),
                ],
                xValueMapper: (_ChartData data, _) => data.x,
                yValueMapper: (_ChartData data, _) => data.y,
                name: 'y = $yLine2',
                color: Colors.green,
                width: 2,
                dashArray: const <double>[5, 5],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChartData {
  final int x;
  final double y;

  _ChartData(this.x, this.y);
}
