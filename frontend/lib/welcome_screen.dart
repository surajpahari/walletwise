import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletwise/constants/app_colors.dart';
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
                      "WalletWise",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 45.0),
                    )),

                Container(
                    margin: const EdgeInsets.only(bottom: 25),
                    child: const Text(
                      "Money Management without \n the migraines.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    )),
                SizedBox(height: 30),

                GestureDetector(
                  onTap: visitLogin,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xff2517DB), Color(0xff1180D1)]),
                      borderRadius: BorderRadius.circular(25.0),
                      // Add border similar to YouTube's style
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
                SizedBox(
                    height: 30), // Add space between the button and the image
                Container(
                  constraints: BoxConstraints(maxHeight: 800),
                  child: Image.asset(
                    'assets/mainbanner.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
