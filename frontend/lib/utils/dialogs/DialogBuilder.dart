import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletwise/theme/theme_constant.dart';
import 'package:walletwise/utils/forms/bank/add_bank_acc.dart';
import 'package:walletwise/utils/forms/saving_goals/add_saving_goal.dart'; 
import 'package:walletwise/utils/forms/assets/asset_add.dart';
import 'package:walletwise/utils/forms/debt/add_debt_form.dart';

class Dialogbuilder {
  static void hello(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Theme(
          data: wwTheme, // Use dark theme
          child: SimpleDialog(
            backgroundColor: Colors.white, // Set background color to white
            children: [
              SimpleDialogOption(
                onPressed: () {
                },
                child: const Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text("New Buy",
                      style: TextStyle(
                          color: Colors.black87)), // Less intense black
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Divider(height: 1, color: Colors.grey),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Get.to(AddSavingGoalForm());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text("Saving Goal",
                      style: TextStyle(
                          color: Colors.black87)), // Less intense black
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Divider(height: 1, color: Colors.grey),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Get.to(AddAssetForm());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text("Assets",
                      style: TextStyle(
                          color: Colors.black87)), // Less intense black
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Divider(height: 1, color: Colors.grey),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Get.to(AddDebtForm());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text("Debts",
                      style: TextStyle(
                          color: Colors.black87)), // Less intense black
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Divider(height: 1, color: Colors.grey),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Get.to(AddBankAccForm());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text("Bank Account",
                      style: TextStyle(
                          color: Colors.black87)), // Less intense black
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
