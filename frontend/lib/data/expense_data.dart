import "package:get/get.dart";
import "package:walletwise/data/graph_data.dart";
import "package:walletwise/models/budgets.dart";
import "package:walletwise/models/category.dart";
import "package:walletwise/models/expense_category.dart";
import "package:walletwise/models/expense.dart";
import "package:walletwise/models/item.dart";

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
  //all the available Category
  static List<ExpenseCategory> categoryList = [
    ExpenseCategory(name: "food", id: 3),
    ExpenseCategory(name: "food", id: 3),
  ];

  static RxList<Category> userCategoryList = <Category>[
    Category.withAmount(category: "food", id: 3, amount: 400),
  ].obs;

  static RxList<Category> detailedCategory = <Category>[].obs;
  static List<List<Item>> fetchedItems = [
    [
      Item(id: 1, amount: 200, name: 'Eggs'),
      Item(id: 2, amount: 60, name: 'Bread'),
      Item(id: 3, amount: 100, name: 'Banana'),
    ],
  ];
  static RxList<PieData> categoryPieData = [
    PieData(name: "Eggs", value: 200),
    PieData(name: "Eggs", value: 200),
    PieData(name: "Bread", value: 60),
    PieData(name: "Banana", value: 300)
  ].obs;
}
