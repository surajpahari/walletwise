class Budget {
  String category;
  int amount;
  String duration;
  Budget(
      {required this.category, required this.amount, required this.duration});

  factory Budget.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'category': String category,
        'amount': int amount,
        'duration': String duration,
      } =>
        Budget(category: category, amount: amount, duration: duration),
      _ => throw const FormatException('Failed to the budget.'),
    };
  }
}
