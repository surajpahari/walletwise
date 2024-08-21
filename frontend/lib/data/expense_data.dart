import "package:get/get.dart";
import "package:walletwise/data/graph_data.dart";
import "package:walletwise/models/budgets.dart";
import "package:walletwise/models/category.dart";
import "package:walletwise/models/expense_category.dart";
import "package:walletwise/models/expense.dart";
import "package:walletwise/models/item.dart";

class ExpenseData {
  static void updateChart() {
    itemPieDataList.clear();
    fetchedItem.forEach((item) {
      itemPieDataList
          .add(PieData(name: item.name, value: item.amount.toDouble()));
    });
  }

  static List<Expense> expenseList = [
    Expense(amount: 480, category: 'food', name: "eggs")
  ];
  //all the available Category
  static List<ExpenseCategory> categoryList = [
    ExpenseCategory(name: "food", id: 3),
    ExpenseCategory(name: "food", id: 3),
  ];

  static RxList<Category> userCategoryList = <Category>[
    //Category.withAmount(category: "food", id: 3, amount: 400),
  ].obs;
  static RxList<PieData> itemPieDataList = <PieData>[].obs;
  static RxList<Category> detailedCategory = <Category>[].obs;
  static RxList<Item> fetchedItem = <Item>[].obs;
  static RxList<PieData> categoryPieData = [
    PieData(name: "Eggs", value: 200),
    PieData(name: "Eggs", value: 200),
    PieData(name: "Bread", value: 60),
    PieData(name: "Banana", value: 300)
  ].obs;
}
