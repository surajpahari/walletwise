import "package:walletwise/models/item.dart";

class Category {
  String category;
  List<Item> items;
  int amount = 0;

  Category({required this.category, required this.items}) {
    amount = _calculateTotal();
  }

  int _calculateTotal() {
    int sum = 0;
    for (var item in items) {
      sum += item.amount;
    }
    return sum;
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    // if (json['amount'] == null || json['items'] == null) {
    //   throw const FormatException('Failed to parse the Category from JSON.');
    // }
    String category = json['category'];
    List<Item> items = (json['items'] as List<dynamic>)
        .map((itemJson) => Item.fromJson(itemJson as Map<String, dynamic>))
        .toList();

    return Category(category: category, items: items);
  }
}
