import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletwise/controllers/stocks/stock_fetch_controller.dart';
import 'package:walletwise/models/bought_stock.dart';
import 'package:walletwise/utils/gaps/Xgap.dart';

class StockPortfolioCard extends StatefulWidget {
  final BoughtStock boughtStock;
  final void Function()? onDismissed; // Callback for when the card is dismissed

  const StockPortfolioCard({
    Key? key,
    required this.boughtStock,
    this.onDismissed,
  }) : super(key: key);

  @override
  State<StockPortfolioCard> createState() => _StockPortfolioCardState();
}

class _StockPortfolioCardState extends State<StockPortfolioCard> {
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
    var currentData =
        await fetchController.getCurrentData(widget.boughtStock.stock);
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
    // Calculate the total investment.
    final double totalInvestment =
        widget.boughtStock.unit * widget.boughtStock.boughtAmount;

    // Calculate current value and profit/loss.
    final double currentValue = widget.boughtStock.unit * (close ?? 0);
    final double profitLoss = totalInvestment - currentValue;

    // Determine the color based on profit or loss.
    final Color profitLossColor = profitLoss >= 0 ? Colors.green : Colors.red;

    return Dismissible(
      key: ValueKey(widget.boughtStock.stock.id ??
          DateTime.now().toString()), // Unique key for each item
      direction: DismissDirection.endToStart, // Swipe direction
      onDismissed: (direction) {
        if (widget.onDismissed != null) {
          widget.onDismissed!(); // Call the callback if provided
          //delete the boughtStock
          //refetch
        }
      },
      background: Container(
          color: Colors.indigo,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          //child: const Icon(Icons.delete, color: Colors.white),
          child: const Text("Delete", style: TextStyle(color: Colors.white))),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: Colors.grey[900],
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.boughtStock.stock.name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildInfoText(
                      'Quantity', widget.boughtStock.unit.toString()),
                  _buildInfoText('Current Price',
                      '\$${close?.toStringAsFixed(2) ?? "--"}'),
                ],
              ),
              gapY("sm"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildInfoText('Total Investment',
                      '\$${totalInvestment.toStringAsFixed(2)}'),
                  _buildInfoText(
                      'Current Value', '\$${currentValue.toStringAsFixed(2)}'),
                ],
              ),
              gapY("md"),
              Text(
                'Profit/Loss: \$${profitLoss.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: profitLossColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoText(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[400],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
