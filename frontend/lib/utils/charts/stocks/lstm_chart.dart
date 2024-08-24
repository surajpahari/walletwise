import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LstmGraph extends StatelessWidget {
  final List<double> ltpData; // Dynamic LTP data
  LstmGraph({required this.ltpData, Key? key});

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
                color: Colors.orange,
                enableTooltip: true, // Enable tooltip for this series
              ),
              // Dotted line for y = yLine1
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
