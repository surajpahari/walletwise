import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletwise/screens/budget_screen.dart';
import 'package:walletwise/screens/main_screen.dart';
import 'package:walletwise/screens/stock_screen.dart';
import 'package:walletwise/test.dart';
import 'package:walletwise/theme/theme_constant.dart';
import 'package:walletwise/utils/appbar/walletWiseBar.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Theme(
      data: myTheme,
      child: Scaffold(
        appBar: WalletWiseBar.barWithProfile(context, "Hello"),
        bottomNavigationBar: Obx(() => Visibility(
              visible: !controller.hideNavigationBar.value,
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0), // Adjust padding as needed
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[900], // Set background color here
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.black.withOpacity(0.2), // Shadow color
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: BottomNavigationBar(
                          type: BottomNavigationBarType.fixed,
                          currentIndex: controller.selectedIndex.value,
                          onTap: (index) =>
                              controller.selectedIndex.value = index,
                          selectedLabelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          unselectedLabelStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                          ),
                          elevation: 0,
                          items: const [
                            BottomNavigationBarItem(
                              icon: Icon(Icons.home),
                              label: 'Home',
                            ),
                            BottomNavigationBarItem(
                              icon: Icon(Icons.account_balance_wallet),
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
                      ),
                    ),
                  )),
            )),
        body: Obx(() => controller.screen[controller.selectedIndex.value]),
      ),
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
    TestScreen()
  ];
}
