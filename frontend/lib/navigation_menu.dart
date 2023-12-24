import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletwise/controllers/auth/logout_controller.dart';
import 'package:walletwise/screens/budget_screen.dart';
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
            destinations: [
              const NavigationDestination(
                  icon: Icon(Icons.home), label: "Home"),
              const NavigationDestination(
                  icon: Icon(Icons.money), label: "Budget"),
              const NavigationDestination(
                  icon: Icon(Icons.bar_chart), label: "your stocks"),
              const NavigationDestination(
                  icon: Icon(Icons.history), label: "Record"),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                ElevatedButton(
                    onPressed: () => LogoutController().logout(),
                    child: const Icon(Icons.logout)),
                const Text("Logout")
              ])
            ],
          )),
      body: Obx(() => controller.screen[controller.selectedIndex.value]),
    );
  }
}

class NavigationContorller extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screen = [
    const Test(),
    const BudgetScreen(),
    Container(color: Colors.blue),
    Container(color: Colors.green),
  ];
}
