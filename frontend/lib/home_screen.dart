import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletwise/routes/routes.dart';
import 'package:walletwise/test.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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

    return Scaffold(
      backgroundColor: Colors.green[500],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: const EdgeInsets.only(bottom: 25),
                child: const Text(
                  'Welcome to the walletwise !!',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0),
                )),

            // const Text(
            //   'A complete financial wisdom.',
            //   style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0),
            // ),
            TextButton(
              onPressed: visitLogin,
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(getColor)),
              child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'Get Started',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Icon(
                          Icons.arrow_right,
                          color: Colors.white,
                          size: 24,
                        )
                      ])),
            ),
          ],
        ),
      ),
    );
  }
}
