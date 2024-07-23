import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletwise/constants/app_colors.dart';
import 'package:walletwise/models/stock.dart';
import 'package:walletwise/screens/stock_detail.dart';
import 'package:walletwise/controllers/stocks/stock_fetch_controller.dart';

class StockCard extends StatefulWidget {
  final Stock stock;
  const StockCard({Key? key, required this.stock}) : super(key: key);

  @override
  State<StockCard> createState() => _StockCardState();
}

class _StockCardState extends State<StockCard> {
  double? high;
  double? low;
  double? open;
  double? close;
  double? perChange;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() async {
    StockFetchController fetchController = Get.find<StockFetchController>();
    var currentData = await fetchController.getCurrentData(widget.stock);
    setState(() {
      high = currentData['high']?.toDouble();
      low = currentData['low']?.toDouble();
      open = currentData['open']?.toDouble();
      close = currentData['close']?.toDouble();
      perChange = currentData['per_change']?.toDouble();
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(StockDetail(stock: widget.stock));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: AppColors.lowDarkBlue,
        ),
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.stock.symbol,
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Text color
                        ),
                      ),
                      Text(
                        'Rs ${close ?? ' ---'}',
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Text color
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    widget.stock.name,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey[400], // Lighter text color
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    '${perChange ?? '---'} %',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: (perChange ?? 0) < 0
                          ? Colors.redAccent
                          : Colors.greenAccent,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Open',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey[400], // Lighter text color
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            'Rs ${open ?? '---'}',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white, // Text color
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'High',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey[400], // Lighter text color
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            'Rs ${high ?? '---'}',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white, // Text color
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Low',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey[400], // Lighter text color
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            'Rs${low ?? ' ---'}',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white, // Text color
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
