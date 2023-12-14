import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            const Text(
              "Forget Password",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
                child: TextFormField(
              decoration: const InputDecoration(labelText: "Enter your email"),
            )),
            const SizedBox(height: 20),
            ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.blue)),
                onPressed: () {},
                child: const Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ))),
          ],
        ));
  }
}
