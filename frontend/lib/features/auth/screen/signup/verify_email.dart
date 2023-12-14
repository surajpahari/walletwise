import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletwise/features/auth/screen/login/login_view.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const Login()),
              icon: const Icon(Icons.close))
        ],
      ),
    );
  }
}
