import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletwise/controllers/budget/bank_controller.dart';
import 'package:walletwise/theme/theme_constant.dart';
import 'package:walletwise/utils/appbar/walletWiseBar.dart';
import 'package:walletwise/utils/gaps/Xgap.dart';
import 'package:walletwise/utils/texfields/ww_submit.dart';
import 'package:walletwise/utils/texfields/ww_textfield.dart';
//import 'package:walletwise/utils/validators/validation.dart';

class AddBankAccForm extends StatelessWidget {
  const AddBankAccForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BankAccController();
    return Theme(
      data: myTheme,
      child: Scaffold(
        appBar: WalletWiseBar.normalPageBar("Add Bank Account "),
        body: Form(
          key: controller.formKey,
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 300),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  WwTextfield(
                      label: "BankName",
                      controller: controller.name,
                      icon: const Icon(Icons.title),
                      validator: (value) {
                        return null;
                      }),
                  gapY("md"),
                  WwTextfield(
                      controller: controller.accountNumber,
                      label: "Account Numbers",
                      icon: const Icon(Icons.numbers),
                      validator: (value) {
                        return null;
                      }),
                  gapY("md"),
                  WwTextfield(
                      label: "Amount",
                      controller: controller.amount,
                      icon: const Icon(Icons.money),
                      validator: (value) {
                        return null;
                      }),
                  gapY("md"),
                  WwSubmit(
                    onPressed: () {
                      print(controller.formState.value);
                      controller.addBankAcc(context);
                    },
                    child: Obx(
                      () => controller.formState.value == 1
                          ? const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Adding...",
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 2),
                                CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth:
                                      3, // Thinner progress indicator for a sleeker look
                                ),
                              ],
                            )
                          : const Text(
                              "Add",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
