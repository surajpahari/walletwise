import 'package:flutter/material.dart';
import 'package:walletwise/utils/cards/profit_card.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  void _hello(BuildContext context) {
    String? _selectedType; // Variable to hold the selected type
    TextEditingController amountController =
        TextEditingController(); // Controller for amount field

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Theme(
          data: ThemeData.dark(), // Use dark theme
          child: AlertDialog(
            backgroundColor: Colors.grey[900], // Dark background color
            title: Text(
              'Add new',
              style: TextStyle(color: Colors.white), // Title text color
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<String>(
                  value: _selectedType,
                  onChanged: (String? newValue) {
                    _selectedType = newValue!;
                  },
                  items: ['Type 1', 'Type 2', 'Type 3', 'Type 4']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                            color: Colors.white), // Dropdown item text color
                      ),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    labelText: 'Type',
                    labelStyle:
                        TextStyle(color: Colors.white), // Label text color
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: amountController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  style: TextStyle(color: Colors.white), // Text input color
                  decoration: InputDecoration(
                    labelText: 'Amount',
                    labelStyle:
                        TextStyle(color: Colors.white), // Label text color
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Close',
                  style: TextStyle(
                      color: Colors.white), // Action button text color
                ),
              ),
              TextButton(
                onPressed: () {
                  // Validate input fields and handle form submission
                  if (_selectedType != null &&
                      amountController.text.isNotEmpty) {
                    double amount = double.parse(amountController.text);
                    // Use _selectedType and amount as needed
                    print('Type: $_selectedType, Amount: $amount');
                    Navigator.of(context).pop();
                  } else {
                    // Show error message if fields are not filled
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please fill all fields')),
                    );
                  }
                },
                child: Text(
                  'Save',
                  style: TextStyle(
                      color: Colors.white), // Action button text color
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              width: double.infinity,
              child: Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                spacing: 16.0,
                runSpacing: 16.0,
                children: [
                  ProfitCard(
                    amount: "Rs 1500",
                    textColor: Colors.green,
                    icon: Icons.arrow_upward,
                    iconColor: Colors.green,
                  ),
                  ProfitCard(
                    amount: "Rs 1500",
                    textColor: Colors.red,
                    icon: Icons.arrow_downward,
                    iconColor: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 16.0,
          right: 16.0,
          child: FloatingActionButton(
            onPressed: () => _hello(context),
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
