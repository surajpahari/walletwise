import 'package:flutter/material.dart';
import 'package:walletwise/screens/expense_screen.dart';
import 'package:walletwise/screens/income_screen.dart';

class BudgetScreen extends StatefulWidget {
  const BudgetScreen({Key? key}) : super(key: key);

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  int _selectedIndex = 1; // Initial selected index

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: _selectedIndex,
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          //backgroundColor: Colors.grey[900],
          elevation: 0.0,
          automaticallyImplyLeading: false,
          title: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = 0; // Update selected index
                      });
                    },
                    child: Container(
                      width: 120, // Set a fixed width here
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: _selectedIndex == 0
                            ? Colors.red[900] // Slightly lighter dark red
// Even darker red
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Text(
                          "Expenses",
                          style: TextStyle(
                            color: _selectedIndex == 0
                                ? Colors.white
                                : Colors.grey[400],
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = 1; // Update selected index
                      });
                    },
                    child: Container(
                      width: 120, // Set a fixed width here
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: _selectedIndex == 1
                            ? Colors.green[900]
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Text(
                          "Income",
                          style: TextStyle(
                            color: _selectedIndex == 1
                                ? Colors.white
                                : Colors.grey[400],
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
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
        body: _selectedIndex == 0 ? ExpenseScreen() : IncomeScreen(),
      ),
    );
  }
}
