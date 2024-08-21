class Item {
  String name;
  int amount;
  String? date;

  Item({required this.amount, required this.name, this.date});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      name: json['name'] as String? ?? '',
      amount: json['amount'] as int? ?? 0,
      date: json['date']
          as String?, // Assuming date is a String, adjust if needed
    );
  }
}
//  factory Item.fromJson(Map<String, dynamic> json) {
//    return Item(
//      id: json['id'] ?? 0,
//      name: json['name'] ?? '',
//      amount: json['amount'] ?? 0,
//      date: json['date'],
//    );
//  }
//}
