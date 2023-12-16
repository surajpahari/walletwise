import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletwise/data/repositories/api_repository.dart';
import 'package:walletwise/features/api/user_api.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  final apiManager = ApiManager();
  GlobalKey<FormState> signupFormkey = GlobalKey<FormState>();

  //sign up
  Future<void> signup() async {
    try {
      //start loading screeen for the walletwise
      HttpProvider().register(firstName, email, password);
      // checks the internet connection
    } catch (e) {
      print(e);
    } finally {}
  }
}
