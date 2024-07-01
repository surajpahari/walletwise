import "package:walletwise/models/budgets.dart";
import "package:walletwise/models/category.dart";
import "package:walletwise/models/expense.dart";
import "package:walletwise/models/expense_category.dart";

class ExpenseData {
  static List<Expense> expenseList = [
    Expense(amount: 480, category: 'food', name: "eggs")
  ];
  static List<Budget> budgetsList = [
    Budget(
      amount: 2000,
      category: Category.withAmount(id: 2, category: 'food'),
      duration: 'Oct-2',
    ),
    Budget(
      amount: 500,
      category: Category.withAmount(id: 2, category: 'petrol'),
      duration: 'june-10',
    ),
    Budget(
      amount: 500,
      category: Category.withAmount(id: 2, category: 'petrol'),
      duration: 'june-10',
    ),
    Budget(
      amount: 500,
      category: Category.withAmount(id: 2, category: 'petrol'),
      duration: 'june-10',
    )
  ];
  //static List<ExpenseCategory> categoryList = [
  //  ExpenseCategory(name: "food", id: 3),
  //  ExpenseCategory(name: "food", id: 3),
  //];
  static List<Category> categoryList = [
    Category.withAmount(category: "food", id: 10, amount: 100),
    Category.withAmount(category: "transportation", id: 10, amount: 1000),
    Category.withAmount(category: "home rent", id: 10, amount: 2000),
    Category.withAmount(category: "free lancing", id: 10, amount: 20)
  ];
}
