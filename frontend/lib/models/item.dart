class Item {
  int id;
  String name;
  int amount;
  String? date;

  Item({this.id = 0, required this.amount, required this.name, this.date});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      amount: json['amount'] ?? 0,
      date: json['date'],
    );
  }
}
