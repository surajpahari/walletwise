class Assets {
  double amount;
  String name;
  Assets({required this.name, required this.amount});
  factory Assets.fromJson(Map<String, dynamic> json) {
    return Assets(
      name: json['name'] as String,
      amount: json['amount'] is double
          ? json['amount']
          : double.tryParse(json['amount'].toString()) ?? 0.0,
    );
  }
}
