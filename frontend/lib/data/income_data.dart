import "package:walletwise/models/budgets.dart";
import "package:walletwise/models/category.dart";
import "package:walletwise/models/expense.dart";

class IncomeData {
  static List<Expense> expenseList = [
    Expense(amount: 480, category: 'food', name: "eggs")
  ];
  static List expenseBarTest = [];
  static List<Budget> budgetsList = [
    Budget(
      amount: 2000,
      category: Category(id: 2, category: 'Stocks'),
      duration: 'Oct-2',
    ),
    Budget(
      amount: 500,
      category: Category(id: 2, category: 'Freelancing'),
      duration: 'june-10',
    ),
    Budget(
      amount: 500,
      category: Category(id: 2, category: 'Home rent'),
      duration: 'june-10',
    ),
    Budget(
      amount: 500,
      category: Category(id: 2, category: 'Job'),
      duration: 'june-10',
    )
  ];
}
