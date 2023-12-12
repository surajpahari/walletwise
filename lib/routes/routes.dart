import 'package:get/get.dart';
import 'package:walletwise/features/auth/screen/login_view.dart';
import 'package:walletwise/home_screen.dart';

class WalletWiseRoute {
  static String home = '/';
  static String login = '/login';
  static String getHomeRoute() => home;
  static String getLoginRoute() => login;
  static List<GetPage> routes = [
    GetPage(page: () => const HomeScreen(), name: home),
    GetPage(page: () => const Login(), name: login)
  ];
}
