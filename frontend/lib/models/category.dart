import "package:walletwise/models/item.dart";

class Category {
  final int id;
  final String category;
  final List<Item> items;
  final double amount;

  // Private constructor
  // Named constructor for items
  Category.withItems(
      {required this.id, required this.category, required this.items})
      : amount = _calculateTotal(items);

  // Named constructor for amount
  Category.withAmount(
      {required this.id, required this.category, this.amount = 0.0})
      : items = const [];

  // Method to calculate total amount from items
  static double _calculateTotal(List<Item> items) {
    // Replace with your actual calculation logic
    return items.fold(0, (total, item) => total + item.amount);
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    // if (json['amount'] == null || json['items'] == null) {
    //   throw const FormatException('Failed to parse the Category from JSON.');
    // }
    String category = json['category'];
    int id = json['id'].toInt();
    List<Item> items = (json['items'] as List<dynamic>)
        .map((itemJson) => Item.fromJson(itemJson as Map<String, dynamic>))
        .toList();
    return Category.withItems(id: id, category: category, items: items);
  }
}
