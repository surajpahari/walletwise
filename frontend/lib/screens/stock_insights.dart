import 'package:flutter/material.dart';
import 'package:walletwise/controllers/stocks/stock_fetch_controller.dart';
import 'package:walletwise/models/stock.dart';
import 'package:walletwise/utils/appbar/walletWiseBar.dart';
import 'package:walletwise/theme/theme_constant.dart';
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

  @override
  void initState() {
    super.initState();
    _fetchDataFuture = fetchData();
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
            ],
          ),
        ),
      ),
    );
  }
}
