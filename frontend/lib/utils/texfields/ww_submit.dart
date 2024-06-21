import "package:flutter/material.dart";

Container WwSubmit({required VoidCallback onPressed, required Widget child}) {
  return Container(
    constraints: const BoxConstraints(minWidth: 327),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(
            4.0), // Fixed padding to 8.0 for better spacing
        child: child,
      ),
    ),
  );
}
