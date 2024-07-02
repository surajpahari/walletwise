class Item {
  int id;
  String name;
  int amount;
  Item({this.id = 0, required this.amount, required this.name});

  factory Item.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'name': String name,
        'amount': int amount,
      } =>
        Item(name: name, amount: amount),
      _ => throw const FormatException('Failed to the budget.'),
    };
  }
}
