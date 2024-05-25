import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletwise/models/saving.dart';
import 'package:walletwise/controllers/budget/savinggoal_controller.dart';
import 'package:walletwise/theme/theme_constant.dart';
import 'package:walletwise/utils/date_picker.dart';
import 'package:walletwise/utils/appbar/walletWiseBar.dart';
import 'package:walletwise/utils/validators/validation.dart';

class SavingGoalForm extends StatelessWidget {
  const SavingGoalForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SavinggoalController();
    return Theme(
      data: myTheme,
      child: Scaffold(
          appBar: WalletWiseBar.normalPageBar("Add Saving Goal"),
          body: Form(
              key: controller.savingFormKey,
              child: Center(
                  child: Container(
                      constraints: BoxConstraints(maxWidth: 300),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: (value) =>
                                WwValidator.isInputEmpty(value),
                            controller: controller.title,
                            decoration: const InputDecoration(
                              prefix: Icon(Icons.title),
                              labelText: ("Title"),
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: controller.amount,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter the amount";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              prefix: Icon(Icons.attach_money),
                              labelText: ("Amount"),
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: controller.note,
                            decoration: const InputDecoration(
                              prefix: Icon(Icons.note),
                              labelText: ("Note"),
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          DatePicker(
                            controller: controller.endDate,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2025),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              constraints: BoxConstraints(minWidth: 250),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5))),
                                  onPressed: () {
                                    print(controller.formState.value);
                                    controller.addSaving(context);
                                    // ScaffoldMessenger.of(context).showSnackBar(
                                    //   SnackBar(
                                    //     content: Text('Yay! A SnackBar!'),
                                    //     duration: Duration(milliseconds: 100),
                                    //   ),
                                    // );
                                  },
                                  child: Obx(
                                    () => controller.formState.value == 1
                                        ? Column(children: [
                                            Text(
                                              "Adding",
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  color: Colors.white),
                                            ),
                                            LinearProgressIndicator(
                                                color: Colors.white)
                                          ])
                                        : Text(
                                            "Add",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 24),
                                          ),
                                  ))),
                        ],
                      ))))),
    );
  }
}
