import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:walletwise/api/urls/app_urls.dart';
import 'package:walletwise/constants/app_constant.dart';

enum HttpMethod { post, get, delete, put }

class FetchAPI {
  static int totalCall = 0;
  final baseUrl = AppConstant.baseUrl;
  bool isAuth;
  Url url;
  HttpMethod method;
  FetchAPI(this.url, this.method, {this.isAuth = false});
  Future<dynamic> fetchAuthorizedAPI() async {
    try {
      print('$baseUrl${url.value}');
      final response = await http.post(
        Uri.parse('$baseUrl${url.value}'),
        // Send authorization headers to the backend.
      );
      print(response.body);
      return response;
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> fetchUnAuthorizedAPI() async {}
}
