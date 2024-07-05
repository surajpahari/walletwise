import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletwise/data/expense_data.dart';
import 'dart:convert';
import 'package:walletwise/api/fetcher.dart';
import 'package:walletwise/api/urls/app_urls.dart';
import 'package:walletwise/constants/token.dart';
import 'package:walletwise/controllers/budget/balance_card_controller.dart';
import 'package:walletwise/controllers/budget/bank_controller.dart';
import 'package:walletwise/controllers/budget/payment_controller.dart';
import 'package:walletwise/controllers/budget/savinggoal_controller.dart';
import 'package:walletwise/data/bank_account.dart';
import 'package:walletwise/navigation_menu.dart';

class LoginController extends ApiToken {
  //getting the single instance of class all over the application
  static LoginController get instance => Get.find();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  Future<dynamic> login() async {
    print("wait");
    Object body = {
      'email': email.text,
      'password': password.text,
    };
    if (!loginFormKey.currentState!.validate()) {
      return;
    }

    try {
      await FetchAPI(ApiUrls.loginUrl, HttpMethod.post, body: body)
          .fetchUnauthorizedAPI()
          .then((response) => _handleSucessfullLogin(response));
    } catch (e) {
      print(e);
    }
  }

  void _handleSucessfullLogin(response) {
    //Get.to(const BottomNavigation());
    //return;
    print("yes");
    if (response.statusCode != null) {
      print("No");
      if (response.statusCode == 200) {
        print("3");
        var responseData = json.decode(response.body);

        if (responseData['status'] == true) {
          print("yes");
          //filtering token from the token
          String token = responseData['token'];
          ApiToken.authToken = token;
          Get.to(const BottomNavigation());
          BalanceCardController.fetchBalanceCardData();
          BankAccController.fetchBankAccount();
          SavinggoalController.fetchSaving();
          PaymentController.fetchPayment();
        } else {
          print("No");
        }
      } else {
        print(response.body);
      }
    }
  }
}
