import "package:flutter/material.dart";
import "package:walletwise/theme/theme_constant.dart";

class Dialogbuilder {
  static void hello(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Theme(
            data: wwTheme, // Use dark theme
            child: AlertDialog(
              title: Padding(
                padding: EdgeInsets.only(bottom: 0),
                child: Center(
                    child: SingleChildScrollView(
                        child: Column(children: [
                  ElevatedButton(
                    onPressed: () {
                      print("ok");
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, // Background color
                      backgroundColor: Colors.red, // Text color
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15), // Button padding
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Button border radius
                      ),
                    ),
                    child: const Text("Expense"),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      print("ok");
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, // Background color
                      backgroundColor: Colors.red, // Text color
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15), // Button padding
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Button border radius
                      ),
                    ),
                    child: const Text("Saving goal"),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      print("ok");
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, // Background color
                      backgroundColor: Colors.red, // Text color
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15), // Button padding
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Button border radius
                      ),
                    ),
                    child: const Text("Assets"),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      print("ok");
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, // Background color
                      backgroundColor: Colors.red, // Text color
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15), // Button padding
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Button border radius
                      ),
                    ),
                    child: const Text("Debts"),
                  )
                ]))),
              ),
            ));
      },
    );
  }
}
