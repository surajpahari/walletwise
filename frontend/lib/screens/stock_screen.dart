import 'package:flutter/material.dart';
import 'package:walletwise/utils/cards/stock_card.dart';
import 'package:walletwise/data/stock_search_result.dart';
import 'package:get/get.dart';
import 'package:walletwise/screens/stock_detail.dart';
import 'package:walletwise/controllers/stocks/stock_search_controller.dart';
import 'package:walletwise/theme/theme_constant.dart';

class StockScreen extends StatefulWidget {
  const StockScreen({super.key});

  @override
  State<StockScreen> createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  @override
  void initState() {
    super.initState();
    if (StockData.hotStock.isEmpty) {
      print("fetching stock data");
      StockController.fetchRandomStocks();
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = StockController();
    return Theme(
      data: myTheme,
      child: Scaffold(
        body: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Text(
                  "Stocks",
                  style: TextStyle(fontSize: 26.0),
                  textAlign: TextAlign.center,
                )),
                Icon(Icons.search)
              ],
            ),
            Expanded(
              child: Obx(
                () => SingleChildScrollView(
                  child: Wrap(
                    children: StockData.hotStock.asMap().entries.map((entry) {
                      return Column(
                        children: [StockCard(stock: entry.value)],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FloatingActionButton(
            onPressed: () => {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                            onChanged: (value) {
                              controller.onChange(value);
                            },
                            controller: controller.searchQuery,
                            style: const TextStyle(
                                color: Colors.white), // Text color
                            decoration: InputDecoration(
                              labelText: "Search for stock",
                              labelStyle: const TextStyle(
                                  color: Colors.white), // Label color
                              prefixIcon: const Icon(Icons.search,
                                  color: Colors.white), // Icon color
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.white), // Border color
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Suggestions:",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black, // Text color
                            ),
                          ),
                          const SizedBox(height: 10),
                          Obx(
                            () {
                              return Expanded(
                                  child: ListView.builder(
                                itemCount: StockData.searchList.length,
                                itemBuilder: (context, index) {
                                  final suggestion =
                                      StockData.searchList[index];
                                  return ListTile(
                                    title: Text(
                                      suggestion.name,
                                      style: const TextStyle(
                                          color: Colors.black), // Text color
                                    ),
                                    onTap: () {
                                      Get.to(StockDetail(
                                        stock: suggestion,
                                      ));
                                      // Handle selection of suggestion
                                    },
                                  );
                                },
                              ));
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            },
            child: const Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
