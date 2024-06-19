import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletwise/constants/app_colors.dart';
import 'package:walletwise/controllers/budget/savinggoal_controller.dart';
import 'package:walletwise/theme/theme_constant.dart';
import 'package:walletwise/utils/appbar/walletWiseBar.dart';
import 'package:walletwise/utils/validators/validation.dart';

class AddSavingGoalForm extends StatelessWidget {
  const AddSavingGoalForm({Key? key});
  InputDecoration inputDecoration(label, icon) {
    return InputDecoration(
        errorStyle: const TextStyle(color: Colors.red),
        prefixIcon: icon,
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final controller = SavinggoalController();

    return Theme(
      data: myTheme,
      child: Scaffold(
        appBar: WalletWiseBar.normalPageBar("Add Saving Goal"),
        body: Form(
          key: controller.formKey,
          child: Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: 300),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  TextFormField(
                    validator: (value) => WwValidator.isInputEmpty(value),
                    controller: controller.title,
                    decoration: inputDecoration(
                      "title",
                      const Icon(Icons.title),
                    ),
                    keyboardType:
                        TextInputType.text, // Assuming it's for titles
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: controller.amount,
                    validator: (value) => WwValidator.isNumeric(value),
                    decoration: inputDecoration(
                      "amount",
                      const Icon(Icons.money),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: controller.note,
                    decoration: inputDecoration("note", const Icon(Icons.note)),
                    keyboardType: TextInputType.text, // Assuming it's for notes
                  ),
                  SizedBox(height: 20),
                  Container(
                    constraints: BoxConstraints(minWidth: 327),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        print(controller.formState.value);
                        controller.addSaving(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Obx(
                          () => controller.formState.value == 1
                              ? Column(
                                  children: [
                                    Text(
                                      "Adding",
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                      ),
                                    ),
                                    LinearProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  ],
                                )
                              : Text(
                                  "Add",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                  ),
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
