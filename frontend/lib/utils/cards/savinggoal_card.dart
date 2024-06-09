import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletwise/models/saving.dart';
import 'package:walletwise/screens/saving_screen.dart';
import 'package:walletwise/utils/charts/saving_goal_bar.dart';

class SavingCard extends StatefulWidget {
  final Saving saving;
  const SavingCard({required this.saving, super.key});

  @override
  State<SavingCard> createState() => _SavingCardState();
}

class _SavingCardState extends State<SavingCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(maxWidth: 200),
        child: Card(
          color:
              Colors.white, // Card background color (light color for contrast)
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 5,
          child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                Get.to(SavingScreen(
                  saving: widget.saving,
                ));
                debugPrint("tap");
              },
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.saving.title,
                      style: TextStyle(
                        fontSize: 24, // Title font size
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Dark text color for contrast
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Icon(Icons.monetization_on,
                            color: Colors.green, size: 20),
                        SizedBox(width: 5),
                        Text(
                          "${widget.saving.saved} / ${widget.saving.amount}",
                          style: TextStyle(
                            fontSize: 18, // Saved/Total amount font size
                            fontWeight: FontWeight.w500,
                            color:
                                Colors.black87, // Dark text color for contrast
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    SavingsGoalChart(
                      goalAmount: widget.saving.amount.toDouble(),
                      savedAmount: widget.saving.saved,
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(Icons.calendar_today,
                            color: Colors.grey, size: 18),
                        SizedBox(width: 5),
                        Text(
                          widget.saving.date,
                          style: TextStyle(
                            fontSize: 16, // Date font size
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[
                                700], // Slightly darker grey for better readability
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ));
  }
}
