import 'package:flutter/material.dart';
import 'package:walletwise/controllers/stocks/stock_fetch_controller.dart';
import 'package:walletwise/models/stock.dart';
import 'package:walletwise/utils/sections/stocks/lstm_section.dart';
import 'package:walletwise/utils/appbar/walletWiseBar.dart';
import 'package:walletwise/theme/theme_constant.dart';
import 'package:walletwise/utils/charts/stocks/forecast_chart.dart';
import 'package:walletwise/utils/cards/technical_insight_card.dart';
import 'package:walletwise/utils/cards/warning_card.dart';
import 'package:walletwise/utils/gaps/Xgap.dart';

class StockInsights extends StatefulWidget {
  final Stock stock;

  StockInsights({required this.stock, Key? key}) : super(key: key);

  @override
  State<StockInsights> createState() => _StockInsightsState();
}

class _StockInsightsState extends State<StockInsights> {
  late Future<dynamic> _fetchDataFuture;
  late Future<dynamic> _fetchForecast;

  @override
  void initState() {
    super.initState();
    _fetchDataFuture = fetchData();
    _fetchForecast = fetchForecastData();
  }

  Future<dynamic> fetchData() async {
    try {
      dynamic fetchedData =
          await StockFetchController().getTechnicalInsights(widget.stock);
      return fetchedData;
    } catch (e) {
      // Handle error appropriately
      rethrow; // Rethrow the error to propagate it
    }
  }

  Future<dynamic> fetchForecastData() async {
    try {
      dynamic fetchedForecastData =
          await StockFetchController().getForecastData(widget.stock);
      return fetchedForecastData;
    } catch (e) {
      // Handle error appropriately
      rethrow; // Rethrow the error to propagate it
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: myTheme,
      child: Scaffold(
        appBar: WalletWiseBar.normalPageBar("Insights"),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const WarningCard(),
              gapY('lg'),
              Text(widget.stock.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 30)),
              FutureBuilder(
                future: _fetchDataFuture,
                builder: (context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  } else if (snapshot.hasData) {
                    dynamic technicalInsights = snapshot.data;
                    return TechnicalInsightCard(
                      insights: technicalInsights,
                    );
                  } else {
                    return const Center(child: Text("No data available"));
                  }
                },
              ),
              gapY('lg'),
              const Text(
                "Next 12 months max and min forecast price",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 23),
              ),
              FutureBuilder(
                future: _fetchForecast,
                builder: (context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  } else if (snapshot.hasData) {
                    dynamic forecastData = snapshot.data;

                    // Convert dynamic LTP data to List<double>
                    List<double> ltpData =
                        (forecastData['LTP'] as List<dynamic>)
                            .map((e) => e is num ? e.toDouble() : 0.0)
                            .toList();

                    return Column(
                      children: [
                        //min rate indicator
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 15,
                                height: 15,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red,
                                ),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                  'Min Rate: ${forecastData['min-rate'].toString()}'),
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 15,
                                height: 15,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green,
                                ),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                  'Max Rate: ${forecastData['max-rate'].toString()}'),
                            ]),
                        ForecastGraph(
                          yLine1: forecastData['max-rate'].toDouble(),
                          yLine2: forecastData['min-rate'].toDouble(),
                          ltpData: ltpData,
                        ),
                      ],
                    );
                  } else {
                    return const Center(child: Text("No data available"));
                  }
                },
              ),
              gapY('lg'),
              LstmSection(
                stock: widget.stock,
              )
            ],
          ),
        ),
      ),
    );
  }
}
