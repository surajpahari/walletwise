class Item {
  String name;
  int amount;
  Item({required this.amount, required this.name});

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
