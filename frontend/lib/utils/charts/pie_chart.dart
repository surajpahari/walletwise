import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:walletwise/utils/charts/chart_data.dart';

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
                    titleStyle: const TextStyle(color: Colors.white),
                    value: item.value,
                    title: item.name,
                    color: getColor(data.indexOf(item) + 1),
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
        return Colors.green;
      case 1:
        return Colors.green;
      case 2:
        return Colors.purple;
      case 3:
        return Colors.orange;
      default:
        return Colors.black;
    }
  }
}
