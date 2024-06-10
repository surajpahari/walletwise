import 'package:flutter/material.dart';
import 'package:walletwise/controllers/budget/budget_controller.dart';
import 'package:walletwise/data/expense_data.dart';
import 'package:walletwise/utils/cards/budget_card.dart';
import 'package:walletwise/utils/forms/expense_form.dart';
import 'package:walletwise/utils/charts/expense_bar.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({Key? key}) : super(key: key);

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[900],
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
      )),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FloatingActionButton(
          backgroundColor: Colors.red,
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
