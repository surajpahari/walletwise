import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        Row(children: [
          Expanded(
              child: TextFormField(
            expands: false,
            decoration: const InputDecoration(labelText: 'firstName'),
          )),
          Expanded(
              child: TextFormField(
            expands: false,
            decoration: const InputDecoration(labelText: 'lastName'),
          ))
        ]),
        TextFormField(
          expands: false,
          decoration: const InputDecoration(labelText: 'E-mail'),
        ),
        TextFormField(
          expands: false,
          decoration: const InputDecoration(labelText: 'Phone-Number'),
        ),
        TextFormField(
          expands: false,
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
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue)),
            onPressed: () {},
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
