import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:walletwise/data/graph_data.dart';
import 'package:intl/intl.dart';

class WwLineChart extends StatefulWidget {
  const WwLineChart({super.key});

  @override
  State<WwLineChart> createState() => _WwLineChartState();
}

class _WwLineChartState extends State<WwLineChart> {
  late List<DateAmountGraphData> data;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Generate the full list of data points with step-like effect
    List<FlSpot> spots = _generateSpots(data);

    return AspectRatio(
      aspectRatio: 1.5,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
                barWidth: 3,
                color: Colors.pink,
                spots: spots,
                isCurved: false,
                isStrokeCapRound: true,
                belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    colors: [
                      Colors.pink.withOpacity(0.5),
                      Colors.pink.withOpacity(0.0),
                    ],
                    stops: [0.5, 1.0],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                )),
          ],
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 42,
                getTitlesWidget: (value, titleMeta) {
                  DateTime date =
                      DateTime.fromMillisecondsSinceEpoch(value.toInt());
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      DateFormat('MM/dd').format(date),
                      style: const TextStyle(fontSize: 10),
                    ),
                  );
                },
              ),
            ),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(
              color: const Color(0xff37434d),
            ),
          ),
          gridData: FlGridData(show: false),
        ),
      ),
    );
  }

  List<FlSpot> _generateSpots(List<DateAmountGraphData> data) {
    List<FlSpot> spots = [];
    for (int i = 0; i < data.length; i++) {
      DateAmountGraphData current = data[i];
      DateTime currentDate = DateTime.parse(current.date.replaceAll('/', '-'));
      double xValue = currentDate.millisecondsSinceEpoch.toDouble();
      double yValue = current.amount;

      spots.add(FlSpot(xValue, yValue));

      if (i < data.length - 1) {
        DateAmountGraphData next = data[i + 1];
        DateTime nextDate = DateTime.parse(next.date.replaceAll('/', '-'));
        DateTime dayBeforeNext = nextDate.subtract(Duration(days: 1));
        double xValueDayBeforeNext =
            dayBeforeNext.millisecondsSinceEpoch.toDouble();

        spots.add(FlSpot(xValueDayBeforeNext, yValue));
      }
    }
    return spots;
  }
}
//class WwLineCharts extends StatelessWidget {
//  const WwLineChart({required this.data, super.key});
//  final RxList<DateAmountGraphData> data;
//
//  @override
//  Widget build(BuildContext context) {
//    // Generate the full list of data points with step-like effect
//    List<FlSpot> spots = _generateSpots(data);
//
//    return AspectRatio(
//      aspectRatio: 1.5,
//      child: LineChart(
//        LineChartData(
//          lineBarsData: [
//            LineChartBarData(
//                barWidth: 3,
//                color: Colors.pink,
//                spots: spots,
//                isCurved: false,
//                isStrokeCapRound: true,
//                belowBarData: BarAreaData(
//                  show: true,
//                  gradient: LinearGradient(
//                    colors: [
//                      Colors.pink.withOpacity(0.5),
//                      Colors.pink.withOpacity(0.0),
//                    ],
//                    stops: [0.5, 1.0],
//                    begin: Alignment.topCenter,
//                    end: Alignment.bottomCenter,
//                  ),
//                )),
//          ],
//          titlesData: FlTitlesData(
//            bottomTitles: AxisTitles(
//              sideTitles: SideTitles(
//                showTitles: true,
//                reservedSize: 42,
//                getTitlesWidget: (value, titleMeta) {
//                  DateTime date =
//                      DateTime.fromMillisecondsSinceEpoch(value.toInt());
//                  return Padding(
//                    padding: const EdgeInsets.only(top: 8.0),
//                    child: Text(
//                      DateFormat('MM/dd').format(date),
//                      style: const TextStyle(fontSize: 10),
//                    ),
//                  );
//                },
//              ),
//            ),
//            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//          ),
//          borderData: FlBorderData(
//            show: true,
//            border: Border.all(
//              color: const Color(0xff37434d),
//            ),
//          ),
//          gridData: FlGridData(show: false),
//        ),
//      ),
//    );
//  }
//
//  List<FlSpot> _generateSpots(List<DateAmountGraphData> data) {
//    List<FlSpot> spots = [];
//    for (int i = 0; i < data.length; i++) {
//      DateAmountGraphData current = data[i];
//      DateTime currentDate = DateTime.parse(current.date.replaceAll('/', '-'));
//      double xValue = currentDate.millisecondsSinceEpoch.toDouble();
//      double yValue = current.amount;
//
//      spots.add(FlSpot(xValue, yValue));
//
//      if (i < data.length - 1) {
//        DateAmountGraphData next = data[i + 1];
//        DateTime nextDate = DateTime.parse(next.date.replaceAll('/', '-'));
//        DateTime dayBeforeNext = nextDate.subtract(Duration(days: 1));
//        double xValueDayBeforeNext =
//            dayBeforeNext.millisecondsSinceEpoch.toDouble();
//
//        spots.add(FlSpot(xValueDayBeforeNext, yValue));
//      }
//    }
//    return spots;
//  }
//}
