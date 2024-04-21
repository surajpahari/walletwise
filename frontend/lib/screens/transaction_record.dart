import 'package:flutter/material.dart';
import 'package:walletwise/utils/cards/transaction_card.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TransactionCard(
          date: 'Today', amount: '1200', title: 'Sandwich', type: '0'),
      TransactionCard(date: 'Today', amount: '1200', title: 'Gym', type: "0"),
      TransactionCard(
          date: 'Oct-28', amount: '1200', title: 'School fee', type: '1'),
      TransactionCard(
          date: 'Today', amount: '1200', title: 'Medical fee', type: '0'),
      TransactionCard(
          date: 'Today', amount: '1200', title: 'Whatever', type: '1'),
    ]);
  }
}
