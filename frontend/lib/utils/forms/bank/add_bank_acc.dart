import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletwise/controllers/budget/bank_controller.dart';
import 'package:walletwise/theme/theme_constant.dart';
import 'package:walletwise/utils/appbar/walletWiseBar.dart';
import 'package:walletwise/utils/validators/validation.dart';

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
              constraints: BoxConstraints(maxWidth: 300),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  TextFormField(
                    //validator: (value) => WwValidator.isInputEmpty(value),
                    controller: controller.name,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.title),
                      labelText: "Name of the Bank",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            20), // Make the border rounded
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            20), // Make the border rounded
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            20), // Make the border rounded
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: controller.amount,
                    //validator: (value) {
                    //  if (value == null || value.isEmpty) {
                    //    return "Please enter the amount";
                    //  }
                    //  return null;
                    //},
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.attach_money),
                      labelText: "Current Amount in Bank",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            20), // Make the border rounded
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            20), // Make the border rounded
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            20), // Make the border rounded
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: controller.accountNumber,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.note),
                      labelText: "Current Loan in Bank",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            20), // Make the border rounded
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            20), // Make the border rounded
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            20), // Make the border rounded
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(height: 20),
                  Container(
                    constraints: BoxConstraints(minWidth: 327),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        print(controller.formState.value);
                        controller.addBankAcc(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(4),
                        child: Obx(
                          () => controller.formState.value == 1
                              ? const Column(
                                  children: [
                                    Text(
                                      "Adding",
                                      style: TextStyle(
                                          fontSize: 24, color: Colors.white),
                                    ),
                                    LinearProgressIndicator(
                                        color: Colors.white),
                                  ],
                                )
                              : const Text(
                                  "Add",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ),
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
