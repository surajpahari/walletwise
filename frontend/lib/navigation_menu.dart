import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletwise/constants/app_text.dart';
import 'package:walletwise/controllers/auth/logout_controller.dart';
import 'package:walletwise/screens/budget_screen.dart';
import 'package:walletwise/screens/main_screen.dart';
import 'package:walletwise/screens/profile_screen.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: AppText.title,
        // actions: [
        //   GestureDetector(
        //     onTap: () {
        //       Get.to(() => ProfileScreen());
        //     },
        //     child: CircleAvatar(
        //       backgroundImage: NetworkImage(
        //           'https://placekitten.com/100/100'), // Replace with your profile image URL
        //     ),
        //   ),
        //   SizedBox(width: 16.0),
        // ],
      ),
      backgroundColor: Colors.grey[900],
      bottomNavigationBar: Obx(() => Visibility(
        visible: !controller.hideNavigationBar.value,
        child: BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: (index) => controller.selectedIndex.value = index,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.black,
          backgroundColor: Colors.grey[900],
          items: [
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
  final RxBool hideNavigationBar = false.obs; // Added hideNavigationBar

  final screen = [
    const MainScreen(),
    const BudgetScreen(),
    Container(color: Colors.red),
    Container(color: Colors.green),
  ];
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // In this example, we just hide the bottom navigation bar when on the profile screen
    Get.find<NavigationController>().hideNavigationBar.value = true;
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Text('Profile Screen'),
      ),
    );
  }
}

