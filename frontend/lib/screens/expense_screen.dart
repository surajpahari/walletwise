import 'package:flutter/material.dart';
import 'package:walletwise/constants/app_colors.dart';
import 'package:walletwise/data/expense_data.dart';
import 'package:walletwise/utils/cards/budget_card.dart';
import 'package:walletwise/utils/charts/expense_bar.dart';
import 'package:walletwise/utils/forms/expense/daily_expense.dart';
import 'package:walletwise/utils/forms/expense/routine_expense.dart';
import 'package:walletwise/utils/tabs/tab.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({Key? key}) : super(key: key);

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ExpenseBarChart(
              color: Colors.red,
              expenses: [
                Expense(5, 'Food'),
                Expense(10, 'Transport'),
                Expense(7, 'Entertainment'),
                Expense(12, 'Utilities'),
                Expense(9, 'Others'),
                Expense(5, 'Food'),
                Expense(11, 'Transport'),
              ],
            ),
            Column(
              children: ExpenseData.budgetsList.map((budget) {
                return BudgetCard(budget: budget);
              }).toList(),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: () {
            showModalBottomSheet(
              sheetAnimationStyle:
                  AnimationStyle(duration: const Duration(seconds: 1)),
              useSafeArea: true,
              backgroundColor: AppColors.black,
              context: context,
              isScrollControlled: true,
              builder: (context) {
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
                            builder: (context) => const RoutineExpenseForm(),
                          ),
                        ),
                      ),
                    );
                  },
                );
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
