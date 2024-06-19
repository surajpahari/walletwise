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
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(width: 10),
                Text(
                  payment.title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.access_time, color: Colors.orangeAccent),
                SizedBox(width: 5),
                Text(
                  "Due in 2 days",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Text(
              "Rs${payment.totalSaved} / ${payment.totalPay} ",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
