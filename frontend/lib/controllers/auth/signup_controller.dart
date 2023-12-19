import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletwise/api/fetcher.dart';
import 'package:walletwise/api/urls/app_urls.dart';
import 'package:walletwise/constants/token.dart';
import 'package:walletwise/features/auth/screen/login/login_view.dart';

class SignUpController extends ApiToken {
  //getting the single instance of class all over the application
  static SignUpController get instance => Get.find();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormkey = GlobalKey<FormState>();
  Future<dynamic> signUp() async {
    Object body = {
      'email': email.text,
      'password': password.text,
      'name': '${firstName.text} ${lastName.text}',
      'password_confirmation': password.text,
    };
    await FetchAPI(ApiUrls.signupUrl, HttpMethod.post, body: body)
        .fetchAuthorizedAPI()
        .then((response) => _handleSucessfullSingup(response));
  }

  void _handleSucessfullSingup(response) {
    if (response.statusCode != null) {
      if (response.statusCode == 200) {
        Get.to(const Login());
      }
    }
  }
}
