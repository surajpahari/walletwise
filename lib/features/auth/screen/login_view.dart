import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: const Text('WalletWise')),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'walletwise',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
                Form(
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
                        onPressed: () {},
                        child: const Text(
                          "Sign in",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                    ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          "Create Account",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ))
                  ],
                )),
                const SizedBox(
                  height: 45,
                ),
                const Row(
                  children: [
                    Flexible(
                        child: Divider(
                      color: Colors.black,
                      thickness: 0.5,
                      indent: 40,
                      endIndent: 5,
                    )),
                    Text(
                      'Or SignIn with',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                    Flexible(
                        child: Divider(
                      color: Colors.black,
                      thickness: 0.5,
                      indent: 5,
                      endIndent: 40,
                    )),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('Google')],
                )
              ],
            ),
          ),
        ));
  }
}
