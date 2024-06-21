import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletwise/controllers/budget/balance_card_controller.dart';
import 'package:walletwise/controllers/budget/bank_controller.dart';
import 'package:walletwise/controllers/budget/expense_controller.dart';
import 'package:walletwise/controllers/budget/payment_controller.dart';
import 'package:walletwise/data/bank_account.dart';
import 'package:walletwise/data/payment_data.dart';
import 'package:walletwise/data/saving_goals.dart';
import 'package:walletwise/utils/cards/bank_card.dart';
import 'package:walletwise/utils/cards/balance_card.dart';
import 'package:walletwise/utils/cards/savinggoal_card.dart';
import 'package:walletwise/utils/cards/upcoming_payment_card.dart';
import 'package:walletwise/utils/charts/line_chart.dart';
import 'package:walletwise/utils/dialogs/DialogBuilder.dart';
import 'package:walletwise/utils/tabs/asset_debt.dart';
import 'package:walletwise/data/balance_data.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key});
  Widget gap(int height) {
    return (SizedBox(height: height.toDouble()));
  }

  Text title(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 32,
      ),
      textAlign: TextAlign.start,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //balnaceCard section
              BalanceCard(),
              gap(20),
              ElevatedButton(
                  onPressed: () {
                    PaymentController.fetchPayment();
                    BankAccController.fetchBankAccount();
                    BalanceCardController.fetch();
                  },
                  child: const Text("fetch")),

              gap(20),
              //ASSETDEBT SECTION
              const AssetDebt(),

              gap(20),
              //BANKACCOUNT SECTION
              title("BankAccount"),
              gap(10),
              Obx(() => Wrap(
                    alignment: WrapAlignment.end,
                    children: BankAccountData.bankAccountList
                        .asMap()
                        .entries
                        .map((entry) => Column(
                              children: [BankCard(bankAccount: entry.value)],
                            ))
                        .toList(),
                  )),
              gap(40),

              //SAVING GOALS SECTION
              const Center(
                  child: Text("Saving Goals", style: TextStyle(fontSize: 30))),
              const SizedBox(height: 10),
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

              gap(20),
              //UPCOMING PAYMENTS SECTION
              title("Upcoming Payment"),
              Obx(() => Wrap(
                  alignment: WrapAlignment.center,
                  children: PaymentData.paymentlist.map((payment) {
                    return UpcomingPaymentCard(payment: payment);
                  }).toList())),

              SizedBox(
                height: 20,
              ),
              title("Balance"),
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
            padding: const EdgeInsets.all(16),
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
