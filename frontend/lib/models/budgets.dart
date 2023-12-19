class Budget {
  String category;
  int amount;
  Budget({required this.category, required this.amount});

  factory Budget.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'category': String category,
        'amount': int amount,
      } =>
        Budget(
          category: category,
          amount: amount,
        ),
      _ => throw const FormatException('Failed to the budget.'),
    };
  }
}
