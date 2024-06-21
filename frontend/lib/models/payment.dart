class Payment {
  int id;
  String name;
  double amount;
  double savings;
  int due;

  Payment({
    required this.id,
    required this.name,
    required this.amount,
    required this.savings,
    required this.due,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['id'] is int
          ? json['id']
          : int.tryParse(json['id'].toString()) ?? 0,
      name: json['name'] as String,
      amount: json['amount'] is double
          ? json['amount']
          : double.tryParse(json['amount'].toString()) ?? 0.0,
      savings: json['savings'] is double
          ? json['savings']
          : double.tryParse(json['savings'].toString()) ?? 0.0,
      due: json['due'] is int
          ? json['due']
          : int.tryParse(json['due'].toString()) ?? 0,
    );
  }
}
