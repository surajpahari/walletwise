import 'package:flutter/material.dart';
import 'package:walletwise/models/bought_stock.dart';
import 'package:walletwise/utils/gaps/Xgap.dart';

class StockPortfolioCard extends StatelessWidget {
  final BoughtStock? boughtStock;

  const StockPortfolioCard({Key? key, this.boughtStock}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculate the total investment.
    final double totalInvestment = boughtStock != null
        ? boughtStock!.unit * boughtStock!.boughtAmount
        : 0.0;

    const double profitLoss = 10;

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
              boughtStock?.stock.name ?? "--",
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
                    'Quantity', boughtStock?.unit.toString() ?? "--"),
                _buildInfoText('Current Price',
                    '\$${boughtStock?.currentAmount.toString() ?? "--"}'),
              ],
            ),
            gapY("sm"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoText(
                    'Total Investment', '\$${totalInvestment.toString()}'),
                _buildInfoText('Current Value',
                    '\$${boughtStock?.currentAmount?.toStringAsFixed(2) ?? "--"}'),
              ],
            ),
            gapY("md"),
            Text(
              'Profit/Loss: \$${profitLoss.toString()}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
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
