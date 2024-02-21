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
          decoration: const InputDecoration(
            labelText: 'Item',
            labelStyle: TextStyle(color: Colors.white), // Label text color
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          style: const TextStyle(color: Colors.white), // Text input color
          controller: categoryController,
          decoration: const InputDecoration(
            labelText: 'Category',
            labelStyle: TextStyle(color: Colors.white), // Label text color
          ),
        ),
        TextFormField(
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          style: const TextStyle(color: Colors.white), // Text input color
          controller: amountController,
          decoration: const InputDecoration(
            labelText: 'Amount',
            labelStyle: TextStyle(color: Colors.white), // Label text color
          ),
        ),
      ],
    );
  }
}
