import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletwise/features/api/user_api.dart';
import 'package:walletwise/navigation_menu.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> signupFormkey = GlobalKey<FormState>();

  //sign up
  Future<void> login() async {
    try {
      //start loading screeen for the walletwise
      await HttpProvider()
          .login(email, password)
          .then((value) => value ? Get.to(const BottomNavigation()) : () {});
      // checks the internet connection
    } catch (e) {
    } finally {}
  }
}
