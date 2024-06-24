import "package:walletwise/models/budgets.dart";
import "package:walletwise/models/category.dart";
import "package:walletwise/models/expense.dart";

class ExpenseData {
  static List<Expense> expenseList = [
    Expense(amount: 480, category: 'food', name: "eggs")
  ];
  static List<Budget> budgetsList = [
    Budget(
      amount: 2000,
      category: Category(id: 2, category: 'food'),
      duration: 'Oct-2',
    ),
    Budget(
      amount: 500,
      category: Category(id: 2, category: 'petrol'),
      duration: 'june-10',
    ),
    Budget(
      amount: 500,
      category: Category(id: 2, category: 'petrol'),
      duration: 'june-10',
    ),
    Budget(
      amount: 500,
      category: Category(id: 2, category: 'petrol'),
      duration: 'june-10',
    )
  ];
  static List<Category> categoryList = [
    Category(category: "food", id: 3),
    Category(category: "furniture", id: 3),
    Category(category: "entertainment", id: 3),
  ];
}
