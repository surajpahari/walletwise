import 'package:flutter/material.dart';
import 'package:walletwise/features/auth/controllers/singup/signup_controller.dart';
import 'package:get/get.dart';
import 'package:walletwise/utils/validators/validation.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
        key: controller.signupFormkey,
        child: Column(
          children: [
            Row(children: [
              Expanded(
                  child: TextFormField(
                controller: controller.firstName,
                validator: (value) => WwValidator.isInputEmpty(value),
                expands: false,
                decoration: const InputDecoration(labelText: 'firstName'),
              )),
              Expanded(
                  child: TextFormField(
                controller: controller.lastName,
                validator: (value) => WwValidator.isInputEmpty(value),
                expands: false,
                decoration: const InputDecoration(labelText: 'lastName'),
              ))
            ]),
            TextFormField(
              expands: false,
              controller: controller.email,
              validator: (value) => WwValidator.isInputEmpty(value),
              decoration: const InputDecoration(labelText: 'E-mail'),
            ),
            TextFormField(
              expands: false,
              controller: controller.phoneNumber,
              validator: (value) => WwValidator.isInputEmpty(value),
              decoration: const InputDecoration(labelText: 'Phone-Number'),
            ),
            TextFormField(
              expands: false,
              controller: controller.password,
              validator: (value) => WwValidator.isInputEmpty(value),
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: true,
                  onChanged: (value) {},
                ),
                const Text("I agree to Privacy Policy and Term of use.")
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.blue)),
                onPressed: () {
                  controller.signup();
                },
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'SignUp',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ))
          ],
        ));
  }
}
