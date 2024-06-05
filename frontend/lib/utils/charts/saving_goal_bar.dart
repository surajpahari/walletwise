import 'package:flutter/material.dart';

class SavingsGoalChart extends StatelessWidget {
  final double goalAmount;
  final double savedAmount;

  SavingsGoalChart({required this.goalAmount, required this.savedAmount});

  @override
  Widget build(BuildContext context) {
    double progress = (savedAmount / goalAmount).clamp(0.0, 1.0);

    return Container(
      width: 150, // Reduce the width
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: 10, // Reduce the height
                  decoration: BoxDecoration(
                    color: Colors.grey[300], // Light grey background color
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: progress,
                  child: Container(
                    height: 10, // Reduce the height
                    decoration: BoxDecoration(
                      color: Colors.green, // Green progress color
                      borderRadius:
                          BorderRadius.horizontal(left: Radius.circular(10)),
                    ),
                  ),
                ),
                //Align(
                //  alignment: Alignment.centerLeft,
                //  child: Padding(
                //    padding: const EdgeInsets.symmetric(horizontal: 4),
                //    child: Text(
                //      '${(progress * 100).toStringAsFixed(1)}%',
                //      style: TextStyle(
                //        color: Colors.white, // White text color
                //        fontWeight: FontWeight.bold,
                //      ),
                //    ),
                //  ),
                //),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
