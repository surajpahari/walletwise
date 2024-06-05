class Expense {
  int amount;
  String name;
  String category;
  Expense({required this.category, required this.amount, required this.name});
}

class RoutineExpense extends Expense {
  String frequency;
  String? lastPaidAt;

  RoutineExpense({
    required String category,
    required int amount,
    required String name,
    required this.frequency,
  }) : super(category: category, amount: amount, name: name);
}
