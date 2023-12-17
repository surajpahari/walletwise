import 'package:flutter/material.dart';
import 'package:walletwise/features/api/user_api.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: HttpProvider().test(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          // Render the response in the second Text widget
          return Padding(
            padding: const EdgeInsets.all(23),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Hi the message is"),
                Text(snapshot.data.toString()), // Render fetched data here
              ],
            ),
          );
        }
      },
    );
  }
}
