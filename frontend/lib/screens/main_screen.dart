import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletwise/data/saving_goals.dart';
import 'package:walletwise/models/saving.dart';
import 'package:walletwise/utils/cards/hero_card.dart';
import 'package:walletwise/utils/cards/savinggoal_card.dart';
import 'package:walletwise/utils/charts/bar_chart.dart';
import 'package:walletwise/utils/dialogs/DialogBuilder.dart';
import 'package:walletwise/utils/tabs/asset_debt.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              BalanceCard(),
              SizedBox(
                height: 20,
              ),
              AssetDebt(),
              SizedBox(
                height: 20,
              ),

              //Obx(() {
              //  // Access the savinglist from SavingGoalData
              //  List<Saving> savingList = SavingGoalData.savinglist.toList();
              //  return Column(
              //    children: savingList.map((saving) {
              //      return SavingCard(
              //        // Assuming you have a widget called SavingGoalCard to display each saving goal
              //        saving: saving,
              //        // Add any other parameters you need to pass to SavingGoalCard constructor
              //      );
              //    }).toList(),
              //  );
              //}),
              //render saving goal

              SizedBox(
                height: 20,
              ),
              Center(child: Text("Saving Goals")),
              Container(
                child: Row(
                  children: [
                    SavingCard(
                        saving: Saving(
                            note: "for this,",
                            amount: 1000,
                            title: "Macbook",
                            date: "May 10"))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 20,
              ),
              Center(child: Text("Balance")),
              SizedBox(
                height: 20,
              ),

              Container(
                constraints: BoxConstraints(maxWidth: 500),
                child: MyLineChart(getChartData()), // Add the line chart here
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0.0,
          right: 10.0,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Container(
              width: 56.0,
              height: 56.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: Colors.white, // Border color
                  width: 2.0, // Border width
                ),
              ),
              child: FloatingActionButton(
                onPressed: () => Dialogbuilder.hello(context),
                child: const Icon(Icons.add),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
