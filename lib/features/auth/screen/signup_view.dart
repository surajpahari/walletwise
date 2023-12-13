import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              //signUPTtile
              const Text(
                "Create Your Account",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
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
                    decoration:
                        const InputDecoration(labelText: 'Phone-Number'),
                  ),
                  TextFormField(
                    expands: false,
                    decoration: const InputDecoration(labelText: 'Password'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll<Color>(Colors.blue)),
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
              ))
            ],
          ),
        )));
  }
}
