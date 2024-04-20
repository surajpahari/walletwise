import 'package:flutter/material.dart';

class ChangePasswordForm extends StatelessWidget {
  const ChangePasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                10.0), // Adjust the value according to your preference
            border: Border.all(color: Colors.white), // Add border color
          ),
          child: TextFormField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Old Password',
              border: InputBorder
                  .none, // Hide the default border of the input field
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15.0), // Adjust padding
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
            border: Border.all(color: Colors.white), // Add border color
          ),
          child: TextFormField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'New Password',
              border: InputBorder
                  .none, // Hide the default border of the input field
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15.0), // Adjust padding
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
            border: Border.all(color: Colors.white), // Add border color
          ),
          child: TextFormField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Confirm New Password',
              border: InputBorder
                  .none, // Hide the default border of the input field
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15.0), // Adjust padding
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue)),
            onPressed: () => (),
            child: const Padding(
              padding: EdgeInsets.all(6),
              child: Text(
                "Change",
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
    ));
  }
}

