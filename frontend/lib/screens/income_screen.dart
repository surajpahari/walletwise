import 'package:flutter/material.dart';
import 'package:walletwise/controllers/budget/budget_controller.dart';
import 'package:walletwise/data/expense_data.dart';
import 'package:walletwise/data/income_data.dart';
import 'package:walletwise/utils/cards/budget_card.dart';
import 'package:walletwise/utils/cards/income_card.dart';
import 'package:walletwise/utils/forms/expense_form.dart';
import 'package:walletwise/utils/charts/expense_bar.dart';

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
            showDialog(
                context: context,
                builder: (context) {
                  return (Theme(
                      data: ThemeData.dark(),
                      child: AlertDialog(content: ExpenseForm())));
                })
          },
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
