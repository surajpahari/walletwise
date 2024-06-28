import 'package:flutter/material.dart';
import 'package:walletwise/constants/app_colors.dart';
import 'package:walletwise/utils/forms/income/daily_income.dart';
import 'package:walletwise/utils/tabs/tab.dart';
import 'package:walletwise/data/income_data.dart';
import 'package:walletwise/utils/cards/income_card.dart';
import 'package:walletwise/utils/charts/expense_bar.dart';
import 'package:walletwise/utils/forms/income/routine_income.dart';

class IncomeScreen extends StatefulWidget {
  const IncomeScreen({Key? key}) : super(key: key);

  @override
  State<IncomeScreen> createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
          child: Column(
        children: [
          ExpenseBarChart(
            color: Colors.green,
            expenses: [
              Expense(5, 'Food'),
              Expense(10, 'Transport'),
              Expense(30000, 'Entertainment'),
              Expense(12, 'Utilities'),
              Expense(9, 'Others'),
              Expense(5, 'Food'),
              Expense(11, 'Transport'),
            ],
          ),
          Column(
            children: IncomeData.budgetsList.map((budget) {
              return IncomeCard(budget: budget);
            }).toList(),
          ),
        ],
      )),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () => {
            showModalBottomSheet(
              //if isclosed is true i want to close this sheet
              useSafeArea: true,
              backgroundColor: AppColors.black,
              context: context,
              isScrollControlled:
                  true, // Ensures the bottom sheet can adjust height
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context)
                        .viewInsets
                        .bottom, // Adjusts for keyboard
                  ),
                  child: WwTab(
                    tab1: 'daily',
                    tab2: 'routine',
                    tab1Screen: Builder(
                      builder: (context) => const DailyIncomeForm(),
                    ),
                    tab2Screen: Builder(
                      builder: (context) => const RoutineIncomeForm(),
                    ),
                  ),
                );
              },
            )
          },
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
