import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:walletwise/api/urls/app_urls.dart';
import 'package:walletwise/constants/app_constant.dart';
import 'package:walletwise/constants/token.dart';

enum HttpMethod { post, get, delete, put }

class FetchAPI extends ApiToken {
  static int totalCall = 0;
  final String baseUrl;
  bool isAuth;
  Url url;
  Object body;
  HttpMethod method;
  FetchAPI(this.url, this.method,
      {this.body = const {},
      this.isAuth = false,
      this.baseUrl = AppConstant.baseUrl});
  Future<dynamic> fetchUnauthorizedAPI() async {
    try {
      if (method == HttpMethod.post) {
        final response = await http.post(
          Uri.parse('$baseUrl${url.value}'),
          // Send authorization headers to the backend.
          body: body,
        );
        return response;
      } else if (method == HttpMethod.get) {
        final response = await http.get(
          Uri.parse('$baseUrl${url.value}'),
          // Send authorization headers to the backend.
        );
        return response;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> fetchAuthorizedAPI() async {
    if (ApiToken.authToken != null) {
      try {
        if (method == HttpMethod.post) {
          final response = await http.post(Uri.parse('$baseUrl${url.value}'),
              // Send authorization headers to the backend.
              body: body,
              headers: {
                'Authorization': 'Bearer ${ApiToken.authToken}',
                'Accept': 'application/json'
              });

          return response;
        } else if (method == HttpMethod.get) {
          final response = await http.get(Uri.parse('$baseUrl${url.value}'),
              // Send authorization headers to the backend.
              headers: {
                'Authorization': 'Bearer ${ApiToken.authToken}',
                'Accept': 'application/json'
              });
          return response;
        }
      } catch (e) {
        print(e);
      }
    }
  }
}
