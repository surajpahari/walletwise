import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletwise/controllers/auth/login_controller.dart';
import 'package:walletwise/features/auth/screen/password_config/forget_password.dart';
import 'package:walletwise/features/auth/screen/signup/signup_view.dart';
import 'package:walletwise/utils/validators/validation.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _passwordVisibility = true;
  @override
  Widget build(BuildContext context) {
    final controller = LoginController();
    return Form(
        key: controller.loginFormKey,
        child: Column(
          children: [
            TextFormField(
              controller: controller.email,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
                controller: controller.password,
                obscureText: _passwordVisibility,
                validator: (value) => WwValidator.isInputEmpty(value),
                decoration: InputDecoration(
                    hintText: 'Password',
                    suffix: InkWell(
                      child: InkWell(
                        onTap: _togglePasswordView,
                        child: const Icon(Icons.visibility),
                      ),
                    ))),
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
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll<Color>(Colors.green)),
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
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ))
          ],
        ));
  }

  void _togglePasswordView() {
    setState(() {
      _passwordVisibility = !_passwordVisibility;
    });
  }
}
