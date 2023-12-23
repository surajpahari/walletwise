import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletwise/controllers/auth/login_controller.dart';
import 'package:walletwise/features/auth/screen/password_config/forget_password.dart';
import 'package:walletwise/features/auth/screen/signup/signup_view.dart';
import 'package:walletwise/utils/validators/validation.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LoginController();
    return Form(
        key: controller.loginFormKey,
        child: Column(
          children: [
            TextFormField(
              controller: controller.email,
              validator: (value) => WwValidator.isInputEmpty(value),
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: controller.password,
              validator: (value) => WwValidator.isInputEmpty(value),
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text('Remember Me')
                  ],
                ),
                TextButton(
                    onPressed: () {
                      Get.to(() => const ForgetPassword());
                    },
                    child: const Text("Forget Password?"))
              ],
            ),
            ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.blue)),
                onPressed: () => (controller.login()),
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
