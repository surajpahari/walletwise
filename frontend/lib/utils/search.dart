import 'package:flutter/material.dart';

class ExpenseSearchBar extends StatelessWidget {
  const ExpenseSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      overlayColor: MaterialStateProperty.all<Color>(Colors.white),
      constraints: BoxConstraints(maxWidth: 500, minHeight: 45),
    );
  }
}
