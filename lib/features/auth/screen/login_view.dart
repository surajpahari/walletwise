import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        margin: const EdgeInsets.all(15),
        child: const Text("Welcome to the login page"),
      ),
    );
  }
}
