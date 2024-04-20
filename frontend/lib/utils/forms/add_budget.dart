import 'package:flutter/material.dart';

class AddBudgetForm extends StatefulWidget {
  const AddBudgetForm({Key? key}) : super(key: key);

  @override
  _AddBudgetFormState createState() => _AddBudgetFormState();

  void submit() {
    print("hello");
  }
}

class _AddBudgetFormState extends State<AddBudgetForm> {
  TextEditingController itemController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  // Define your state variables here

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          style: const TextStyle(color: Colors.white), // Text input color
          controller: itemController,
        ),
        TextFormField(
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          style: const TextStyle(color: Colors.white), // Text input color
          controller: categoryController,
        ),
        TextFormField(
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          style: const TextStyle(color: Colors.white), // Text input color
          controller: amountController,
        ),
      ],
    );
  }
}
