import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:walletwise/constants/app_colors.dart';
import 'package:walletwise/models/category.dart';

class CategoryGraphData {
  final double amount;
  final String category;

  CategoryGraphData(this.amount, this.category);
}

class CategoryGraphChart extends StatelessWidget {
  final List<Category> expenses;
  final Color color;

  CategoryGraphChart({required this.expenses, required this.color});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1.2,
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          color: AppColors.black,
          child: Padding(
            padding: const EdgeInsets.all(1),
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: expenses
                        .map((e) => e.amount)
                        .reduce((a, b) => a > b ? a : b) +
                    10,
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
                    topTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (double value, title) {
                          switch (value.toInt()) {
                            case 0:
                              return Text('Sun');
                            case 1:
                              return Text('Mon');
                            case 2:
                              return Text('Tue');
                            case 3:
                              return Text('Wes');
                            case 4:
                              return Text('Thu');
                            case 5:
                              return Text('Fir');
                            case 6:
                              return Text('Sat');
                            default:
                              return Text('');
                          }
                        },
                      ),
                    )),
                barGroups: expenses.asMap().entries.map((entry) {
                  final index = entry.key;
                  final expense = entry.value;
                  return BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: expense.amount,
                        color: color,
                        width: 22,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ));
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
