import 'package:flutter/material.dart';

class AppText {
  AppText._();
  static const title = Text(
    "WalletWise",
    style: TextStyle(fontSize: 34),
  );
  //for the budgetScreen
  static const budgetScreenIncomeTab = Text(
    "Income",
    style: TextStyle(fontSize: 20, color: Colors.white),
  );
  static const budgetScreenExpenseTab = Text(
    "Expenses",
    style: TextStyle(fontSize: 20, color: Colors.white),
  );
}
