import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:walletwise/constants/app_colors.dart';
import 'package:walletwise/utils/charts/chart_data.dart';

class MyPieChart extends StatelessWidget {
  final List<PieData> data;
  const MyPieChart(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 4,
              borderData: FlBorderData(show: false),
              centerSpaceRadius: 60,
              sections: data
                  .map((item) => PieChartSectionData(
                        showTitle: false,
                        titleStyle: const TextStyle(color: Colors.white),
                        value: item.value,
                        title: item.name,
                        color: getColor(data.indexOf(item) + 1),
                        radius: 30,
                      ))
                  .toList(),
            ),
            swapAnimationDuration: Duration(milliseconds: 150), // Optional
            swapAnimationCurve: Curves.linear,
          ),
          Text(
            'Rs 1200',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Color getColor(int index) {
    if (index < 4) {
      return AppColors.pieChartColors[index - 1];
    } else {
      return Colors.white;
    }
  }
}
