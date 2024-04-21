import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletwise/api/fetcher.dart';
import 'package:walletwise/api/urls/app_urls.dart';

class ChangePasswordController {
  //getting the single instance of class all over the application
  static ChangePasswordController get instance => Get.find();
  final newPassword = TextEditingController();
  final oldPassword = TextEditingController();
  final confirmNewPassword = TextEditingController();
  GlobalKey<FormState> changePasswordFormKey = GlobalKey<FormState>();

  Future<dynamic> changePassword() async {
    print("here");
    Object body = {
      'oldPassword': oldPassword.text,
      'newPassword': newPassword.text,
    };
    if (changePasswordFormKey.currentState == null ||
        !changePasswordFormKey.currentState!.validate()) {
      print("there");
      return;
    }
    await FetchAPI(ApiUrls.testUrl, HttpMethod.get)
        .fetchAuthorizedAPI()
        .then((response) => _handleSucessfullPasswordChange(response));
  }

  void _handleSucessfullPasswordChange(response) {
    if (response.statusCode != null) {
      if (response.statusCode == 200) {
        print(response);
      }
    }
  }
}
