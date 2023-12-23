import 'package:walletwise/api/fetcher.dart';
import 'package:walletwise/api/urls/app_urls.dart';
import 'package:get/get.dart';
import 'package:walletwise/constants/token.dart';
import 'package:walletwise/features/auth/screen/login/login_view.dart';

class LogoutController {
  LogoutController get instance => Get.find();

  Future<void> logout() async {
    try {
      await FetchAPI(ApiUrls.logoutUrl, HttpMethod.post)
          .fetchAuthorizedAPI()
          .then((response) => _handleLogout(response));
    } catch (error) {
      print('Logout failed: $error');
      // Handle error as needed
    }
  }

  _handleLogout(response) {
    if (response.statusCode != null && response.statusCode == 200) {
      // Clear the stored authentication token
      ApiToken.authToken = null;

      // Navigate to the login screen or wherever appropriate
      Get.to(const Login());
    } else {
      print('Logout failed with status code: ${response.statusCode}');
      // Handle logout failure as needed
    }
  }
}
