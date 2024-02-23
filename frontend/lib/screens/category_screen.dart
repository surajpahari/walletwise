import 'package:flutter/material.dart';
import 'package:walletwise/controllers/budget/budget_controller.dart';
import 'package:walletwise/utils/cards/item_card.dart';

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
                Padding(
                  padding: const EdgeInsets.all(50),
                  child: Text(
                    "Error loading PieChart",
                    style: TextStyle(color: Colors.white),
                  ),

                  // child: chartData.isNotEmpty
                  //     ? MyPieChart(chartData)
                  //     : Text(
                  //         "Error loading the pie chart",
                  //         style: TextStyle(color: Colors.white),
                  //       ), // Render chart only when data is available
                ),
                const SizedBox(height: 20, width: 20),
                const Text(
                  "Nov-20 to Nov-30",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )
              ],
            ),
            FutureBuilder(
              future: BudgetController.getFullBudgets(widget.id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return const Text(
                    "An Error has occurred while fetching details",
                    style: TextStyle(color: Colors.red),
                  );
                } else {
                  // Check if BudgetController.categories is not null and not empty
                  if (BudgetController.categories.isNotEmpty) {
                    return Column(
                      children: BudgetController.categories[0].items
                          .map((item) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: ItemCard(
                                  title: item
                                      .name, // Change to appropriate property name
                                  amount: item.amount,
                                  total: widget
                                      .total, // Pass the total from the widget
                                ),
                              ))
                          .toList(),
                    );
                  } else {
                    return const Text(
                      "No data available",
                      style: TextStyle(color: Colors.white),
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
