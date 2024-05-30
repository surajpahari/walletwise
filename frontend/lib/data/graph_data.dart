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
}

     
  //defination of the class for every graph in the app

  //pieChart

  //pointGraph

  //candleGraph
