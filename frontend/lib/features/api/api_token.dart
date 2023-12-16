import 'package:get/get.dart';

class TokenController extends GetxController {
  RxString apiToken = ''.obs;

  void setApiToken(String token) {
    apiToken.value = token;
  }

  String getApiToken() {
    return apiToken.value;
  }
}
