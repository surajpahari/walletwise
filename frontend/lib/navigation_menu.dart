import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletwise/screens/budget_screen.dart';
import 'package:walletwise/screens/history_screen.dart';
import 'package:walletwise/screens/main_screen.dart';
import 'package:walletwise/screens/stock_screen.dart';
import 'package:walletwise/utils/appbar/walletWiseBar.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: WalletWiseBar.barWithProfile(context, "Hello"),
      bottomNavigationBar: Obx(() => Visibility(
            visible: !controller.hideNavigationBar.value,
            child: BottomNavigationBar(
              currentIndex: controller.selectedIndex.value,
              onTap: (index) => controller.selectedIndex.value = index,
              selectedItemColor: Colors.green,
              unselectedItemColor: Colors.black,
              backgroundColor: Colors.grey[900],
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.money),
                  label: 'Budgets',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.bar_chart),
                  label: 'Stocks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.history),
                  label: 'Record',
                ),
              ],
            ),
          )),
      body: Obx(() => controller.screen[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final RxBool hideNavigationBar = false.obs;

  @override
  void onInit() {
    ever(Get.routing.obs, (_) {
      hideNavigationBar.value = Get.currentRoute != '/';
    });
    super.onInit();
  }

  final screen = [
    const MainScreen(),
    const BudgetScreen(),
    const StockScreen(),
    HistoryScreen(),
  ];
}
