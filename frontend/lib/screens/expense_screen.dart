import 'package:flutter/material.dart';
import 'package:walletwise/constants/app_colors.dart';
import 'package:get/get.dart';
import 'package:walletwise/controllers/budget/expense_controller.dart';
import 'package:walletwise/data/expense_data.dart';
import 'package:walletwise/utils/cards/budget_card.dart';
import 'package:walletwise/utils/charts/expense_bar.dart';
import 'package:walletwise/utils/forms/expense/daily_expense.dart';
import 'package:walletwise/utils/forms/expense/routine_expense.dart';
import 'package:walletwise/controllers/sheetController.dart';
import 'package:walletwise/utils/inputs/range_dropdown2.dart';

import 'package:walletwise/utils/tabs/tab.dart';

class ExpenseScreen extends StatefulWidget {
  final SheetController sheetController = Get.put(SheetController());
  ExpenseScreen({Key? key}) : super(key: key);

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  @override
  void initState() {
    super.initState();
    ExpenseController.fetchUserCategories();
    ExpenseController.fetchExpenseCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(6),
              child: DropdownButtonExample(),
            ),
            //const Text(
            //  "Total:25000",
            //  textAlign: TextAlign.center,
            //),
            ExpenseBarChart(
              color: Color(0xFF8B0000),
              categories: ExpenseData.userCategoryList,
            ),
            Obx(() => Wrap(
                  alignment: WrapAlignment.end,
                  children: ExpenseData.userCategoryList
                      .asMap()
                      .entries
                      .map((entry) => Column(
                            children: [BudgetCard(category: entry.value)],
                          ))
                      .toList(),
                ))
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FloatingActionButton(
          backgroundColor: Colors.red[900],
          onPressed: () {
            showModalBottomSheet(
              sheetAnimationStyle:
                  AnimationStyle(duration: const Duration(seconds: 1)),
              useSafeArea: true,
              backgroundColor: AppColors.black,
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return Obx(() {
                  if (widget.sheetController.expenseSheetDismiss.value) {
                    Navigator.pop(context); // Dismiss the sheet
                    widget.sheetController.expenseSheetDismiss.value = false;
                  }
                  {
                    return DraggableScrollableSheet(
                      expand: false,
                      initialChildSize: 0.8, // Adjust this value as needed
                      maxChildSize: 0.8, // Adjust this value as needed
                      minChildSize: 0.5, // Adjust this value as needed
                      builder: (context, scrollController) {
                        return Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: SingleChildScrollView(
                            controller: scrollController,
                            child: WwTab(
                              tab1: 'daily',
                              tab2: 'routine',
                              tab1Screen: Builder(
                                builder: (context) => const DailyExpenseForm(),
                              ),
                              tab2Screen: Builder(
                                builder: (context) =>
                                    const RoutineExpenseForm(),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                });
              },
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
