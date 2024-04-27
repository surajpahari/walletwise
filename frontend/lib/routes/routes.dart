import 'package:get/get.dart';
import 'package:walletwise/features/auth/screen/login/login_view.dart';
import 'package:walletwise/welcome_screen.dart';

class WalletWiseRoute {
  static String home = '/';
  static String login = '/login';
  static String getHomeRoute() => home;
  static String getLoginRoute() => login;
  static List<GetPage> routes = [
    GetPage(page: () => WelcomeScreen(), name: home),
    GetPage(page: () => Login(), name: login)
  ];
}
