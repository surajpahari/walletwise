class IncomeCategory {
  String name;
  int id;

  IncomeCategory({required this.id, required this.name});

  factory IncomeCategory.fromJson(Map<String, dynamic> json) {
    return IncomeCategory(
      id: json["id"] is int
          ? json["id"]
          : int.tryParse(json["id"].toString()) ?? 0,
      name: json['name'] as String,
    );
  }
}
