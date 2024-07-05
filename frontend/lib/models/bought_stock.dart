import "package:walletwise/models/stock.dart";

class BoughtStock {
  String date;
  Stock stock;
  double boughtAmount;
  double? currentAmount;
  int unit;

  BoughtStock(
      {required this.date,
      required this.stock,
      required this.boughtAmount,
      this.currentAmount,
      required this.unit});

  double calculateGain() {
    return 10.0;
  }

  double totalInvestment() {
    return unit * boughtAmount;
  }

  factory BoughtStock.fromJson(Map<String, dynamic> json) {
    try {
      Stock stock = Stock.fromJson(json['stock']);
      String date = json['date'];
      int unit = json['unit'] as int;
      double boughtAmount = (json['amount'] as num).toDouble();
      return BoughtStock(
          stock: stock, date: date, unit: unit, boughtAmount: boughtAmount);
    } catch (e) {
      print("Fails to create the bouught stock form json");
      rethrow;
    }
  }
}
