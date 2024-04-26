import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletwise/routes/routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void visitLogin() {
      Get.toNamed(WalletWiseRoute.getLoginRoute());
    }

    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.green;
      }
      return Colors.blue;
    }

    return Theme(
        data: ThemeData.dark(),
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.only(bottom: 25),
                    child: const Text(
                      'Welcome to the walletwise !!',
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 40.0),
                    )),

                GestureDetector(
                  onTap: visitLogin,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      border: Border.all(
                          color: Colors
                              .grey), // Add border similar to YouTube's style
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'Get Started',
                          style: TextStyle(
                            color: Colors.white, // Adjust text color
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white, // Adjust icon color
                          size: 24,
                        ),
                      ],
                    ),
                  ),
                ),

                // const Text(
                //   'A complete financial wisdom.',
                //   style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0),
                // ),
              ],
            ),
          ),
        ));
  }
}
