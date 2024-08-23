import "package:walletwise/models/stock.dart";

class BoughtStock {
  String? date;
  Stock stock;
  double boughtAmount;
  double? currentAmount;
  int unit;

  //[
  //    'id' => 1,
  //    'stock' => [
  //        'id' => 1,
  //        'symbol' => 'PFL',
  //        'securityName' => 'Pokhara finance',
  //        'name' => 'Pokhara finanance',
  //    ],
  //    'date' => '2022/03/5',
  //    'unit' => 15,
  //    'amount' => 1200,
  //],

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
      String date = json['date'] as String? ?? '';
      int unit = json['no_of_units'] as int? ?? 0;
      double boughtAmount = (json['price'] as num? ?? 0).toDouble();
      return BoughtStock(
          stock: stock, date: date, unit: unit, boughtAmount: boughtAmount);
    } catch (e) {
      print("Fails to create the bouught stock form json");
      rethrow;
    }
  }
}
