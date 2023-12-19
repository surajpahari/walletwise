import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:walletwise/api/urls/app_urls.dart';
import 'package:walletwise/constants/app_constant.dart';
import 'package:walletwise/constants/token.dart';

enum HttpMethod { post, get, delete, put }

class FetchAPI extends ApiToken {
  static int totalCall = 0;
  final baseUrl = AppConstant.baseUrl;
  bool isAuth;
  Url url;
  Object body;
  HttpMethod method;
  FetchAPI(this.url, this.method, {this.body = const {}, this.isAuth = false});
  Future<dynamic> fetchUnauthorizedAPI() async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl${url.value}'),
        // Send authorization headers to the backend.
        body: body,
      );
      print(response.body);
      return response;
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> fetchAuthorizedAPI() async {
    if (ApiToken.authToken != null) {
      try {
        final response = await http.post(Uri.parse('$baseUrl${url.value}'),
            // Send authorization headers to the backend.
            body: body,
            headers: {'Authorization': 'Bearer ${ApiToken.authToken}'});
        print(response.body);
        return response;
      } catch (e) {
        print(e);
      }
    }
  }
}
