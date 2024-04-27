import 'package:flutter/material.dart';
import 'package:walletwise/controllers/auth/change_password_controller.dart';

class ChangePasswordForm extends StatelessWidget {
  const ChangePasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ChangePasswordController();
    return Theme(
        data: ThemeData.dark(),
        child: Scaffold(
            backgroundColor: Colors.grey[900],
            appBar: AppBar(
              title: Text("Change Password"),
            ),
            body: Form(
                key: controller.changePasswordFormKey,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            10.0), // Adjust the value according to your preference
                        border:
                            Border.all(color: Colors.white), // Add border color
                      ),
                      child: TextFormField(
                        controller: controller.oldPassword,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Old Password',
                          border: InputBorder
                              .none, // Hide the default border of the input field
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15.0), // Adjust padding
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            10.0), // Adjust the value according to your preference
                        border:
                            Border.all(color: Colors.white), // Add border color
                      ),
                      child: TextFormField(
                        controller: controller.newPassword,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'New Password',
                          border: InputBorder
                              .none, // Hide the default border of the input field
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15.0), // Adjust padding
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            10.0), // Adjust the value according to your preference
                        border:
                            Border.all(color: Colors.white), // Add border color
                      ),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        controller: controller.confirmNewPassword,
                        decoration: InputDecoration(
                          labelText: 'Confirm New Password',
                          border: InputBorder
                              .none, // Hide the default border of the input field
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15.0), // Adjust padding
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(Colors.blue)),
                        onPressed: () => controller.changePassword(),
                        child: const Padding(
                          padding: EdgeInsets.all(6),
                          child: Text(
                            "Change Password",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ))));
  }
}
