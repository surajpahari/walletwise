import "package:walletwise/data/graph_data.dart";
import "package:walletwise/models/item.dart";

class Category {
  final int id;
  final String category;
  final List<Item> items;
  final double amount;
  final List<PieData> pieData = [];

  // Private constructor
  // Named constructor for items
  Category.withItems({
    required this.id,
    required this.category,
    required this.items,
  }) : amount = _calculateTotal(items);

  // Named constructor for amount
  Category.withAmount(
      {required this.id, required this.category, this.amount = 0.0})
      : items = const [];

  // Method to calculate total amount from items
  static double _calculateTotal(List<Item> items) {
    // Replace with your actual calculation logic
    return items.fold(0, (total, item) => total + item.amount);
  }

  factory Category.fromItemsJson(Map<String, dynamic> json) {
    String category = json['category'];
    int id = json['id'] as int? ?? 0;
    List<Item> items = (json['items'] as List<dynamic>)
        .map((itemJson) => Item.fromJson(itemJson as Map<String, dynamic>))
        .toList();
    return Category.withItems(id: id, category: category, items: items);
  }

  factory Category.fromAmountJson(Map<String, dynamic> json) {
    String category = json['category'] as String? ?? "";
    int id = json['id'] as int? ?? 0;
    int amount = json['amount'] as int? ?? 0;

    return Category.withAmount(
        id: id, category: category, amount: amount.toDouble());
  }
  List<PieData> getPieData() {
    // Replace with your actual calculation logic
    if (items.isNotEmpty) {
      //return <PieData>[PieData(name: "hell", value: 200)];
      return items.map((item) {
        return PieData(value: item.amount.toDouble(), name: item.name);
      }).toList();
    } else {
      print("hell");

      return <PieData>[PieData(name: "hell", value: 200)];
    }
  }
}
