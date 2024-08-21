import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletwise/constants/app_colors.dart';
import 'package:walletwise/data/expense_data.dart';
import 'package:walletwise/utils/cards/item_card.dart';
import 'package:walletwise/utils/charts/indicator.dart';
import 'package:walletwise/utils/charts/piecharts/category_pie_chart.dart';

class CategoryScreen extends StatefulWidget {
  final String category;
  final int total;
  final int id;

  const CategoryScreen(
      {Key? key, required this.category, required this.id, required this.total})
      : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    super.initState();
    // Call appropriate methods to fetch data if needed
    // Example:
    // ExpenseController.fetchUserCategories();
    // ExpenseController.fetchItemForCategory(widget.id);
    // For debugging, ensure that accessing ExpenseData does not throw an error
    if (ExpenseData.userCategoryList.isNotEmpty) {
      print(ExpenseData.userCategoryList[0]);
    } else {
      print('No user categories available.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
      ),
      backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                Text(
                  "Total: Rs ${widget.total}",
                  style: const TextStyle(color: Colors.white, fontSize: 30.0),
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: 200),
                  child: Obx(() {
                    // Ensure detailedCategory has at least one element
                    if (ExpenseData.detailedCategory.isNotEmpty) {
                      return CategoryPieChart(ExpenseData.detailedCategory[0]);
                    } else {
                      return Center(
                        child: Text('No pie chart data available'),
                      );
                    }
                  }),
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: 200),
                  child: Obx(() {
                    // Ensure detailedCategory and getPieData are not empty
                    if (ExpenseData.detailedCategory.isNotEmpty &&
                        ExpenseData.detailedCategory[0]
                            .getPieData()
                            .isNotEmpty) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: ExpenseData.detailedCategory[0]
                            .getPieData()
                            .asMap()
                            .entries
                            .map((entry) {
                          int index = entry.key;
                          var pieData = entry.value;
                          return Indicator(
                            color: AppColors.pieChartColors[index %
                                AppColors.pieChartColors
                                    .length], // Ensure index is within bounds
                            text: pieData.name,
                            textColor: AppColors.white,
                            isSquare: false,
                          );
                        }).toList(),
                      );
                    } else {
                      return Center(
                        child: Text('No pie chart data available'),
                      );
                    }
                  }),
                ),
                const SizedBox(height: 20, width: 20),
                const Text(
                  "Last 32 days",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Obx(() {
                  // Ensure detailedCategory and items are not empty
                  if (ExpenseData.detailedCategory.isNotEmpty &&
                      ExpenseData.detailedCategory[0].items.isNotEmpty) {
                    return Column(
                      children: ExpenseData.detailedCategory[0].items
                          .map((item) => ItemCard(
                              title: item.name,
                              amount: item.amount,
                              total: item.amount,
                              item: item))
                          .toList(),
                    );
                  } else {
                    return Center(
                      child: Text('No items available'),
                    );
                  }
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
