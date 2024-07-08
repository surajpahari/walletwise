import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:walletwise/constants/app_colors.dart';
import 'package:walletwise/controllers/budget/expense_controller.dart';
import 'package:walletwise/data/expense_data.dart';
import 'package:walletwise/utils/cards/item_card.dart';
import 'package:walletwise/utils/charts/indicator.dart';
import 'package:walletwise/utils/charts/pie_chart.dart';
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
    ExpenseController.fetchUserCategories();
    ExpenseController.fetchItemForCategory(widget.id);
    // Call getChartData function to get chart data
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
                  child: Obx(
                      () => CategoryPieChart(ExpenseData.detailedCategory[0])),
                ),
                Container(
                    constraints: BoxConstraints(maxWidth: 200),
                    child: Obx(() => Column(
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
                              color: AppColors.pieChartColors[index],
                              text: pieData.name,
                              textColor: AppColors.white,
                              isSquare: false,
                            );
                          }).toList(),
                        ))),

                const SizedBox(height: 20, width: 20),
                const Text(
                  "Last 32days",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Obx(() => Column(
                      children: ExpenseData.detailedCategory.isNotEmpty
                          ? ExpenseData.detailedCategory[0].items
                              .map((item) => ItemCard(
                                  title: item.name,
                                  amount: item.amount,
                                  total: item.amount,
                                  item: item))
                              .toList()
                          : [],
                    )),
                //Column(
                //  children: ExpenseData.fetchedItems[0]
                //      .map((item) => Padding(
                //            padding: const EdgeInsets.symmetric(vertical: 8.0),
                //            child: ItemCard(
                //              title: item
                //                  .name, // Change to appropriate property name
                //              amount: item.amount,
                //              total: widget
                //                  .total, // Pass the total from the widget
                //            ),
                //          ))
                //      .toList(),
                //)
              ],
            ),

            //FutureBuilder(
            //  future: BudgetController.getFullBudgets(widget.id),
            //  builder: (context, snapshot) {
            //    if (snapshot.connectionState == ConnectionState.waiting) {
            //      return const CircularProgressIndicator();
            //    } else if (snapshot.hasError) {
            //      return const Text(
            //        "An Error has occurred while fetching details",
            //        style: TextStyle(color: Colors.red),
            //      );
            //    } elkjkse {
            //      // Check if BudgetController.categories is not null and not empty
            //      if (BudgetController.categories.isNotEmpty) {
            //        return Column(
            //          children: BudgetController.categories[0].items
            //              .map((item) => Padding(
            //                    padding:
            //                        const EdgeInsets.symmetric(vertical: 8.0),
            //                    child: ItemCard(
            //                      title: item
            //                          .name, // Change to appropriate property name
            //                      amount: item.amount,
            //                      total: widget
            //                          .total, // Pass the total from the widget
            //                    ),
            //                  ))
            //              .toList(),
            //        );
            //      } else {
            //        return const Text(
            //          "No data available",
            //          style: TextStyle(color: Colors.white),
            //        );
            //      }
            //    }
            //  },
            //),
          ],
        ),
      ),
    );
  }
}
