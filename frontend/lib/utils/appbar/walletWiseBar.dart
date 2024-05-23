import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletwise/constants/app_text.dart';
import 'package:walletwise/screens/profile_screen.dart';

class WalletWiseBar {
  static PreferredSizeWidget normalPageBar(title) {
    return AppBar(
      automaticallyImplyLeading: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text(title)],
      ),
    );
  }

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
        Builder(
          builder: (BuildContext context) {
            return IconButton(
              iconSize: 40,
              icon: const Icon(Icons.account_circle),
              onPressed: () {
                // Use the context obtained from the Builder widget
                Get.to(ProfileScreen());
                // Navigate to profile view here
                // Example: Navigator.pushNamed(context, '/profile');
              },
            );
          },
        ),
      ],
    );
  }
}
