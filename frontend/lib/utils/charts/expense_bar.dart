import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:walletwise/constants/app_colors.dart';
import 'package:walletwise/models/category.dart';

class ExpenseBarChart extends StatelessWidget {
  final RxList<Category> categories;
  final Color color;

  ExpenseBarChart({required this.categories, required this.color});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1.2,
        child: Card(
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            color: AppColors.black,
            child: Padding(
              padding: const EdgeInsets.all(1),
              child: Obx(
                () => BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY: categories
                            .map((e) => e.amount)
                            .reduce((a, b) => a > b ? a : b) +
                        10.0,
                    barTouchData: BarTouchData(
                      touchTooltipData: BarTouchTooltipData(
                        tooltipBgColor: Colors.blueGrey,
                        getTooltipItem: (group, groupIndex, rod, rodIndex) {
                          return BarTooltipItem(
                            '${rod.toY}',
                            TextStyle(color: Colors.yellow),
                          );
                        },
                      ),
                    ),
                    titlesData: FlTitlesData(
                        show: true,
                        topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (double value, title) {
                              return Text(categories[value.toInt()].category);
                            },
                            //getTitlesWidget: (double value, title) {
                            //  switch (value.toInt()) {
                            //    case 0:
                            //      return Text('Sun');
                            //    case 1:
                            //      return Text('Mon');
                            //    case 2:
                            //      return Text('Tue');
                            //    case 3:
                            //      return Text('Wes');
                            //    case 4:
                            //      return Text('Thu');
                            //    case 5:
                            //      return Text('Fir');
                            //    case 6:
                            //      return Text('Sat');
                            //    default:
                            //      return Text('');
                            //  }
                            //},
                          ),
                        )),
                    barGroups: categories.asMap().entries.map((entry) {
                      final index = entry.key;
                      final category = entry.value;
                      return BarChartGroupData(
                        x: index,
                        barRods: [
                          BarChartRodData(
                            toY: category.amount.toDouble(),
                            color: getColor(index),
                            width: 30,
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            )));
  }

  Color getColor(int index) {
    if (index == -1) {
      return Colors.red;
    }
    return AppColors.pieChartColors[index];
  }

  Color getCategoryColor(String category) {
    switch (category) {
      case 'Food':
        return Colors.green;
      case 'Transport':
        return Colors.green;
      case 'Entertainment':
        return Colors.green;
      case 'Utilities':
        return Colors.green;
      case 'Others':
        return Colors.green;
      default:
        return Colors.green;
    }
  }
}
