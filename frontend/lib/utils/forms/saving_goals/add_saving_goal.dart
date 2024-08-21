import 'package:flutter/material.dart';
import 'package:walletwise/utils/date_picker.dart';
import 'package:walletwise/utils/texfields/ww_submit.dart';
import 'package:walletwise/utils/texfields/ww_textfield.dart';
import 'package:get/get.dart';
import 'package:walletwise/utils/gaps/Xgap.dart';
import 'package:walletwise/controllers/budget/savinggoal_controller.dart';
import 'package:walletwise/theme/theme_constant.dart';
import 'package:walletwise/utils/appbar/walletWiseBar.dart';

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
              constraints: const BoxConstraints(maxWidth: 300),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  WwTextfield(
                      label: "Name",
                      controller: controller.name,
                      icon: const Icon(Icons.title),
                      validator: (value) {
                        return null;
                      }),
                  gapY("md"),
                  WwTextfield(
                      label: "Amount",
                      controller: controller.amount,
                      icon: const Icon(Icons.title),
                      validator: (value) {
                        return null;
                      }),
                  const SizedBox(height: 20),
                  DatePicker(
                    controller: controller.endDate,
                    firstDate: DateTime(2023),
                    lastDate: DateTime(2025),
                  ),
                  gapY("md"),
                  WwSubmit(
                      onPressed: () {
                        controller.addSaving(context);
                      },
                      child: Obx(
                        () => controller.formState.value == 1
                            ? const Column(
                                children: [
                                  Text(
                                    "Adding",
                                    style: TextStyle(
                                        fontSize: 24, color: Colors.white),
                                  ),
                                  LinearProgressIndicator(color: Colors.white),
                                ],
                              )
                            : const Text(
                                "Add",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24),
                              ),
                      )),
                  Obx(
                    () => controller.formState.value == 1
                        ? const Column(
                            children: [
                              Text(
                                "Adding",
                                style: TextStyle(
                                    fontSize: 24, color: Colors.white),
                              ),
                              LinearProgressIndicator(color: Colors.white),
                            ],
                          )
                        : const Text(
                            "Add",
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
