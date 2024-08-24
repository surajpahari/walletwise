import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletwise/controllers/budget/expense_controller.dart';
import 'package:walletwise/constants/app_colors.dart';
import 'package:walletwise/controllers/budget/income_contorller.dart';
import 'package:walletwise/data/expense_data.dart';
import 'package:walletwise/data/income_data.dart';
import 'package:walletwise/utils/cards/item_card.dart';
import 'package:walletwise/utils/charts/indicator.dart';
import 'package:walletwise/utils/charts/piecharts/category_pie_chart.dart';

class IncomeCategoryScreen extends StatefulWidget {
  final String category;
  final int total;
  final int id;

  const IncomeCategoryScreen(
      {Key? key, required this.category, required this.id, required this.total})
      : super(key: key);

  @override
  _IncomeCategoryScreenState createState() => _IncomeCategoryScreenState();
}

class _IncomeCategoryScreenState extends State<IncomeCategoryScreen> {
  @override
  void initState() {
    super.initState();
    // Call appropriate methods to fetch data if needed
    // Example:
    // ExpenseController.fetchUserCategories();
    IncomeController.fetchItemForCategory(widget.id);
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
                  constraints: const BoxConstraints(maxWidth: 200),
                  child: Obx(() {
                    // Ensure detailedCategory has at least one element
                    if (IncomeData.itemPieDataList.isNotEmpty) {
                      return CategoryPieChart(
                          IncomeData.itemPieDataList, widget.total);
                    } else {
                      return const Center(
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
                  if (IncomeData.fetchedItem.isNotEmpty) {
                    return Column(
                      children: IncomeData.fetchedItem
                          .map((item) => ItemCard(
                              item: item,
                              title: item.name,
                              amount: item.amount,
                              date: item.date ?? ''))
                          .toList(),
                    );
                  } else {
                    return const Center(
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
