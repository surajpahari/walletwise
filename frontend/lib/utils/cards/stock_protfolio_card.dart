import 'package:flutter/material.dart';

class StockPortfolioCard extends StatelessWidget {
  final String stockName;
  final double currentPrice;
  final int quantity;
  final double buyingPrice;

  const StockPortfolioCard({
    Key? key,
    required this.stockName,
    required this.currentPrice,
    required this.quantity,
    required this.buyingPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double totalInvestment = quantity * buyingPrice;
    final double currentValue = quantity * currentPrice;
    final double profitLoss = currentValue - totalInvestment;

    return Card(
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
              stockName,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoText('Quantity', quantity.toString()),
                _buildInfoText(
                    'Current Price', '\$${currentPrice.toStringAsFixed(2)}'),
              ],
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoText('Total Investment',
                    '\$${totalInvestment.toStringAsFixed(2)}'),
                _buildInfoText(
                    'Current Value', '\$${currentValue.toStringAsFixed(2)}'),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Profit/Loss: ${profitLoss >= 0 ? '+' : ''}\$${profitLoss.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: profitLoss >= 0 ? Colors.green : Colors.red,
              ),
            ),
          ],
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
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
