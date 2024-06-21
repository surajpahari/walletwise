import 'package:flutter/material.dart';

class WwTextfield extends StatelessWidget {
  const WwTextfield({
    required this.controller,
    required this.icon,
    required this.validator,
    required this.label,
    super.key,
  });
  final TextEditingController controller;
  final Widget icon;
  final String label;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: icon,
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), // Make the border rounded
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), // Make the border rounded
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), // Make the border rounded
          borderSide: const BorderSide(color: Colors.blue),
        ),
      ),
    );
  }
}
