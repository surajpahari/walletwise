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
        children: [Expanded(child: Text(overflow: TextOverflow.fade, title))],
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
      title: const Text(
        "WalletWise",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
      ),
      centerTitle: true, // Ensures the title is centered horizontally
      actions: [
        IconButton(
          iconSize: 30,
          icon: const Icon(Icons.person),
          color: Colors.white,
          onPressed: () {
            Get.to(ProfileScreen());
          },
        ),
      ],
    );
  }
}
