import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletwise/controllers/state/history_controller.dart';
import 'package:walletwise/screens/expense_screen.dart';
import 'package:walletwise/screens/income_screen.dart';
import 'package:walletwise/screens/stock_record.dart';
import 'package:walletwise/screens/transaction_record.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({Key? key}) : super(key: key);

  final HistoryController controller = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          elevation: 0.0,
          automaticallyImplyLeading: false,
          title: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      controller.selectTab(0);
                    },
                    child: Obx(() => Container(
                          width: 120, // Set a fixed width here
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: controller.selectedIndex.value == 0
                                ? Colors.purple
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Center(
                            child: Text(
                              "Transaction",
                              style: TextStyle(
                                color: controller.selectedIndex.value == 0
                                    ? Colors.white
                                    : Colors.grey[400],
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      controller.selectTab(1);
                    },
                    child: Obx(() => Container(
                          width: 120, // Set a fixed width here
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: controller.selectedIndex.value == 1
                                ? Colors.purple
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Center(
                            child: Text(
                              "Stocks",
                              style: TextStyle(
                                color: controller.selectedIndex.value == 1
                                    ? Colors.white
                                    : Colors.grey[400],
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Obx(() {
          switch (controller.selectedIndex.value) {
            case 0:
              return TransactionScreen();
            case 1:
              return StockRecord();
            default:
              return Container();
          }
        }),
      ),
    );
  }
}
