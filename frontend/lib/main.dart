import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletwise/controllers/stocks/stock_fetch_controller.dart';
import 'app.dart';

void main() {
  Get.put(StockFetchController());
  runApp(const App());
}
