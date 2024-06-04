class Stock {
  int id;
  String symbol;
  String securityName;
  String name;
  CurrentData? currentData;
  Stock({
    required this.id,
    required this.symbol,
    required this.securityName,
    required this.name,
    this.currentData,
  });
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'symbol': symbol,
      'securityName': securityName,
      'name': name,
    };
  }

  factory Stock.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'symbol': String symbol,
        'securityName': String securityName,
        'name': String name,
      } =>
        Stock(
          id: id,
          symbol: symbol,
          securityName: securityName,
          name: name,
        ),
      _ => throw const FormatException('Failed to the budget.'),
    };
  }
}

class CurrentData {
  double? open;
  double? close;
  double? high;
  double? low;
  double? increasePercent;
  double? increaseRate;
}
