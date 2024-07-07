import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:walletwise/constants/app_colors.dart';
import 'package:walletwise/controllers/stocks/stock_fetch_controller.dart';
import 'package:walletwise/data/graph_data.dart';
import 'package:walletwise/models/stock.dart';

class WwCandleChart extends StatefulWidget {
  final Stock stock;
  WwCandleChart({required this.stock, Key? key}) : super(key: key);

  @override
  _WwCandleChartState createState() => _WwCandleChartState();
}

class _WwCandleChartState extends State<WwCandleChart> {
  late List<OHLCdata> data;
  late TrackballBehavior _trackballBehavior;
  bool test = true;

  @override
  void initState() {
    super.initState();
    fetchData();
    _trackballBehavior = TrackballBehavior(
      enable: true,
      activationMode: ActivationMode.singleTap,
      tooltipDisplayMode: TrackballDisplayMode.groupAllPoints,
    );
  }

  Future<void> fetchData() async {
    try {
      List<OHLCdata> fetchedData =
          await StockFetchController().getStockChart(widget.stock);
      print(
          "fetchedData is ${fetchedData[0].x},${fetchedData[0].low},${fetchedData[0].close}");
      setState(() {
        data = fetchedData;
        test = false;
      });
      print("data is ${data}");
    } catch (e) {
      print('Error fetching data: $e');
      // Handle error gracefully, e.g., show error message
    }
  }

  @override
  Widget build(BuildContext context) {
    if (test) {
      return Center(
          child: CircularProgressIndicator(
        color: AppColors.darkReed,
      ));
    } else {
      return Container(
        constraints: const BoxConstraints(maxHeight: 350),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: 800, // Set a larger width to make the chart scrollable
            child: SfCartesianChart(
              trackballBehavior: _trackballBehavior,
              //indicators: [
              //  RsiIndicator<OHLCdata, String>(
              //    dataSource: data,
              //    xValueMapper: (data, _) => data.x,
              //    closeValueMapper: (data, _) => data.close,
              //    period: 14, // Default period for RSI
              //    yAxisName: 'rsiAxis', // Optional: name the axis if needed
              //  ),
              //],
              primaryXAxis: const CategoryAxis(
                //minimum: 0,
                //maximum: 40,
                //interval: 1,
                majorGridLines: MajorGridLines(width: 0),
              ),
              primaryYAxis: const NumericAxis(
                //minimum: 0,
                //maximum: 40,
                //interval: 2,
                majorGridLines: MajorGridLines(width: 0),
                minorGridLines: MinorGridLines(width: 0),
              ),
              axes: const <ChartAxis>[
                NumericAxis(
                  //name: 'rsiAxis',
                  //minimum: 0,
                  //maximum: 100,
                  //interval: 20,
                  majorGridLines: MajorGridLines(width: 0),
                ),
              ],
              series: <CartesianSeries<OHLCdata, String>>[
                CandleSeries<OHLCdata, String>(
                  trendlines: [
                    Trendline(type: TrendlineType.movingAverage),
                  ],
                  animationDuration: 1000.00,
                  dataSource: data,
                  bullColor: Colors.blue,
                  bearColor: Colors.pink,
                  xValueMapper: (data, _) => data.x,
                  highValueMapper: (data, _) => data.high,
                  lowValueMapper: (data, _) => data.low,
                  openValueMapper: (data, _) => data.open,
                  closeValueMapper: (data, _) => data.close,
                  name: widget.stock.symbol,
                  enableSolidCandles: true,
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
