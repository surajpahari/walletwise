import "dart:convert";

import "package:walletwise/models/stock.dart";

class BoughtStock {
  String date;
  Stock stock;
  double amount;
  int unit;

  BoughtStock(
      {required this.date,
      required this.stock,
      required this.amount,
      required this.unit});

  factory BoughtStock.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'unit': int unit,
        'amount': double amount,
        'date': String date,
        'securityName': String securityName,
        'name': String name,
      } =>
        BoughtStock(
          amount: amount,
          date: date,
          unit: unit,
          stock: Stock(id: 12, symbol: "pf", securityName: "pf", name: "f"),
        ),
      _ => throw const FormatException('Failed to the budget.'),
    };
  }
}
