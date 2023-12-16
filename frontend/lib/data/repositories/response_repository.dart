import "package:walletwise/data/repositories/api_repository.dart";
import "package:http/http.dart" as http;
import "dart:io";
import "dart:convert";

class WwResponse {
  final ApiManager apiManager;

  WwResponse({required this.apiManager});

  Future<Map<String, dynamic>> fetch(String url) async {
    if (apiManager.apiToken == null) {
      throw Exception('API token not available');
    }

    final response = await http.get(
      Uri.parse(url),
      // Send authorization headers to the backend.
      headers: {
        HttpHeaders.authorizationHeader: 'Basic ${apiManager.apiToken}',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<Map<String, dynamic>> fetchData(String url) async {
    try {
      return await fetch(url);
    } catch (e) {
      // Handle error, e.g., log or throw a custom exception.
      print('Error fetching data: $e');
      rethrow;
    }
  }
}
