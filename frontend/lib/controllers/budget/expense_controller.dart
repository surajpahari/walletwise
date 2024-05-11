import "package:flutter/material.dart";
import "package:get/get.dart";

class ExpenseController {
  static ExpenseController get instance => Get.find();
  final item = TextEditingController();
  final amount = TextEditingController();
  final category = TextEditingController();
  final date = TextEditingController();
  GlobalKey<FormState> expenseFormKey = GlobalKey<FormState>();

  void add() {
    print(date.text.toString());
    print(item.text);
    print(amount.text);
  }
}
