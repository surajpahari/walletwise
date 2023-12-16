import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletwise/features/api/api_token.dart';
import 'app.dart';

void main() {
  Get.put<TokenController>(TokenController());
  runApp(const App());
}
