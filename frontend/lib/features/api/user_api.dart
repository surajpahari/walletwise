import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:walletwise/features/api/api_token.dart';

class HttpProvider {
  final String baseUrl = 'http://127.0.0.1:8000';

  Future<bool> login(
      TextEditingController email, TextEditingController password) async {
    try {
      var response = await http.post(
        Uri.parse('$baseUrl/api/auth/login'),
        body: {
          'email': email.text,
          'password': password.text,
        },
      );
      if (response.statusCode == 200 && response.body.isNotEmpty) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        if (jsonResponse['status'] == true) {
          final String token = jsonResponse['token'];
          Get.find<TokenController>().setApiToken(token);
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }

  Future<dynamic> register(TextEditingController name,
      TextEditingController email, TextEditingController password) async {
    try {
      var response = await http.post(
        Uri.parse('$baseUrl/api/auth/register'),
        body: {
          'email': email.text,
          'password': password.text,
          'name': name.text,
          'password_confirmation': password.text,
        },
      );
      print(response.body);

      if (response.statusCode == 200 && response.body != '') {
        final String token = response.body;
        Get.put<TokenController>(TokenController());
        Get.find<TokenController>().setApiToken(token);
        print(token);

        return true;
      } else {
        print(false);
        return false;
      }
    } catch (error) {
      print(error);
    }
  }

  Future<dynamic> getWelcomeMessage() async {
    try {
      var response = await http.post(
        Uri.parse('$baseUrl/api/test'),
      );

      if (response.statusCode == 200 && response.body != '') {
        final String token = response.body;
        return token;
      } else {
        return false;
      }
    } catch (error) {
      return error;
    }
  }
}
