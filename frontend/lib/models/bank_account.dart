class BankAccount {
  int? id;
  String name;
  String? type;
  String? accountNumber;
  double amount;
  BankAccount(
      {this.id, required this.name, this.amount = 0, this.accountNumber});

  factory BankAccount.fromJson(Map<String, dynamic> json) {
    return BankAccount(
      id: json["id"] is int
          ? json["id"]
          : int.tryParse(json["id"].toString()) ?? 0,
      name: json['name'] as String,
      amount: json['amount'] is double
          ? json['amount']
          : double.tryParse(json['amount'].toString()) ?? 0.0,
      accountNumber: json['account_number'] as String,
    );
  }
  //factory BankAccount.fromJson(Map<String, dynamic> json) {
  //  return BankAccount(
  //    id: json["id"] as int,
  //    name: json['name'] as String,
  //    amount: json['amount'] as double,
  //    accountNumber: json['account_number'] as String,
  //  );
  //  }
}
