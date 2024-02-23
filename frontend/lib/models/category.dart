import "package:walletwise/models/item.dart";

class Category {
  String category;
  List<Item> items = [];
  int amount = 0;
  int id;

  Category({required this.id, required this.category, this.items = const []}) {
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
    int id = json['id'].toInt();
    List<Item> items = (json['items'] as List<dynamic>)
        .map((itemJson) => Item.fromJson(itemJson as Map<String, dynamic>))
        .toList();
    return Category(id: id, category: category, items: items);
  }
}
