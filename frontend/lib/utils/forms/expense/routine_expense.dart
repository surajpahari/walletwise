import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletwise/controllers/budget/expense_controller.dart';
import 'package:walletwise/utils/inputs/test_input.dart';
import 'package:walletwise/utils/date_picker.dart';
import 'package:walletwise/utils/gaps/Xgap.dart';
import 'package:walletwise/utils/inputs/search_input.dart';
import 'package:walletwise/utils/texfields/ww_submit.dart';
import 'package:walletwise/utils/texfields/ww_textfield.dart';

class RoutineExpenseForm extends StatelessWidget {
  const RoutineExpenseForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = ExpenseController();

    return Form(
        key: controller.expenseFormKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              WwTextfield(
                controller: controller.item,
                icon: const Icon(Icons.title),
                validator: (value) {
                  return null;
                },
                label: 'Item',
              ),
              gapY("md"),
              SearchInput(
                label: "Category",
                //context: context,
              ),
              gapY("md"),
              SearchInput(
                label: "Source",
                //context: context,
              ),
              gapY("md"),
              WwTextfield(
                controller: controller.amount,
                icon: const Icon(Icons.title),
                validator: (value) {
                  return null;
                },
                label: 'Amount',
              ),
              gapY("md"),
              DatePicker(
                label: "Last Paid at",
                controller:
                    controller.date, // Ensure this is a TextEditingController
                firstDate: DateTime(2023),
                lastDate: DateTime.now(),
              ),
              gapY("md"),
              WwSubmit(
                  onPressed: () {},
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
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                  ))
            ],
          ),
        ));
  }
}
