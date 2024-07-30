class Debt {
  double amount;
  String name;
  Debt({required this.name, required this.amount});
  factory Debt.fromJson(Map<String, dynamic> json) {
    return Debt(
      name: json['name'] as String,
      amount: json['amount'] is double
          ? json['amount']
          : double.tryParse(json['amount'].toString()) ?? 0.0,
    );
  }
}
