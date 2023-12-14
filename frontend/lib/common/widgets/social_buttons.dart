import 'package:flutter/material.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Image(
          image: AssetImage('assets/socials/google.png'),
          width: 40,
          height: 40,
        ),
        Container(
          decoration: const BoxDecoration(),
        )
      ],
    );
  }
}
