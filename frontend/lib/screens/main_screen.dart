import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletwise/data/bank_account.dart';
import 'package:walletwise/data/payment_data.dart';
import 'package:walletwise/data/saving_goals.dart';
import 'package:walletwise/utils/cards/bank_card.dart';
import 'package:walletwise/utils/cards/hero_card.dart';
import 'package:walletwise/utils/cards/savinggoal_card.dart';
import 'package:walletwise/utils/cards/upcoming_payment_card.dart';
import 'package:walletwise/utils/charts/line_chart.dart';
import 'package:walletwise/utils/dialogs/DialogBuilder.dart';
import 'package:walletwise/utils/tabs/asset_debt.dart';
import 'package:walletwise/data/balance_data.dart';

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
              SizedBox(height: 20),
              Center(
                  child: Text("Saving Goals", style: TextStyle(fontSize: 30))),
              SizedBox(height: 10),
              Container(
                  child: Obx(
                () => Wrap(
                  alignment: WrapAlignment.start,
                  children:
                      SavingGoalData.savinglist.asMap().entries.map((entry) {
                    return Column(children: [SavingCard(saving: entry.value)]);
                  }).toList(),
                ),
              )),
              SizedBox(
                height: 20,
              ),
              Text(
                "BankAccount",
                style: TextStyle(fontSize: 32),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Wrap(
                    alignment: WrapAlignment.end,
                    children:
                        BankAccountData.bankAccountList.map((bankAccount) {
                      return BankCard(bankAccount: bankAccount);
                    }).toList()),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Upcoming payments", style: TextStyle(fontSize: 23)),
              Obx(() => Row(
                      children: PaymentData.paymentlist.map((payment) {
                    return UpcomingPaymentCard(payment: payment);
                  }).toList())),

              SizedBox(
                height: 20,
              ),
              Center(child: Text("Balance", style: TextStyle(fontSize: 32))),
              SizedBox(
                height: 20,
              ),
              Container(child: WwLineChart(data: BalanceData.balanceHistory)),
              SizedBox(
                height: 60,
              ),

              //Container(
              //  constraints: BoxConstraints(maxWidth: 500),
              //  child: MyLineChart(getChartData()), // Add the line chart here
              //),
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
