import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:walletwise/constants/app_colors.dart';
import 'package:walletwise/data/asset_debt_data.dart';
import 'package:walletwise/data/graph_data.dart';

class MyPieChart extends StatelessWidget {
  final List<PieData> data;
  int index = -1;
  MyPieChart(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Obx(() => PieChart(
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
                            color: getColor(++index),
                            radius: 30,
                          ))
                      .toList(),
                ),
                swapAnimationDuration: Duration(milliseconds: 150), // Optional
                swapAnimationCurve: Curves.linear,
              )),
          Text(
            data.fold(0.0, (sum, item) => sum + item.value).toString(),
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
    if (index == -1) {
      return Colors.red;
    }
    return AppColors.pieChartColors[index];
  }
}
