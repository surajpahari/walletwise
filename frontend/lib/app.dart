import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:walletwise/home_screen.dart';
import 'package:walletwise/routes/routes.dart';
import 'package:walletwise/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WalletWise',
      darkTheme: WalletWiseTheme.darkTheme,
      theme: WalletWiseTheme.lightTheme,
      initialRoute: WalletWiseRoute.getHomeRoute(),
      getPages: WalletWiseRoute.routes,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return const HomeScreen();
  }
}
