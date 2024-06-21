import 'package:flutter/material.dart';
import 'package:walletwise/constants/app_colors.dart';
import 'package:walletwise/models/payment.dart';

class UpcomingPaymentCard extends StatelessWidget {
  final Payment payment;
  UpcomingPaymentCard({required this.payment});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.lowDarkBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(width: 10),
                Text(
                  payment.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.access_time, color: Colors.orangeAccent),
                const SizedBox(width: 5),
                Text(
                  "Due in ${payment.due} day",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(children: [
              const Icon(color: Colors.green, Icons.money),
              const SizedBox(width: 10),
              Text(
                "${payment.savings} / ${payment.amount} ",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
