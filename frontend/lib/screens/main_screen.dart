import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletwise/controllers/budget/asset_controller.dart';
import 'package:walletwise/controllers/budget/balance_card_controller.dart';
import 'package:walletwise/controllers/budget/expense_controller.dart';
import 'package:walletwise/controllers/stocks/stock_add_controller.dart';
import 'package:walletwise/controllers/stocks/stock_fetch_controller.dart';
import 'package:walletwise/data/asset_debt_data.dart';
import 'package:walletwise/data/bank_account.dart';
import 'package:walletwise/data/expense_data.dart';
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

  Padding title(String title) {
    return Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 32,
          ),
          textAlign: TextAlign.start,
        ));
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
              const BalanceCard(),
              gap(20),
              ElevatedButton(
                  onPressed: () {
                    //ExpenseController.fetchExpenseCategories();
                    //print(ExpenseData.detailedCategory);
                    //ExpenseController.fetchUserCategories();
                    BalanceCardController.fetchBalanceCardData();
                    AssetController().getAssets(context);
                    ExpenseController.fetchExpenseCategories();
                    StockAddController.fetchBoughtStock();
                  },
                  child: const Text("fetch")),

              ElevatedButton(
                  onPressed: () {
                    AssetDebtData.assetsData.value = [];
                    AssetDebtData.pieDataList.value = [];
                    //ExpenseController.fetchItemForCategory(1);
                    //ExpenseController.fetchUserCategories();
                  },
                  child: const Text("fetch2")),
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
              title("Saving Goals"),
              gap(10),
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
