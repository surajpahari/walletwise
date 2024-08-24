import 'package:flutter/material.dart';
import 'package:walletwise/common/widgets/divider.dart';
import 'package:walletwise/common/widgets/social_buttons.dart';
import 'package:walletwise/features/auth/screen/login/login_form.dart';

class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData.dark(),
        child: Scaffold(
            backgroundColor: Colors.grey[900],
            appBar: AppBar(
                centerTitle: true,
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
                    SizedBox(
                      height: 40,
                    ),
                    LoginForm(),
                    SizedBox(
                      height: 45,
                    ),
                  ],
                ),
              ),
            )));
  }
}
