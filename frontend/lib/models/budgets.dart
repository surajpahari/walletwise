import 'package:walletwise/models/category.dart';

class Budget {
  Category category;
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
        'id': int id,
      } =>
        Budget(
            category: Category.withAmount(id: id, category: category),
            amount: amount,
            duration: duration),
      _ => throw const FormatException('Failed to the budget.'),
    };
  }
}
