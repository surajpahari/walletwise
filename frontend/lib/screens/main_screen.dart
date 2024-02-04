import 'package:flutter/material.dart';
import 'package:walletwise/utils/cards/profit_card.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  void _hello(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hello'),
          content: const Text('This is a popup modal.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              width: double.infinity,
              child: Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                spacing: 16.0,
                runSpacing: 16.0,
                children: [
                  ProfitCard(
                    amount: "Rs 1500",
                    textColor: Colors.green,
                    icon: Icons.arrow_upward,
                    iconColor: Colors.green,
                  ),
                  ProfitCard(
                    amount: "Rs 1500",
                    textColor: Colors.red,
                    icon: Icons.arrow_downward,
                    iconColor: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 16.0,
          right: 16.0,
          child: FloatingActionButton(
            onPressed: () => _hello(context),
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
