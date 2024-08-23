import 'package:flutter/material.dart';
import 'package:walletwise/controllers/stocks/stock_fetch_controller.dart';
import 'package:walletwise/data/stock_data.dart';
import 'package:walletwise/models/stock.dart';
import 'package:walletwise/utils/charts/stocks/lstm_chart.dart';

class LstmSection extends StatefulWidget {
  final Stock stock;

  LstmSection({required this.stock, Key? key}) : super(key: key);

  @override
  State<LstmSection> createState() => _LstmSectionState();
}

class _LstmSectionState extends State<LstmSection> {
  late Future<List<double>> _fetchForecast;

  @override
  void initState() {
    super.initState();

    _fetchForecast = fetchLstmData();
  }

  Future<List<double>> fetchLstmData() async {
    try {
      List<double> fetchedForecastData =
          await StockFetchController().getLstmData(widget.stock);
      return fetchedForecastData;
    } catch (e) {
      // Handle error appropriately
      rethrow; // Rethrow the error to propagate it
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Next 30 days forecast using LSTM"),
        Column(
          children: [
            //min rate indicator
            FutureBuilder(
              future: _fetchForecast,
              builder: (context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else if (snapshot.hasData) {
                  List<double> forecastData = snapshot.data;

                  // Convert dynamic LTP data to List<double>
                  //List<double> ltpData = (forecastData['LTP'] as List<dynamic>)
                  //    .map((e) => e is num ? e.toDouble() : 0.0)
                  //    .toList();
                  //
                  return Column(
                    children: [
                      //min rate indicator
                      LstmGraph(
                        ltpData: forecastData,
                      ),
                    ],
                  );
                } else {
                  return const Center(child: Text("No data available"));
                }
              },
            ),

            //LstmGraph(ltpData: UserStockData.lstmList),
          ],
        ),
      ],
    );
  }
}
