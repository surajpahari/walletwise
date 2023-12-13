import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletwise/features/auth/screen/signup/signup_view.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(labelText: 'Email'),
        ),
        const SizedBox(
          height: 30,
        ),
        TextFormField(
          decoration: const InputDecoration(labelText: 'Password'),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          children: [
            Checkbox(value: true, onChanged: (value) {}),
            const Text('Remember Me')
          ],
        ),
        ElevatedButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue)),
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.all(6),
              child: Text(
                "Sign in",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            )),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton(
            onPressed: () => (Get.to(() => const SignUpScreen())),
            child: const Text(
              "Create Account",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ))
      ],
    ));
  }
}
