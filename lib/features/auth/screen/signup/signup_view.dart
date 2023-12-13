import 'package:flutter/material.dart';
import 'package:walletwise/features/auth/screen/signup/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: const SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              //signUPTtile
              Text(
                "Create Your Account",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
              SizedBox(
                height: 20,
              ),
              SignUpForm()
            ],
          ),
        )));
  }
}
