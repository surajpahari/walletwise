class PieData {
  final String name;
  final double value;
  PieData({required this.name, required this.value});
}

class XYGraphData {
  final double x;
  final double y;
  XYGraphData({required this.x, required this.y});
}

class DateAmountGraphData {
  final String date;
  final double amount;
  DateAmountGraphData({required this.date, required this.amount});
}

class OHLCdata {
  OHLCdata(this.x, this.high, this.low, this.open, this.close);
  final String x;
  final double high;
  final double low;
  final double open;
  final double close;
  factory OHLCdata.fromJson(Map<String, dynamic> json) {
    return OHLCdata(
        json['published_date'] as String? ??
            '', // Provide default value 0 if null
        json['high'] as double? ?? 0.0, // Provide default value '' if null
        json['low'] as double? ?? 0.0, // Provide default value '' if null
        json['open'] as double? ?? 0.0, // Provide default value '' if null
        json['close'] as double? ?? 0.0); // Provide default value 0.0 if null
  }
}


     
  //defination of the class for every graph in the app

  //pieChart

  //pointGraph

  //candleGraph
