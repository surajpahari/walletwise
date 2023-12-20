import 'package:flutter/material.dart';
import 'package:walletwise/common/widgets/divider.dart';
import 'package:walletwise/common/widgets/social_buttons.dart';
import 'package:walletwise/features/auth/screen/login/login_form.dart';

class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text(
              'WalletWise',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            )),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Heading of the Login form
                LoginForm(),
                SizedBox(
                  height: 45,
                ),
                Dividertext(dividerText: "or login with"),
                SizedBox(height: 30),
                SocialButtons()
              ],
            ),
          ),
        ));
  }
}
