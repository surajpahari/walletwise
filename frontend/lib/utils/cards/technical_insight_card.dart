import 'package:flutter/material.dart';
import 'package:walletwise/utils/herotext/hero_text.dart';

class TechnicalInsightCard extends StatelessWidget {
  final dynamic insights;

  TechnicalInsightCard({required this.insights});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRow(label: "Company", value: insights["Company"] ?? ''),
          _buildRow(label: "Sector", value: insights["Sector"] ?? ''),
          _buildRow(
              label: "Signal",
              text: HeroText.technicalSummary(insights["Signal"])),
          _buildRow(
              label: "Technical Entry Risk",
              text: HeroText.signal(insights["Risk"])),
          _buildRow(
            label: "LTP",
            value: insights["LTP"],
          ),
          _buildRow(
              label: "Daily Volatility",
              value: insights["Daily Volatility"] ?? ''),
          _buildRow(label: "Daily Gain", value: insights["Daily Gain"] ?? ''),
          _buildRow(
              label: "Price Relative",
              value: insights["Daily Volatility"] ?? ''),
          _buildRow(label: "RSI 14", value: insights["RSI 14"] ?? ''),
          _buildRow(label: "%B", value: insights["%B"] ?? ''),
          _buildRow(label: "MFI 14", value: insights["MFI 14"] ?? ''),
        ],
      ),
    );
  }

  Widget _buildRow(
      {required String label,
      String value = '',
      Widget text = const Text('')}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          const SizedBox(width: 16.0),
          value == ''
              ? text
              : Expanded(
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ),
        ],
      ),
    );
  }
}
