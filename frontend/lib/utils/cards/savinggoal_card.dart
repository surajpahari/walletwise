import 'package:flutter/material.dart';
import 'package:walletwise/models/saving.dart';

class SavingCard extends StatefulWidget {
  final Saving saving;
  const SavingCard({required this.saving, super.key});

  @override
  State<SavingCard> createState() => _SavingCardState();
}

class _SavingCardState extends State<SavingCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: EdgeInsets.all(45),
      child: Column(
        children: [
          Text(widget.saving.title),
          Text(widget.saving.amount.toString()),
          Text(widget.saving.date),
        ],
      ),
    ));
  }
}
