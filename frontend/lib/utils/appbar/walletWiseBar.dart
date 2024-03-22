import 'package:flutter/material.dart';
import 'package:walletwise/constants/app_text.dart';

class WalletWiseBar {
  static PreferredSizeWidget normalBar = AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.grey[900],
    foregroundColor: Colors.white,
    title: const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText.title,
      ],
    ),
  );

  static PreferredSizeWidget titleBar(String title) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.grey[900],
      foregroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title),
        ],
      ),
    );
  }

  static PreferredSizeWidget barWithProfile(
      BuildContext context, String title) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.grey[900],
      foregroundColor: Colors.white,
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "WalletWise",
            style: TextStyle(fontSize: 24),
          )
        ],
      ),
      actions: [
        IconButton(
          iconSize: 40,
          icon: const Icon(Icons.account_circle),
          onPressed: () {
            // Navigate to profile view here
            // Example: Navigator.pushNamed(context, '/profile');
          },
        ),
      ],
    );
  }
}
