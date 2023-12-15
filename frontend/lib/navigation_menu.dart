import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletwise/test.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationContorller());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("WalletWise"),
      ),
      backgroundColor: Colors.greenAccent,
      bottomNavigationBar: Obx(() => NavigationBar(
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                (controller.selectedIndex.value = index),
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: "Home"),
              NavigationDestination(icon: Icon(Icons.undo), label: "Budget"),
              NavigationDestination(
                  icon: Icon(Icons.bar_chart), label: "your stocks"),
              NavigationDestination(icon: Icon(Icons.history), label: "Record"),
              NavigationDestination(
                  icon: Icon(Icons.history), label: "options"),
            ],
          )),
      body: Obx(() => controller.screen[controller.selectedIndex.value]),
    );
  }
}

class NavigationContorller extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screen = [
    const WW(),
    Container(color: Colors.yellow),
    Container(color: Colors.blue),
    Container(color: Colors.green),
    Container(color: Colors.black),
  ];
}
