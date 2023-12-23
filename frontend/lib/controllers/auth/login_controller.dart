import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:walletwise/api/fetcher.dart';
import 'package:walletwise/api/urls/app_urls.dart';
import 'package:walletwise/constants/token.dart';
import 'package:walletwise/navigation_menu.dart';

class LoginController extends ApiToken {
  //getting the single instance of class all over the application
  static LoginController get instance => Get.find();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  Future<dynamic> login() async {
    Object body = {
      'email': email.text,
      'password': password.text,
    };
    if (!loginFormKey.currentState!.validate()) {
      return;
    }

    await FetchAPI(ApiUrls.loginUrl, HttpMethod.post, body: body)
        .fetchUnauthorizedAPI()
        .then((response) => _handleSucessfullLogin(response));
  }

  void _handleSucessfullLogin(response) {
    if (response.statusCode != null) {
      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        if (responseData['status'] = true) {
          //filtering token from the token
          String token = responseData['token'];
          final List<String> tokenPart = token.split('|');
          if (tokenPart.length == 2) {
            final tokenString = tokenPart[1];
            ApiToken.authToken = tokenString;
            Get.to(const BottomNavigation());
          }
        }
      }
    }
  }
}
