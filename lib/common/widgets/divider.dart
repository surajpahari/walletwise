import 'package:flutter/material.dart';

class Dividertext extends StatelessWidget {
  const Dividertext({super.key, required this.dividerText});
  final String dividerText;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Flexible(
            child: Divider(
          color: Colors.black,
          thickness: 0.5,
          indent: 40,
          endIndent: 5,
        )),
        Text(
          dividerText,
          style:
              const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        ),
        const Flexible(
            child: Divider(
          color: Colors.black,
          thickness: 0.5,
          indent: 5,
          endIndent: 40,
        )),
      ],
    );
  }
}
