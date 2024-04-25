import 'package:flutter/material.dart';
import 'package:walletwise/utils/cards/income_card.dart';
import 'package:walletwise/utils/forms/income_form.dart';

class IncomeScreen extends StatefulWidget {
  const IncomeScreen({Key? key});
  void hello(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Theme(
          data: ThemeData.dark(), // Use dark theme
          child: AlertDialog(
            backgroundColor: Colors.grey[900], // Dark background color
            title: const Padding(
              padding: EdgeInsets.only(bottom: 20),
            ),
            content: IncomeForm(),
            // actions: [
            //   TextButton(
            //     onPressed: () {
            //       Navigator.of(context).pop();
            //     },
            //     child: const Text(
            //       'Close',
            //       style: TextStyle(
            //           color: Colors.white), // Action button text color
            //     ),
            //   ),
            //   TextButton(
            //     onPressed: () {
            //       // Validate input fields and handle form submission
            //       form.submit();
            //       Navigator.of(context).pop();
            //     },
            //     child: const Text(
            //       'Save',
            //       style: TextStyle(
            //           color: Colors.white), // Action button text color
            //     ),
            //   ),
            // ],
          ),
        );
      },
    );
  }

  @override
  State<IncomeScreen> createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
          Expanded(
            child: GridView(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 350, // Maximum width of each item
                mainAxisExtent: 300,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
              ),
              children: const [
                IncomeCard(),
                IncomeCard(),
                IncomeCard(),
                IncomeCard(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () => widget.hello(context),
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
