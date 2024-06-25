class ExpenseCategory {
  String name;
  int id;

  ExpenseCategory({required this.id, required this.name});

  factory ExpenseCategory.fromJson(Map<String, dynamic> json) {
    return ExpenseCategory(
      id: json["id"] is int
          ? json["id"]
          : int.tryParse(json["id"].toString()) ?? 0,
      name: json['name'] as String,
    );
  }
}
