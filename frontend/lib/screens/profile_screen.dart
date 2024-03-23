import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletwise/navigation_menu.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Text('Profile Screen'),
      ),
    );
  }
}
