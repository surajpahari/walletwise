import "package:flutter/material.dart";
import "package:get/get.dart";

class StockController {
  static StockController get instance => Get.find();
  final searchQuery = TextEditingController();
}

