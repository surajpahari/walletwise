import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:walletwise/constants/app_colors.dart";
import "package:walletwise/theme/theme_constant.dart";
import "package:walletwise/utils/forms/pages/asset_form.dart";
import "package:walletwise/utils/forms/pages/debt_form.dart";
import "package:walletwise/utils/forms/pages/saving_goal.dart";

class Dialogbuilder {
  static void hello(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Theme(
            data: wwTheme, // Use dark theme
            child: AlertDialog(
              title: Padding(
                padding: EdgeInsets.only(bottom: 0),
                child: Center(
                    child: SingleChildScrollView(
                        child: Column(children: [
                  ElevatedButton(
                    onPressed: () {
                      print("ok");
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, // Background color
                      backgroundColor: Colors.red, // Text color
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15), // Button padding
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Button border radius
                      ),
                    ),
                    child: const Text("New buy"),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(SavingGoalForm());
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, // Background color
                      backgroundColor: AppColors.lightgreen, // Text color
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15), // Button padding
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Button border radius
                      ),
                    ),
                    child: const Text("Saving goal"),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(AssetForm());
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, // Background color
                      backgroundColor: AppColors.darkGreen, // Text color
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15), // Button padding
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Button border radius
                      ),
                    ),
                    child: const Text("Assets"),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(DebtForm());
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, // Background color
                      backgroundColor: Colors.pink, // Text color
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15), // Button padding
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Button border radius
                      ),
                    ),
                    child: const Text("Debts"),
                  )
                ]))),
              ),
            ));
      },
    );
  }
}
