import 'package:flutter/material.dart';

class SavinggoalController {
  final amount = TextEditingController();
  final endDate = TextEditingController();
  final title = TextEditingController();
  final note = TextEditingController();
  GlobalKey<FormState> savingGoalFormKey = GlobalKey<FormState>();
}

